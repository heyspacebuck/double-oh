#ifndef ROUTERPATTERNS_HPP
#define ROUTERPATTERNS_HPP

#include <functional>
#include <math.h>
//#define PI 3.14159265

// Set up the pattern that the motor starts out with (do nothing)
int currTime, prevTime = 0;
int motorIntensity = 255;
std::function<int(float, float, int)> pattern = [](float t, float tprev, int yprev) {return (int)255;};

void handlePatternPost() {
  // Get values from form
  String patternString = server.arg("pattern");
  if (patternString=="pwm") {
    float intensity = server.arg("intensity").toFloat();
    // Convert float to range 0-255, 0 being most intense
    int PWM = (int)(255*(1-intensity));
    std::function<int(float, float, int)> newPattern = [PWM](float t, float tprev, int yprev) {return PWM;};
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
    // Convert float to range 0-255, 0 being most intense
    std::function<int(float, float, int)> newPattern = [maxIntensity, minIntensity, period](float t, float tprev, int yprev) {
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

  if (patternString=="random") {
    int numLevels = server.arg("levels").toInt();
    float period = server.arg("period").toFloat();
    std::function<int(float, float, int)> newPattern = [numLevels, period](float t, float tprev, int yprev) {
      // Check if new period has elapsed
      if (floor(t/period) != floor(tprev/period)) {
        // Compute new PWM value
        float level = random(0, numLevels);
        int PWM = 255*(level/(numLevels-1));
        return PWM;
      } else {
        return yprev;
      }
    };
    pattern = newPattern;

    File file = SPIFFS.open("/patternparams.js", FILE_WRITE);
    String message = "";
    message += "const activePattern = {name: 'random', levels: ";
    message += numLevels;
    message += ", period: ";
    message += period;
    message += "};\n";
    file.print(message);
    file.close();
  }

  if (patternString=="onebuzz") {
    float intensity = server.arg("intensity").toFloat();
    float duration = server.arg("duration").toFloat();
    int t0 = millis();
    std::function<int(float, float, int)> newPattern = [intensity, duration, t0](float t, float tprev, int yprev) {
      if (t-(t0/1000.0) < duration) {
        int PWM = 255*(1-intensity);
        return PWM;
      }
      else {
        return 255;
      }
    };
    pattern = newPattern;

    File file = SPIFFS.open("/patternparams.js", FILE_WRITE);
    String message = "";
    message += "const activePattern = {name: 'onebuzz', intensity: ";
    message += intensity;
    message += ", duration: ";
    message += duration;
    message += "};\n";
    file.print(message);
    file.close();
  }



  
  // Great but now which page to render
  server.sendHeader("Location", "/", true);
  server.send(302, "text/plain", "");
}


#endif
