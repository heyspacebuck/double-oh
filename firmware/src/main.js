$outputTitle = document.getElementById("outputTitle");
$outputTab = document.getElementById("outputTab");
$settingsTitle = document.getElementById("settingsTitle");
$settingsTab = document.getElementById("settingsTab");
$dangerTitle = document.getElementById("dangerTitle");
$dangerTab = document.getElementById("dangerTab");

$outputTitle.onclick = e => {
  $outputTab.style = "display: block;";
  $settingsTab.style = "display: none;";
  $dangerTab.style = "display: none;";
};
$settingsTitle.onclick = e => {
  $outputTab.style = "display: none;";
  $settingsTab.style = "display: block;";
  $dangerTab.style = "display: none;";
};
$dangerTitle.onclick = e => {
  $outputTab.style = "display: none;";
  $settingsTab.style = "display: none;";
  $dangerTab.style = "display: block;";
};
