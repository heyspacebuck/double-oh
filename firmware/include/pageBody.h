#include <Arduino.h>

static const char* pageBody PROGMEM = R"rawliteral(
<body>
  <h1 id="outputTitle">Power Output</h1>
  <div id="outputTab" style="display: none">
    <p>Stuff will go here eventually</p>
  </div>
  <h1 id="settingsTitle">Settings</h1>
  <div id="settingsTab">
    <form action="/settings" method="POST">
      <p><span id="descNetwork"></span></p>
      <hr/>
      <div class="form-group">
        <b>Custom device name:</b><br/>
        <input id="customDeviceName" name="deviceName" type="text" value="doubleoh"/>
      </div>
      <hr/>
      <div class="form-group">
        <b>Wireless network type:</b><br/>
        <input type="radio" id="networkType1" name="networkType" value="0"/>
        <label for="networkType1">Access Point: You connect to the Double-Oh's Wi-Fi network, and any webpage you try to view will show the control panel.</label>
        <br/>
        <input type="radio" id="networkType2" name="networkType" value="1"/>
        <label for="networkType2">Station: The Double-Oh connects to your Wi-Fi network and you access the control panel from a specific URL.
      </div>
      <hr/>
      <div class="form-group" id="ip-form">
        <b>Station mode IP address:</b><br/>
        <input type="number" class="number" value="192" disabled/>.
        <input type="number" class="number" value="168" disabled/>.
        <input type="number" class="number" min="0" max="255" step="1" id="ipAddr1" name="ipAddr1" value="0"/>.
        <input type="number" class="number" min="0" max="255" step="1" id="ipAddr2" name="ipAddr2" value="0"/>
        <i>TODO: find out range of valid IP addresses</i>
        <br/>
        <b>Your Wi-Fi network name:</b><br/>
        <input type="text" id="networkSSID" name="networkSSID" value="doubleoh"/>
        <br/>
        <b>Your Wi-Fi network password:</b><br/>
        <input type="password" id="networkPSK" name="networkPSK"/>
      </div>
      <hr/>
      <button>Save settings</button>
    </form>
  </div>
  <h1 id="dangerTitle">Danger Zone</h1>
  <div id="dangerTab" style="display: none">
    <p>In normal operation, the Double-Oh is limited to a max output of 1.5 VDC. In this section you can change the max output voltage.</p>
    <input type="number" min="1.0" max="3.3" step="0.1"/>
  </div>
  <script type="text/javascript">
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
</script>
</body>
</html>
)rawliteral";