#ifndef ROUTERMETHODS_HPP
#define ROUTERMETHODS_HPP

#include "battery.hpp"

void handleRoot() {
  battFile();  
  String page = "";
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
    scriptFile(eeprom);
  }
  
  // Great but now which page to render
  server.sendHeader("Location", "/", true);
  server.send(302, "text/plain", "");
}

void handlePowerPost() {
  // Get value from form
  float newVoltage = server.arg("desiredVoltage").toFloat();
  
  Serial.print("setting new voltage to ");
  Serial.println(server.arg("desiredVoltage"));
  Serial.print("Converted to float, it's: ");
  Serial.println(newVoltage);
  setBatteryLevel(newVoltage);
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

void handleResetPost() {
  server.sendHeader("Location", "/", true);
  server.send(302, "text/plain", "");
  ESP.restart();
}

void handleJS(String filename) {
  File file = SPIFFS.open(filename, "r");
  server.streamFile(file, "text/javascript");
  file.close();
}

void handleFavicon() {
  File file = SPIFFS.open("/favicon.ico", "r");
  server.streamFile(file, "image/x-icon");
  file.close();
}
#endif
