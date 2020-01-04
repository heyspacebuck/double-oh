#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <DNSServer.h>

#include <ESP_EEPROM.h>

// Static IP address configuration
IPAddress staticIP(192, 168, 0, 35);
IPAddress gateway(192, 168, 4, 1);
IPAddress subnet(255, 255, 255, 0);
IPAddress dns(8, 8, 8, 8);

String deviceName = "doubleoh"; // Useful for finding device on router page

DNSServer dnsServer;
#define DNS_PORT 53

ESP8266WebServer server(80);

// EEPROM constants and variables
#define eepromSize 83
// Byte 0: Wi-Fi connection type byte
byte eepromWifiType;
#define eepromWifiTypePos 0
// Bytes 1, 2: Station fixed IP
byte eepromIp1, eepromIp2;
#define eepromIp1Pos 1
#define eepromIp2Pos 2
// Bytes 3-34: SSID String
String eepromSsid;
#define eepromSsidPos 3
// Bytes 35-66: PSK String
String eepromPsk;
#define eepromPskPos 35
// Bytes 67-82: Soft AP host name String
String eepromDeviceName;
#define eepromDeviceNamePos 67

void startEEPROM() {
  // Turn on EEPROM, read data
  EEPROM.begin(eepromSize);

  // EEPROM.put(eepromWifiTypePos, 0x00);
  // EEPROM.put(eepromIp1Pos, 0x01);
  // EEPROM.put(eepromIp2Pos, 0x20);
  // EEPROM.put(eepromSsidPos, deviceName);
  // EEPROM.put(eepromPskPos, deviceName);
  // EEPROM.put(eepromDeviceNamePos, deviceName);
  // Serial.println(EEPROM.commit() ? "New data written to EEPROM" : "EEPROM write error");

  // Load EEPROM byte 0 (Wi-Fi connection type byte)
  EEPROM.get(eepromWifiTypePos, eepromWifiType);
  // Load EEPROM bytes 1-2 (Station fixed IP)
  EEPROM.get(eepromIp1Pos, eepromIp1);
  EEPROM.get(eepromIp2Pos, eepromIp2);
  // Load EEPROM bytes 3-34 (SSID)
  EEPROM.get(eepromSsidPos, eepromSsid);
  // Load EEPROM bytes 35-66 (PSK)
  EEPROM.get(eepromPskPos, eepromPsk);
  // Load EEPROM bytes 67-82 (Device name and soft AP host name)
  EEPROM.get(eepromDeviceNamePos, eepromDeviceName);

  Serial.print("Wifi type: \"");
  Serial.print(eepromWifiType, HEX);
  Serial.println("\",");
  
  Serial.print("IP part 1: \"");
  Serial.print(eepromIp1, HEX);
  Serial.println("\",");

  Serial.print("IP part 2: \"");
  Serial.print(eepromIp2, HEX);
  Serial.println("\",");
  
  Serial.print("Wifi SSID: \"");
  Serial.print(eepromSsid);
  Serial.println("\",");
  
  Serial.print("Wifi PSK: \"");
  Serial.print(eepromPsk);
  Serial.println("\",");
  
  Serial.print("Wifi name: \"");
  Serial.print(eepromDeviceName);
  Serial.println("\"");
}

void startStation() {
  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.hostname(eepromDeviceName);
  // Only set the static IP address if the user has configured it
  if (eepromIp1 != 0x00 || eepromIp2 != 0x00) {
    IPAddress staticIP(192, 168, eepromIp1, eepromIp2);
    IPAddress gateway(192, 168, 4, 1); // Probably wrong but unnecessary
    IPAddress subnet(255, 255, 255, 0);
    IPAddress dns(8, 8, 8, 8);
    WiFi.config(staticIP, subnet, gateway, dns);
  }
  WiFi.begin(eepromSsid, eepromPsk);
  WiFi.mode(WIFI_STA);
  // Wait for connection
  Serial.println("");
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }
  Serial.println("");
  Serial.print("Connected to ");
  Serial.println(eepromSsid);
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());

  if (MDNS.begin(eepromDeviceName)) {
    Serial.print("MDNS responder started at ");
    Serial.print(eepromDeviceName);
    Serial.println(".local");
  }
}

void startSoftAP() {
  IPAddress subnet(255, 255, 255, 0);

  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.hostname(eepromDeviceName);
  WiFi.mode(WIFI_AP);
  WiFi.softAP(eepromDeviceName);

  // Set up DNS server to redirect any page to the local IP address
  dnsServer.setErrorReplyCode(DNSReplyCode::ServerFailure);
  Serial.print("Soft AP IP is ");
  Serial.println(WiFi.softAPIP());
  dnsServer.start(DNS_PORT, "*", WiFi.softAPIP());
}

void handleRoot() {
  server.send(200, "text/plain", "hello from esp8266!");
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
  Serial.begin(9600);
  
  // Turn on EEPROM, read data
  startEEPROM();

  // If byte 0 is 0x00, set up a soft AP; else set up station
  if (eepromWifiType == 0x00) {
    Serial.println("Starting Soft AP");
    startSoftAP();
  } else {
    Serial.println("Connecting to Wi-Fi");
    startStation();
  }


  server.on("/", handleRoot);

  server.on("/inline", [](){
    server.send(200, "text/plain", "this works as well");
  });

  server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void){
  dnsServer.processNextRequest();
  server.handleClient();
}
