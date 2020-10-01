const $patternSelector = document.getElementById("patternSelector");
const $patternParams = document.getElementById("patternParams");

const createRangeElements = (
  rangeName,
  rangeLabel,
  rangeMin,
  rangeMax,
  rangeStep = 1,
  rangeValue = undefined
) => {
  const $element = document.createElement("div");
  const $label = document.createElement("label");
  $label.htmlFor = rangeName;
  $label.innerText = rangeLabel;
  const $range = document.createElement("input");
  $range.type = "range";
  $range.id = rangeName;
  $range.name = rangeName;
  $range.min = rangeMin;
  $range.max = rangeMax;
  $range.step = rangeStep;
  $range.value = rangeValue ? rangeValue : (rangeMax + rangeMin) / 2;
  const $text = document.createElement("span");
  $text.innerText = `${$range.value}`;
  $text.id = `${rangeName}Txt`;
  $range.addEventListener("input", () => {
    $text.innerText = `${$range.value}`;
  });
  $range.addEventListener("change", () => {
    $text.innerText = `${$range.value}`;
  });
  $element.appendChild($label);
  $element.appendChild($range);
  $element.appendChild($text);
  return $element;
};

const listParams = () => {
  $patternParams.innerHTML = "";
  $patternParams.style.display = "block";
  if ($patternSelector.value == "pwm") {
    const $intensity = createRangeElements(
      "intensity",
      "Intensity:",
      0,
      1,
      rangeStep = 0.01,
      rangeValue = 0.75
    );
    $patternParams.appendChild($intensity);
    if (activePattern.name == "constant") {
      activeIntensity = document.getElementById("intensity");
      activeIntensityTxt = document.getElementById("intensityTxt");
      activeIntensity.value = activePattern.intensity;
      activeIntensityTxt.innerText = activePattern.intensity;
    }
  }
  if ($patternSelector.value == "sine") {
    const $maxIntensity = createRangeElements(
      "maxIntensity",
      "Max intensity:",
      0,
      1,
      rangeStep = 0.01,
      rangeValue = 1.00
    );
    const $minIntensity = createRangeElements(
      "minIntensity",
      "Min intensity:",
      0,
      1,
      rangeStep = 0.01,
      rangeValue = 0.50,
    );
    const $period = createRangeElements("period", "Period:", 1, 30, 0.1, 5.0);
    $patternParams.appendChild($maxIntensity);
    $patternParams.appendChild($minIntensity);
    $patternParams.appendChild($period);
    
    if (activePattern.name == "sine") {
      activeMax = document.getElementById("maxIntensity");
      activeMaxTxt = document.getElementById("maxIntensityTxt");
      activeMax.value = activePattern.max;
      activeMaxTxt.innerText = activePattern.max;
      activeMin = document.getElementById("minIntensity");
      activeMinTxt = document.getElementById("minIntensityTxt");
      activeMin.value = activePattern.min;
      activeMinTxt.innerText = activePattern.min;
      activePeriod = document.getElementById("period");
      activePeriodTxt = document.getElementById("periodTxt");
      activePeriod.value = activePattern.period;
      activePeriodTxt.innerText = activePattern.period;
    }
  }
  
  if ($patternSelector.value == "random") {
    const $levels = createRangeElements("levels", "Number of levels:", 2, 100, 1, 4);
    const $period = createRangeElements("period", "Period:", 1, 30, 0.1, 5.0);
    $patternParams.appendChild($levels);
    $patternParams.appendChild($period);
    
    if (activePattern.name == "random") {
      activeLevel = document.getElementById("levels");
      activeLevelTxt = document.getElementById("levelsTxt");
      activeLevel.value = activePattern.levels;
      activeLevelTxt.innerText = activePattern.levels;
      activePeriod = document.getElementById("period");
      activePeriodTxt = document.getElementById("periodTxt");
      activePeriod.value = activePattern.period;
      activePeriodTxt.innerText = activePattern.period;
    }
  }
  
  if ($patternSelector.value == "onebuzz") {
    const $intensity = createRangeElements("intensity", "Intensity: ", 0, 1, 0.01, 0.75);
    const $duration = createRangeElements("duration", "Duration: ", 0.1, 30, 0.1, 0.5);
    $patternParams.appendChild($intensity);
    $patternParams.appendChild($duration);
    
    if (activePattern.name == "onebuzz") {
      activeIntensity = document.getElementById("intensity");
      activeIntensityTxt = document.getElementById("intensityTxt");
      activeIntensity.value = activePattern.intensity;
      activeIntensityTxt.innerText = activePattern.intensity;
      activeDuration = document.getElementById("duration");
      activeDurationTxt = document.getElementById("durationTxt");
      activeDuration.value = activePattern.duration;
      activeDurationTxt.innerText = activePattern.duration;
    }
  }
};

if (activePattern.name == "constant") {
  $patternSelector.value = "pwm";
}
if (activePattern.name == "sine") {
  $patternSelector.value = "sine";
}
if (activePattern.name == "random") {
  $patternSelector.value = "random";
}
if (activePattern.name == "onebuzz") {
  $patternSelector.value = "onebuzz";
}
listParams();

$patternSelector.addEventListener("change", listParams);
