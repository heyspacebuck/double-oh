#include <Arduino.h>
#include <WiFi.h>
#include <WiFiClient.h>
#include <WebServer.h>
#include <ESPmDNS.h>
#include <DNSServer.h>
#include <Wire.h>
#include <Preferences.h>

// From the /include/ folder
#include <mostOfHead.h>
#include <pageBody.h>

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

// Number of connection attempts to make before reverting to AP mode
int connectionAttempts = 0;
#define maxConnectionAttempts 60

// EEPROM constants and variables
// Wi-Fi connection type byte
byte eepromWifiType;
// Station fixed IP
byte eepromIp1, eepromIp2;
// SSID String
char eepromSsid[31];
// PSK String
char eepromPsk[31];
// Soft AP host name String
char eepromDeviceName[16];

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
  eepromWifiType = prefs.getChar("wifiType", 0x00);
  eepromIp1 = prefs.getChar("IP1", 0x00);
  eepromIp2 = prefs.getChar("IP2", 0x23);
  prefs.getBytes("SSID", eepromSsid, 31);
  // TODO: If eepromSsid is blank, use default
  prefs.getBytes("PSK", eepromPsk, 31);
  // TODO: If eepromPsk is blank, use default
  prefs.getBytes("deviceName", eepromDeviceName, 16);
  // TODO: If eepromDeviceName is blank, use default

  prefs.end();

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

void startSoftAP() {
  IPAddress subnet(255, 255, 255, 0);

  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.setHostname("doubleoh");
  WiFi.mode(WIFI_AP);
  WiFi.softAP("doubleoh");

  // Set up DNS server to redirect any page to the local IP address
  dnsServer.setErrorReplyCode(DNSReplyCode::ServerFailure);
  Serial.print("Soft AP IP is ");
  Serial.println(WiFi.softAPIP());
  dnsServer.start(DNS_PORT, "*", WiFi.softAPIP());
}

void startStation() {
  // Device name, SSID, PSK, static IP address were retrieved from EEPROM
  WiFi.disconnect();
  WiFi.setHostname("doubleoh");
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
  while (WiFi.status() != WL_CONNECTED && connectionAttempts <= maxConnectionAttempts) {
    connectionAttempts++;
    delay(500);
    Serial.print(".");
  }

  // If too many unsuccessful connection attempts are made, start a soft access point instead
  if (connectionAttempts <= maxConnectionAttempts) {
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
  } else {
    Serial.println("\nUnsuccessful connecting to Wi-Fi. Starting Access Point...\n");
    startSoftAP();
  }
}

String scriptFile(byte networkType, byte ip1, byte ip2, char ssid[31], char deviceName[16]) {
  String message = "<script>";
  message += "const networkType = ";
  message += (uint8_t)networkType;
  message += ";\n";
  message += "const ip1 = ";
  message += (uint8_t)ip1;
  message += ";\n";
  message += "const ip2 = ";
  message += (uint8_t)ip2;
  message += ";\n";
  message += "const ssid = \"";
  message += ssid;
  message += "\";\n";
  message += "const deviceName = \"";
  message += deviceName;
  message += "\";\n";
  message += "</script>";
  return message;
}

void handleRoot() {
  String page = "";
  page += mostOfHead;
  page += scriptFile(eepromWifiType, eepromIp1, eepromIp2, eepromSsid, eepromDeviceName);
  page += "\n</head>";
  page += pageBody;
  server.send(200, "text/html", page);
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
  if ((newNetworkType != eepromWifiType) ||
  (newIpAddr1 != eepromIp1) || 
  (newIpAddr2 != eepromIp2) || 
  (newDeviceName != eepromDeviceName)) {
    changed = true;

    prefs.begin("doubleoh", false);

    eepromWifiType = newNetworkType;
    prefs.putChar("wifiType", newNetworkType);
    eepromIp1 = newIpAddr1;
    prefs.putChar("IP1", newIpAddr1);
    eepromIp2 = newIpAddr2;
    prefs.putChar("IP2", newIpAddr2);
    // eepromDeviceName = newDeviceName;
    strncpy(eepromDeviceName, newDeviceName, 16);
    prefs.putBytes("deviceName", newDeviceName, 16);

    prefs.end();
  }

  // If either SSID or PSK changed, update both PSK and SSID
  if ((newSsid != eepromSsid) ||
  (newPsk != eepromPsk && newPsk[0] != 0x00 && newPsk != NULL)) {
    changed = true;

    prefs.begin("doubleoh", false);

    // eepromSsid = newSsid;
    strncpy(eepromSsid, newSsid, 31);
    prefs.putBytes("SSID", newSsid, 31);
    // eepromPsk = newPsk;
    strncpy(eepromPsk, newPsk, 31);
    prefs.putBytes("PSK", newPsk, 31);

    prefs.end();
  }

  if (changed) {
    Serial.print("Wifi type: \"0x");
    Serial.print(eepromWifiType, HEX);
    Serial.println("\",");
    
    Serial.print("IP part 1: \"0x");
    Serial.print(eepromIp1, HEX);
    Serial.println("\",");

    Serial.print("IP part 2: \"0x");
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
  
  // Turn on EEPROM, read data
  startEEPROM(factoryReset);

  // If byte 0 is 0x00, set up a soft AP; else set up station
  if (eepromWifiType == 0x00) {
    Serial.println("Starting Soft AP");
    startSoftAP();
  } else {
    Serial.println("Connecting to Wi-Fi");
    startStation();
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

  // On any other type of request, serve the control panel
  server.onNotFound(handleRoot);
  // server.onNotFound(handleNotFound);

  server.begin();
  Serial.println("HTTP server started");
}

void loop(void){
  dnsServer.processNextRequest();
  server.handleClient();
}
