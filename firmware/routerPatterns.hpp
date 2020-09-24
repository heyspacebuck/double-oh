#ifndef ROUTERPATTERNS_HPP
#define ROUTERPATTERNS_HPP

#include <functional>
#include <math.h>
#define PI 3.14159265

// Set up the pattern that the motor starts out with (do nothing)
int currTime, prevTime = 0;
int motorIntensity = 255;
std::function<int(float)> pattern = [](float t) {return (int)255;};

void handlePatternPost() {
  // Get values from form
  String patternString = server.arg("pattern");
  if (patternString=="pwm") {
    float intensity = server.arg("intensity").toFloat();
    // Convert float to range 0-255, 0 being most intense
    int PWM = (int)(255*(1-intensity));
    std::function<int(float)> newPattern = [PWM](float t) {return PWM;};
    pattern = newPattern;

    File file = SPIFFS.open("/patternparams.js", FILE_WRITE);
    String message = "";
    message += "const activePattern = {name: 'constant', intensity: ";
    message += intensity;
    message += "};\n";
    file.print(message);
    file.close();
  }
  if (patternString=="sine") {
    float maxIntensity = server.arg("maxIntensity").toFloat();
    float minIntensity = server.arg("minIntensity").toFloat();
    float period = server.arg("period").toFloat();
    // TODO: set OO pattern here
    // Convert float to range 0-255, 0 being most intense
    std::function<int(float)> newPattern = [maxIntensity, minIntensity, period](float t) {
      float wave = (maxIntensity + minIntensity)/2 + ((maxIntensity-minIntensity)/2) * sin(2*PI*t/period);
      int PWM = 255*(1-wave);
      return PWM;
    };
    pattern = newPattern;

    File file = SPIFFS.open("/patternparams.js", FILE_WRITE);
    String message = "";
    message += "const activePattern = {name: 'sine', max: ";
    message += maxIntensity;
    message += ", min: ";
    message += minIntensity;
    message += ", period: ";
    message += period;
    message += "};\n";
    file.print(message);
    file.close();
  }
  // Great but now which page to render
  server.sendHeader("Location", "/", true);
  server.send(302, "text/plain", "");
}


#endif
