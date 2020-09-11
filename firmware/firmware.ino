#include <ArduinoJson.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <DNSServer.h>
#include <HTTPClient.h>
#include <Wire.h>
#include <Preferences.h>
#include <SPIFFS.h>
#include <driver/dac.h>

// From the /include/ folder (the order they're included in here matters!)
#include "pins.hpp"
#include "battery.hpp"
#include "eepromInit.hpp"
#include "globals.hpp"
#include "startEeprom.hpp"
#include "station.hpp"
#include "routerMethods.hpp"
#include "routerPatterns.hpp"

// This one is ignored by git because it's got my personal twitter cert in it
#include "twitterCert.hpp"

// Timing variables
int hasRunFor = 0;
int mustRunFor = 0;
bool isRunning = false;

void setup(void) {
  // Set the FET output HIGH (i.e. turn output off)
  sigmaDeltaSetup(0, 300);
  sigmaDeltaAttachPin(OUTPUT_PIN, 0);
  sigmaDeltaWrite(0, 255);

  // Begin serial link at 115200 baud
  Serial.begin(115200);

  // Check if the factory-reset pads are shorted:
  // Set factory-reset pin to input_pullup
  pinMode(FACTORY_RESET_PIN, INPUT_PULLUP);
  bool factoryReset = false;
  if (!digitalRead(FACTORY_RESET_PIN)) {
    factoryReset = true;
    Serial.println("Factory Reset");
  } else {
    Serial.println("No factory reset");
  }

  // Set DAC voltage test for GPIO 25 (DAC channel 1)
  // Approx 12.126 mV per bit
  dac_output_enable(DAC_CHANNEL_1);
  setBatteryLevel(1.80);
//  dac_output_voltage(DAC_CHANNEL_1, 128); // 2.60 V
//  dac_output_voltage(DAC_CHANNEL_1, 160); // 2.21 V
//  dac_output_voltage(DAC_CHANNEL_1, 180); // 1.97 V
//  dac_output_voltage(DAC_CHANNEL_1, 200); // 1.73 V
//  dac_output_voltage(DAC_CHANNEL_1, 210); // 1.60 V
//  dac_output_voltage(DAC_CHANNEL_1, 220); // 1.49 V
//  dac_output_voltage(DAC_CHANNEL_1, 230); // 1.36 V
//  dac_output_voltage(DAC_CHANNEL_1, 240); // 1.24 V
//  dac_output_voltage(DAC_CHANNEL_1, 255); // 1.06 V

  // Turn on file system
  SPIFFS.begin();

  // Turn on EEPROM, read data, perform a factory reset if the factory-reset pins are shorted
  startEEPROM(factoryReset);

  // If byte 0 is 0x00, set up a soft access point; else set up station
  if (eeprom.wifiType == 0x00) {
    Serial.println("Starting Soft AP");
    startSoftAP();
    // startSoftAP(eeprom.deviceName, dnsServer, DNS_PORT);
  } else {
    Serial.println("Connecting to Wi-Fi");
    // startStation(eeprom, dnsServer, DNS_PORT);
    startStation();
  }


  // On a GET request to /, serve the control panel
  server.on("/", HTTP_GET, handleRoot);

  // On POST request to /settings, change the Wi-Fi configuration
  server.on("/settings", HTTP_POST, handleSettingsPost);

  // On POST request to /power, change the output voltage
  server.on("/power", HTTP_POST, handlePowerPost);

  // On POST request to /reset, reboot the ESP
  server.on("/reset", HTTP_POST, handleResetPost);
  
  // On POST request to /runpattern, update the pattern being run on the battery
  server.on("/runpattern", HTTP_POST, handlePatternPost);

  // On GET requests to .js files, serve the .js files
  server.on("/configure.js", HTTP_GET, []() {
    handleJS("/configure.js");
  });
  server.on("/network.js", HTTP_GET, []() {
    handleJS("/network.js");
  });
  server.on("/battery.js", HTTP_GET, []() {
    handleJS("/battery.js");
  });
  server.on("/pattern.js", HTTP_GET, []() {
    handleJS("/pattern.js");
  });

  // Serve favicon
  server.on("/favicon.ico", HTTP_GET, handleFavicon);

  // On any other type of request, serve the control panel
  // server.onNotFound(handleRoot);
  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void) {
  float battLevel = getBatteryLevel();
  if (battLevel < 3.4) {
    sigmaDeltaWrite(0, 255);
    ESP.deepSleep(0);
    delay(10000);
  }
  dnsServer.processNextRequest();
  server.handleClient();
  // If more than 20 seconds have elapsed, check twitter
  currTime = millis();
  if (currTime - prevTime > 20000) {
    HTTPClient http;
    http.begin("https://api.twitter.com/2/tweets/1304465499644977155?expansions=attachments.poll_ids&tweet.fields=public_metrics");
    http.addHeader("Content-Type", "application/json");
    http.addHeader("Authorization", twitterCert);

    int httpResponseCode = http.GET();
    String payload = "{}";
    payload = http.getString();
    Serial.println("twitter");
    Serial.println(payload);

    // Parse payload as JSON
    StaticJsonDocument<800> myJson;
    deserializeJson(myJson, payload);

    // Get likes+retweets
    int retweets = 1 + myJson["data"]["public_metrics"]["retweet_count"].as<int>() + myJson["data"]["public_metrics"]["quote_count"].as<int>();
    int likes = 1 + myJson["data"]["public_metrics"]["like_count"].as<int>();
    mustRunFor = 1000 * (30*retweets + 10*likes);

    // Get poll results
    auto poll = myJson["includes"]["polls"][0];
    auto optionA = poll["options"][0];
    auto optionB = poll["options"][1];
    float upvotes = 0;
    float downvotes = 0;
    if (optionA["position"] == 1) {
      upvotes = optionA["votes"].as<float>();
      downvotes = optionB["votes"].as<float>();
    }
    else {
      upvotes = optionB["votes"].as<float>();
      downvotes = optionA["votes"].as<float>();
    }

    // Use poll results to set intensity
    if (upvotes + downvotes == 0) {downvotes++;} // This just stops us from ever dividing by zero
    float pollResult = upvotes/(upvotes+downvotes);
    int motorIntensity = (int)(63*(1 - pollResult)); // Min intensity: 50% (because I can't feel anything less than that on my particular vibe)

    // Update time vibe has run for
    if (isRunning) {
      hasRunFor += (currTime - prevTime);  
    }

    // If the vibe has run for less than the proscribed time, update vibe with intensity
    if (hasRunFor < mustRunFor) {
      isRunning = true;
      sigmaDeltaWrite(0, motorIntensity);
    } else {
      isRunning = false;
      sigmaDeltaWrite(0, 255);
    }
    
    Serial.print("intensity: ");
    Serial.println(upvotes/(downvotes+upvotes));
    
//    Serial.println(myJson["data"]["text"].as<char*>());
    
    prevTime = currTime;
    http.end();
  }
}
