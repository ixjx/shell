 acs = require('acs');
 // get the current firmware version of the device that triggered the firmware upgrade
 var firmwareVersion = acs.getParameterValue("Device.DeviceInfo.SoftwareVersion");

 log.info("New device discovered with id " + scriptParameters.deviceId + " and firmware version " + firmwareVersion);

 if (firmwareVersion < "RDW96E.88ER.20180330.CQ_L2GRE") {
    log.info("Attempting to update device firmware to version RDW96E.88ER.20180330.CQ_L2GRE");

      acs.deviceFirmwareDownload({
      url:'http://192.168.37.62/cfg/radio/RDW96E.88ER.20180330.CQ_L2GRE.bin',
          userName:'cqccn',
          password:'acsdvbcfg.,.'
                 });
 }

  log.info("Device firmware was successfully updated from version " + firmwareVersion );