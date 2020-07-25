#ifndef STARTEEPROM_HPP
#define STARTEEPROM_HPP
#include "globals.hpp"
#include "eepromInit.hpp"

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
#endif
