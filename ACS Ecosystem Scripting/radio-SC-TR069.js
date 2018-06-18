var dsc = require("deviceserviceconfiguration");

var data = {
  label: "TR69 Config",
  parameters: [
    { label: "Connection Request Username", cpeParameterName:"Device.ManagementServer.ConnectionRequestUsername" },
    { label: "Connection Request Password", cpeParameterName:"Device.ManagementServer.ConnectionRequestPassword" },
    { label: "Connection Request URL", cpeParameterName:"Device.ManagementServer.ConnectionRequestURL", readOnly: true },
    { label: "Periodic Inform Interval", cpeParameterName:"Device.ManagementServer.PeriodicInformInterval" },
    { label: "CPE Username", cpeParameterName:"Device.ManagementServer.Username" },
    { label: "CPE Password", cpeParameterName:"Device.ManagementServer.Password" }
  ]
};

var response = dsc.createResponse({
    data: data,
    scriptParameters: scriptParameters
});

response;
