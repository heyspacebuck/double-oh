#ifndef BATTERY_HPP
#define BATTERY_HPP

#include <Arduino.h>

int DAC_value;
float DAC_voltage;

float getBatteryLevel(void) {
  // Read from ADC_PIN
  int batt_raw = analogRead(ADC_PIN);
  // A battery reading of ~2400 equals approx 4.15 V
  float batt_V = float(batt_raw)*4.15/float(2400);
  return batt_V;
}

void battFile(void) {
  File file = SPIFFS.open("/battery.js", FILE_WRITE);
  String message = "";
  message += "const batteryRaw = ";
  message += getBatteryLevel();
  message += ";\n";
  message += "const outputBit = ";
  message += DAC_value;
  message += ";\n";
  message += "const outputVolt = ";
  message += DAC_voltage;
  message += ";\n";
  file.print(message);
  file.close();
}

void setBatteryLevel(float voltage) {
  // Convert voltage to bit value
  int bitVolt = 255 - round((voltage - 1.06)/0.012126);
  if (bitVolt > 255) { bitVolt = 255; }
  if (bitVolt < 128) { bitVolt = 128; }
  dac_output_voltage(DAC_CHANNEL_1, bitVolt);
  DAC_value = bitVolt;
  DAC_voltage = (255 - float(bitVolt))*.012126 + 1.06;
  battFile();
}

#endif
