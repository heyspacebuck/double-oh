// Retrieve the values deviceName, ip1, ip2, ssid, networkType from...somewhere
document.getElementById("customDeviceName").value = deviceName;
document.getElementById("ipAddr1").value = ip1;
document.getElementById("ipAddr2").value = ip2;
document.getElementById("networkSSID").value = ssid;

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

$descNetwork = document.getElementById("descNetwork");
if (networkType === 0) {
  document.getElementById("networkType1").checked = true;
  $descNetwork.innerHTML = `Your device is currently set up as an Access Point. Connect to the Wi-Fi network named <i>${deviceName}</i> and open any web browser to see the control panel.`;
} else {
  document.getElementById("networkType2").checked = true;
  $descNetwork.innerHTML = `Your device is currently set up as a Station. It will attempt to connect to the network named <i>${ssid}</i>. You can access the control panel from the URL <i>${deviceName}.local</i> or <i>192.168.${ip1}.${ip2}</i>.`;
}
