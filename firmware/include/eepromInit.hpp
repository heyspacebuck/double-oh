#ifndef EEPROM_INIT_HPP
#define EEPROM_INIT_HPP

#include <Arduino.h>
#include <SPIFFS.h>

struct eepromStruct {
  byte wifiType;
  byte ip1;
  byte ip2;
  char ssid[31];
  char psk[31];
  char deviceName[16]; 
};

void printStatus(eepromStruct eeprom) {
  Serial.print("Wifi type: \"");
  Serial.print(eeprom.wifiType, HEX);
  Serial.println("\",");
  
  Serial.print("IP part 1: \"");
  Serial.print(eeprom.ip1, HEX);
  Serial.println("\",");

  Serial.print("IP part 2: \"");
  Serial.print(eeprom.ip2, HEX);
  Serial.println("\",");
  
  Serial.print("Wifi SSID: \"");
  Serial.print(eeprom.ssid);
  Serial.println("\",");
  
  Serial.print("Wifi PSK: \"");
  Serial.print(eeprom.psk);
  Serial.println("\",");
  
  Serial.print("Wifi name: \"");
  Serial.print(eeprom.deviceName);
  Serial.println("\"");
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

#endif