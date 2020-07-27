#ifndef GLOBALS_HPP
#define GLOBALS_HPP

#include <Preferences.h>
#include <DNSServer.h>
#include <WebServer.h>

// Preferences (ESP32 EEPROM library) initialization
Preferences prefs;

DNSServer dnsServer;
#define DNS_PORT 53

WebServer server(80);

char deviceName[16] = "doubleoh"; // Useful for finding device on router page

// Number of connection attempts to make before reverting to AP mode
int connectionAttempts = 0;
#define maxConnectionAttempts 60

// EEPROM constants and variables
eepromStruct eeprom;

#endif
