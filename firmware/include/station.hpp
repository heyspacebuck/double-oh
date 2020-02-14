#ifndef STATION_HPP
#define STATION_HPP

#include <Arduino.h>
#include <WiFi.h>
#include <DNSServer.h>
#include <ESPmDNS.h>

#include "eepromMethods.hpp"

// Number of connection attempts to make before reverting to AP mode
int connectionAttempts = 0;
#define maxConnectionAttempts 60


void startSoftAP(char deviceName[16], DNSServer dnsServer, byte dnsPort) {
  IPAddress subnet(255, 255, 255, 0);

  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.setHostname(deviceName);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(deviceName);

  // Set up DNS server to redirect any page to the local IP address
  dnsServer.setErrorReplyCode(DNSReplyCode::ServerFailure);
  Serial.print("Soft AP IP is ");
  Serial.println(WiFi.softAPIP());
  dnsServer.start(dnsPort, "*", WiFi.softAPIP());
}


void startStation(eepromStruct eeprom, DNSServer dnsServer, int DNS_PORT) {
  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.setHostname(eeprom.deviceName);
  // Only set the static IP address if the user has configured it
  if (eeprom.ip1 != 0x00 || eeprom.ip2 != 0x00) {
    IPAddress staticIP(192, 168, eeprom.ip1, eeprom.ip2);
    IPAddress gateway(192, 168, 4, 1); // Probably wrong but unnecessary
    IPAddress subnet(255, 255, 255, 0);
    IPAddress dns(8, 8, 8, 8);
    WiFi.config(staticIP, subnet, gateway, dns);
  }
  WiFi.begin(eeprom.ssid, eeprom.psk);
  WiFi.mode(WIFI_STA);
  // Wait for connection
  Serial.println("");
  while (WiFi.status() != WL_CONNECTED && connectionAttempts <= maxConnectionAttempts) {
    connectionAttempts++;
    delay(500);
    Serial.print(".");
  }

  // If too many unsuccessful connection attempts are made, start a soft access point instead
  if (connectionAttempts <= maxConnectionAttempts) {
    Serial.println("");
    Serial.print("Connected to ");
    Serial.println(eeprom.ssid);
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());

    if (MDNS.begin(eeprom.deviceName)) {
      Serial.print("MDNS responder started at ");
      Serial.print(eeprom.deviceName);
      Serial.println(".local");
    }
  } else {
    Serial.println("\nUnsuccessful connecting to Wi-Fi. Starting Access Point...\n");
    // startSoftAP();
    startSoftAP(eeprom.deviceName, dnsServer, DNS_PORT);
  }
}

#endif