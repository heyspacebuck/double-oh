#include <Arduino.h>
#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <DNSServer.h>
#include <Wire.h>

// From the /lib/ folder
#include <ESP_EEPROM.h>

// From the /include/ folder
#include <mostOfHead.h>
#include <pageBody.h>

// Hardware pins
// For the WL model: the output is GPIO15(!!!), I2C SDA is GPIO16, I2C SCL is GPIO14
// For the finished model: output is GPIO10, I2C SDA is GPIO16, I2C SCL is GPIO14
#define OUTPUT_PIN 15
#define I2C_SCL 14
#define I2C_SDA 16

// Static IP address configuration
IPAddress staticIP(192, 168, 0, 35);
IPAddress gateway(192, 168, 4, 1);
IPAddress subnet(255, 255, 255, 0);
IPAddress dns(8, 8, 8, 8);

char deviceName[16] = "doubleoh"; // Useful for finding device on router page

DNSServer dnsServer;
#define DNS_PORT 53

ESP8266WebServer server(80);

// Number of connection attempts to make before reverting to AP mode
int connectionAttempts = 0;
#define maxConnectionAttempts 60

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
char eepromSsid[31];
#define eepromSsidPos 3
// Bytes 35-66: PSK String
char eepromPsk[31];
#define eepromPskPos 35
// Bytes 67-82: Soft AP host name String
char eepromDeviceName[16];
#define eepromDeviceNamePos 67

void startEEPROM() {
  // Turn on EEPROM, read data
  EEPROM.begin(eepromSize);

  // If this is the first use of the EEPROM, initialize with default values
  if (EEPROM.percentUsed() == 0) {
    EEPROM.put(eepromWifiTypePos, 0x00);
    EEPROM.put(eepromIp1Pos, 0x00);
    EEPROM.put(eepromIp2Pos, 0x23);
    EEPROM.put(eepromSsidPos, deviceName);
    EEPROM.put(eepromPskPos, deviceName);
    EEPROM.put(eepromDeviceNamePos, deviceName);
    Serial.println(EEPROM.commit() ? "New data written to EEPROM" : "EEPROM write error");
  }

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
    eepromWifiType = newNetworkType;
    EEPROM.put(eepromWifiTypePos, newNetworkType);
    eepromIp1 = newIpAddr1;
    EEPROM.put(eepromIp1Pos, newIpAddr1);
    eepromIp2 = newIpAddr2;
    EEPROM.put(eepromIp2Pos, newIpAddr2);
    // eepromDeviceName = newDeviceName;
    strncpy(eepromDeviceName, newDeviceName, 16);
    EEPROM.put(eepromDeviceNamePos, newDeviceName);
  }

  // If either SSID or PSK changed, update both PSK and SSID
  if ((newSsid != eepromSsid) ||
  (newPsk != eepromPsk && newPsk[0] != 0x00 && newPsk != NULL)) {
    changed = true;
    // eepromSsid = newSsid;
    strncpy(eepromSsid, newSsid, 31);
    EEPROM.put(eepromSsidPos, newSsid);
    // eepromPsk = newPsk;
    strncpy(eepromPsk, newPsk, 31);
    EEPROM.put(eepromPskPos, newPsk);
  }

  if (changed) {
    Serial.println(EEPROM.commit()?"New data written" :"EEPROM error");
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
  // Set output HIGH (i.e. turn output off)
  digitalWrite(OUTPUT_PIN, HIGH);

  // Begin serial link at 9600 baud (default rate in PlatformIO)
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


  // On a GET request to /, serve the control panel
  server.on("/", HTTP_GET, handleRoot);

  // On POST request to /settings, change the Wi-Fi configuration
  server.on("/settings", HTTP_POST, handleSettingsPost);
  
  // On POST request to /reset, reboot the ESP
  server.on("/reset", HTTP_POST, [](){ESP.restart();});

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
