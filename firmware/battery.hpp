#ifndef BATTERY_HPP
#define BATTERY_HPP

#include <Arduino.h>

int DAC_value;
float DAC_voltage;

float getBatteryLevel(void) {
  // Read from ADC_PIN
  // Battery reading is approximately 1/554 = 1.805 mV per ADC value
  // E.g. an ADC reading of 2216 equals approx. 4 V
  // When plugged in, ADC reading uncertainty is big: +/- 0.1 V
  // On battery power, uncertainty is much more manageable: +/- 0.02 V roughly
  // I should have made a "detect when plugged in" feature, hmm...
  int batt_raw = analogRead(ADC_PIN);
  float batt_V = float(batt_raw)/float(554);
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

// For the TPSM82821 adjustable buck converter and the resistor network in the schematic:
// For DAC value 0 <= x <= 200:
// V(x) = -0.011x + 2.87
// For DAC value x > 200: V(x) = 0
void setBatteryLevel(float voltage) {
  // Convert voltage to bit value
  unsigned int bitVolt = round((2.87 - voltage)/(0.011));
  if (bitVolt > 200) { bitVolt = 200; } // Upper level capped at 200 (0.67 V)
  if (bitVolt < 0) { bitVolt = 0; } // Lower level capped at 0 (2.87 V)
  dac_output_voltage(DAC_CHANNEL_1, bitVolt);
  DAC_value = bitVolt;
  DAC_voltage = float(bitVolt)*(-0.011) + 2.87;
  battFile();
}

#endif
