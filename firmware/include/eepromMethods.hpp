#ifndef EEPROM_METHODS_HPP
#define EEPROM_METHODS_HPP

#include <Arduino.h>

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
#endif