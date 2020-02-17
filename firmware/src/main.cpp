#include <Arduino.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <DNSServer.h>
#include <Wire.h>
#include <Preferences.h>
#include <SPIFFS.h>

// From the /include/ folder (the order they're included in here matters!)
#include "pins.hpp"
#include "eepromInit.hpp"
#include "globals.hpp"
#include "startEeprom.hpp"
#include "station.hpp"
#include "routerMethods.hpp"


void setup(void){
  // Set the FET output HIGH (i.e. turn output off)
  pinMode(OUTPUT_PIN, OUTPUT);
  digitalWrite(OUTPUT_PIN, HIGH);

  // Check if the factory-reset pads are shorted:
  // Set GPIO13 (pin 12) to input_pullup
  // Set GPIO15 (pin 13) to output, LOW
  pinMode(FACTORY_RESET_1, INPUT_PULLUP);
  pinMode(FACTORY_RESET_2, OUTPUT);
  digitalWrite(FACTORY_RESET_2, LOW);
  bool factoryReset = false;
  if (!digitalRead(FACTORY_RESET_1)) {
    factoryReset = true;
  }
  digitalWrite(FACTORY_RESET_2, HIGH);

  // Begin serial link at 115200 baud
  Serial.begin(115200);

  // Turn on file system
  SPIFFS.begin();
  
  // Turn on EEPROM, read data
  startEEPROM(factoryReset);

  // If byte 0 is 0x00, set up a soft AP; else set up station
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
  
  // On POST request to /reset, reboot the ESP
  server.on("/reset", HTTP_POST, handleResetPost);

  // On GET requests to .js files, serve the .js files
  server.on("/configure.js", HTTP_GET, []() {
    handleJS("/configure.js");
  });
  server.on("/esp32.js", HTTP_GET, []() {
    handleJS("/esp32.js");
  });

  // Serve favicon
  server.on("/favicon.ico", HTTP_GET, handleFavicon);

  // On any other type of request, serve the control panel
  // server.onNotFound(handleRoot);
  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void){
  dnsServer.processNextRequest();
  server.handleClient();
}
