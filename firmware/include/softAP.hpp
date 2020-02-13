#include <Arduino.h>
#include <DNSServer.h>
#include <WiFi.h>


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