var dsc = require("deviceserviceconfiguration");

var data = {
  label: "WiFi-1",
  parameters: [
    { label:"WiFi开关", cpeParameterName:"Device.WiFi.AccessPoint.1.Enable" },
    { label:"SSID", cpeParameterName:"Device.WiFi.AccessPoint.1.SSID" },
    { label:"Power", cpeParameterName:"Device.WiFi.AccessPoint.1.Radio.TransmitPower" }
    
  ]
};

var response = dsc.createResponse({
    data: data,
    scriptParameters: scriptParameters
});

response;