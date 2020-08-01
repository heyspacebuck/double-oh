#ifndef BATTERY_HPP
#define BATTERY_HPP

#include <Arduino.h>

int getBatteryLevel(void) {
  // Read from ADC_PIN
  int batt_raw = analogRead(ADC_PIN);
  return batt_raw;
}

void battFile(void) {
  File file = SPIFFS.open("/battery.js", FILE_WRITE);
  String message = "";
  message += "const batteryRaw = ";
  message += getBatteryLevel();
  message += ";\n";
  file.print(message);
  file.close();
}

#endif
