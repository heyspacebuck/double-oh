#ifndef PINS_HPP
#define PINS_HPP

// Hardware pins
// For the WL model: the output is GPIO15(!!!), I2C SDA is GPIO16, I2C SCL is GPIO14, factory reset is GPIO12 and GPIO13
// For the finished model: output is GPIO10, I2C SDA is GPIO16, I2C SCL is GPIO14, factory reset is GPIO13 and GPIO15
#define OUTPUT_PIN 15
#define I2C_SCL 14
#define I2C_SDA 16
#define FACTORY_RESET_1 12
#define FACTORY_RESET_2 13

#endif