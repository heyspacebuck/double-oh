// Retrieve the values deviceName, ip1, ip2, ssid, networkType from...somewhere
document.getElementById("customDeviceName").value = deviceName;
document.getElementById("ipAddr1").value = ip1;
document.getElementById("ipAddr2").value = ip2;
document.getElementById("networkSSID").value = ssid;
document.getElementById("batteryLevel").innerText = batteryRaw;
document.getElementById("outputLevel").innerText = outputVolt;
document.getElementById("desiredVoltage").value = outputVolt;

$outputTitle = document.getElementById("outputTitle");
$outputTab = document.getElementById("outputTab");
$settingsTitle = document.getElementById("settingsTitle");
$settingsTab = document.getElementById("settingsTab");
$dangerTitle = document.getElementById("dangerTitle");
$dangerTab = document.getElementById("dangerTab");

$descNetwork = document.getElementById("descNetwork");
if (networkType === 0) {
  document.getElementById("networkType1").checked = true;
  $descNetwork.innerHTML = `Your device is currently set up as an Access Point. Connect to the Wi-Fi network named <i>${deviceName}</i> and open any web browser to see the control panel.`;
} else {
  document.getElementById("networkType2").checked = true;
  $descNetwork.innerHTML = `Your device is currently set up as a Station. It will attempt to connect to the network named <i>${ssid}</i>. You can access the control panel from the URL <i>${deviceName}.local</i> or <i>192.168.${ip1}.${ip2}</i>.`;
}
