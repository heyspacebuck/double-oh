#include <Arduino.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <DNSServer.h>
#include <Wire.h>
#include <Preferences.h>
#include <SPIFFS.h>

// From the /include/ folder
#include "eepromMethods.hpp"

#include "station.hpp"

// Hardware pins
// For the WL model: the output is GPIO15(!!!), I2C SDA is GPIO16, I2C SCL is GPIO14, factory reset is GPIO12 and GPIO13
// For the finished model: output is GPIO10, I2C SDA is GPIO16, I2C SCL is GPIO14, factory reset is GPIO13 and GPIO15
#define OUTPUT_PIN 15
#define I2C_SCL 14
#define I2C_SDA 16
#define FACTORY_RESET_1 12
#define FACTORY_RESET_2 13

// Static IP address configuration
IPAddress staticIP(192, 168, 0, 35);
IPAddress gateway(192, 168, 4, 1);
IPAddress subnet(255, 255, 255, 0);
IPAddress dns(8, 8, 8, 8);

// Preferences (ESP32 EEPROM library) initialization
Preferences prefs;

char deviceName[16] = "doubleoh"; // Useful for finding device on router page

DNSServer dnsServer;
#define DNS_PORT 53

WebServer server(80);

// EEPROM constants and variables
eepromStruct eeprom;

void startEEPROM(bool doAReset=false) {
  // Turn on EEPROM, read+write mode
  prefs.begin("doubleoh", false);

  // If factory-reset is called, remove entries
  if (doAReset) {
    prefs.remove("wifiType");
    prefs.remove("IP1");
    prefs.remove("IP2");
    prefs.remove("SSID");
    prefs.remove("PSK");
    prefs.remove("deviceName");
  }

  // Read values; if no value given, use the defaults
  eeprom.wifiType = prefs.getChar("wifiType", 0x00);
  eeprom.ip1 = prefs.getChar("IP1", 0x00);
  eeprom.ip2 = prefs.getChar("IP2", 0x23);
  prefs.getBytes("SSID", eeprom.ssid, 31);
  if (eeprom.ssid[0] == 0x00) {
    strncpy(eeprom.ssid, deviceName, 31);
  }
  prefs.getBytes("PSK", eeprom.psk, 31);
  if (eeprom.psk[0] == 0x00) {
    strncpy(eeprom.psk, deviceName, 31);
  }
  prefs.getBytes("deviceName", eeprom.deviceName, 16);
  if (eeprom.deviceName[0] == 0x00) {
    strncpy(eeprom.deviceName, deviceName, 16);
  }

  prefs.end();

  printStatus(eeprom);
}

void scriptFile(eepromStruct eeprom) {
  File file = SPIFFS.open("/esp32.js", FILE_WRITE);
  String message = "";
  message += "const networkType = ";
  message += (uint8_t)eeprom.wifiType;
  message += ";\n";
  message += "const ip1 = ";
  message += (uint8_t)eeprom.ip1;
  message += ";\n";
  message += "const ip2 = ";
  message += (uint8_t)eeprom.ip2;
  message += ";\n";
  message += "const ssid = \"";
  message += eeprom.ssid;
  message += "\";\n";
  message += "const deviceName = \"";
  message += eeprom.deviceName;
  message += "\";\n";
  file.print(message);
  file.close();
}

void handleRoot() {
  String page = "";
  scriptFile(eeprom);
  File file = SPIFFS.open("/index.html", FILE_READ);
  server.streamFile(file, "text/html");
  file.close();
}

void handleSettingsPost() {
  // Get arguments and values
  // Check args that changed value
  byte newNetworkType = (byte)server.arg("networkType").toInt();
  byte newIpAddr1 = (byte)server.arg("ipAddr1").toInt();
  byte newIpAddr2 = (byte)server.arg("ipAddr2").toInt();
  char newSsid[31];
  server.arg("networkSSID").toCharArray(newSsid, 31);
  char newPsk[31];
  server.arg("networkPSK").toCharArray(newPsk, 31);
  char newDeviceName[16];
  server.arg("deviceName").toCharArray(newDeviceName, 16);
  bool changed = false;

  // TODO: check that all values are valid; disregard invalid ones or change them to closest valid ones

  // If any of the non-password values changed, update EEPROM and eeprom** variables
  if ((newNetworkType != eeprom.wifiType) ||
  (newIpAddr1 != eeprom.ip1) || 
  (newIpAddr2 != eeprom.ip2) || 
  (newDeviceName != eeprom.deviceName)) {
    changed = true;

    prefs.begin("doubleoh", false);

    eeprom.wifiType = newNetworkType;
    prefs.putChar("wifiType", newNetworkType);
    eeprom.ip1 = newIpAddr1;
    prefs.putChar("IP1", newIpAddr1);
    eeprom.ip2 = newIpAddr2;
    prefs.putChar("IP2", newIpAddr2);
    // eepromDeviceName = newDeviceName;
    strncpy(eeprom.deviceName, newDeviceName, 16);
    prefs.putBytes("deviceName", newDeviceName, 16);

    prefs.end();
  }

  // If either SSID or PSK changed, update both PSK and SSID
  if ((newSsid != eeprom.ssid) ||
  (newPsk != eeprom.psk && newPsk[0] != 0x00 && newPsk != NULL)) {
    changed = true;

    prefs.begin("doubleoh", false);

    // eepromSsid = newSsid;
    strncpy(eeprom.ssid, newSsid, 31);
    prefs.putBytes("SSID", newSsid, 31);
    // eepromPsk = newPsk;
    strncpy(eeprom.psk, newPsk, 31);
    prefs.putBytes("PSK", newPsk, 31);

    prefs.end();
  }

  if (changed) {
    printStatus(eeprom);
  }
  
  // Great but now which page to render
  server.sendHeader("Location", "/", true);
  server.send(302, "text/plain", "");
}

void handleNotFound(){
  String message = "Hello! File Not Found\n\n";
  message += "URI: ";
  message += server.uri();
  message += "\nMethod: ";
  message += (server.method() == HTTP_GET)?"GET":"POST";
  message += "\nArguments: ";
  message += server.args();
  message += "\n";
  for (uint8_t i=0; i<server.args(); i++){
    message += " " + server.argName(i) + ": " + server.arg(i) + "\n";
  }
  server.send(404, "text/plain", message);
}

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
    // startSoftAP();
    startSoftAP(eeprom.deviceName, dnsServer, DNS_PORT);
  } else {
    Serial.println("Connecting to Wi-Fi");
    startStation(eeprom, dnsServer, DNS_PORT);
  }


  // On a GET request to /, serve the control panel
  server.on("/", HTTP_GET, handleRoot);

  // On POST request to /settings, change the Wi-Fi configuration
  server.on("/settings", HTTP_POST, handleSettingsPost);
  
  // On POST request to /reset, reboot the ESP
  server.on("/reset", HTTP_POST, [](){
    server.sendHeader("Location", "/", true);
    server.send(302, "text/plain", "");
    ESP.restart();
  });

  server.on("/configure.js", HTTP_GET, []() {
    File file = SPIFFS.open("/configure.js", "r");
    server.streamFile(file, "text/javascript");
    file.close();
  });
  server.on("/esp32.js", HTTP_GET, []() {
    File file = SPIFFS.open("/esp32.js", "r");
    server.streamFile(file, "text/javascript");
    file.close();
  });

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
