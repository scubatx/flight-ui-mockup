
import 'package:flutter/services.dart';
import 'package:mvpui/backend/schema/enums/enums.dart';
import 'package:mvpui/backend/schema/structs/alert_struct.dart';

import 'dart:async';
import 'dart:math';
import 'package:mvpui/pages/main/main_widget.dart';


// Subscribe to channel used to communicate to native backend
const platform = MethodChannel('com.scubatx.mvpui/update');

// static list of all alert/alarms that can be displayed
// Based on the data dictionary Issue C
// Exact Text is TBD
List<AlertStruct> allAlertsAlarms = <AlertStruct>[
  AlertStruct(code: "SYS.1.1", priority: AlertPriority.low, text: "Battery Controller Fault"),
  AlertStruct(code: "SYS.1.2", priority: AlertPriority.low, text: "Authentication Module Fault"),
  AlertStruct(code: "SYS.1.3", priority: AlertPriority.low, text: "NFC Module Fault"),
  AlertStruct(code: "SYS.1.4", priority: AlertPriority.low, text: "Memory Storage Fault"),
  AlertStruct(code: "SYS.1.5", priority: AlertPriority.low, text: "Bluetooth Module Fault"),
  AlertStruct(code: "SYS.1.6", priority: AlertPriority.low, text: "Gas Manifold Controller Fault"),
  AlertStruct(code: "SYS.1.8", priority: AlertPriority.low, text: "Flow/Pressure Sensor Fault"),
  AlertStruct(code: "SYS.1.7", priority: AlertPriority.low, text: "Gas Manifold Valve Fault"),
  AlertStruct(code: "SYS.1.9", priority: AlertPriority.low, text: "Internal Interface Fault"),
  AlertStruct(code: "SYS.1.10", priority: AlertPriority.low, text: "Internal Display Fault"),
  AlertStruct(code: "SYS.1.11", priority: AlertPriority.low, text: "External Interface Fault"),
  AlertStruct(code: "SYS.1.12", priority: AlertPriority.low, text: "External Display Fault"),
  AlertStruct(code: "SYS.1.13", priority: AlertPriority.low, text: "Thermal Controller Fault"),
  AlertStruct(code: "SYS.1.14", priority: AlertPriority.low, text: "Temperature Sensor Fault"),
  AlertStruct(code: "SYS.1.15", priority: AlertPriority.low, text: "Active Cooling System Fault"),
  AlertStruct(code: "SYS.1.16", priority: AlertPriority.low, text: "Calibration Error"),
  AlertStruct(code: "SYS.1.17", priority: AlertPriority.low, text: "Always On Controller Fault"),
  AlertStruct(code: "BAT.1.1", priority: AlertPriority.low, text: "Low Battery"),
  AlertStruct(code: "BAT.1.2", priority: AlertPriority.low, text: "Low Battery"),
  AlertStruct(code: "BAT.1.3", priority: AlertPriority.low, text: "Low Battery"),
  AlertStruct(code: "BAT.1.4", priority: AlertPriority.low, text: "Battery Fault"),
  AlertStruct(code: "CON.1.1", priority: AlertPriority.low, text: "Invalid NFC Object"),
  AlertStruct(code: "CON.1.2", priority: AlertPriority.low, text: "Invalid Consumable"),
  AlertStruct(code: "CON.1.3", priority: AlertPriority.low, text: "Invalid Consumable"),
  AlertStruct(code: "CON.1.4", priority: AlertPriority.low, text: "Invalid Consumable"),
  AlertStruct(code: "CON.1.5", priority: AlertPriority.low, text: "Consumable Expired"),
  AlertStruct(code: "CON.1.6", priority: AlertPriority.low, text: "Consumable Expired"),
  AlertStruct(code: "CON.1.7", priority: AlertPriority.low, text: "Consumable Expired"),
  AlertStruct(code: "CON.1.8", priority: AlertPriority.low, text: "Invalid Update Card"),
  AlertStruct(code: "PSF.0.1 Ch1", priority: AlertPriority.High, text: "Critical High Pressure"),
  AlertStruct(code: "PSF.0.1 Ch2", priority: AlertPriority.High, text: "Critical High Pressure"),
  AlertStruct(code: "PSF.0.1 Ch3", priority: AlertPriority.High, text: "Critical High Pressure"),
  AlertStruct(code: "PSF.1.1 Ch1", priority: AlertPriority.Medium, text: "High Pressure"),
  AlertStruct(code: "PSF.1.1 Ch2", priority: AlertPriority.Medium, text: "High Pressure"),
  AlertStruct(code: "PSF.1.1 Ch3", priority: AlertPriority.Medium, text: "High Pressure"),
  AlertStruct(code: "PSF.1.2 Ch1", priority: AlertPriority.Medium, text: "High Flow"),
  AlertStruct(code: "PSF.1.2 Ch2", priority: AlertPriority.Medium, text: "High Flow"),
  AlertStruct(code: "PSF.1.2 Ch3", priority: AlertPriority.Medium, text: "High Flow"),
  AlertStruct(code: "PSF.1.3 Ch1", priority: AlertPriority.Medium, text: "Low Flow"),
  AlertStruct(code: "PSF.1.3 Ch2", priority: AlertPriority.Medium, text: "Low Flow"),
  AlertStruct(code: "PSF.1.3 Ch3", priority: AlertPriority.Medium, text: "Low Flow"),
  AlertStruct(code: "HUM.0.1 Ch1", priority: AlertPriority.High, text: "Humidification Chamber empty (Channel 1)"),
  AlertStruct(code: "HUM.0.1 Ch2", priority: AlertPriority.High, text: "Humidification Chamber empty (Channel 2)"),
  AlertStruct(code: "HUM.0.1 Ch3", priority: AlertPriority.High, text: "Humidification Chamber empty (Channel 3)"),
  AlertStruct(code: "HUM.1.1 Ch1", priority: AlertPriority.Medium, text: "Humidification Chamber empty (Channel 1)"),
  AlertStruct(code: "HUM.1.1 Ch2", priority: AlertPriority.Medium, text: "Humidification Chamber empty (Channel 2)"),
  AlertStruct(code: "HUM.1.1 Ch3", priority: AlertPriority.Medium, text: "Humidification Chamber empty Channel 3)"),
  AlertStruct(code: "SRC.1.1", priority: AlertPriority.Medium, text: "Gas Source Low"),
  AlertStruct(code: "SRC.1.2", priority: AlertPriority.Medium, text: "Gas Source Pressure Too High"),
  AlertStruct(code: "AMB.1.1", priority: AlertPriority.Medium, text: "Ambient Temperature Too High"),
  AlertStruct(code: "AMB.1.2", priority: AlertPriority.Medium, text: "Ambient Temperature Too Low"),
  AlertStruct(code: "TLT.1.1", priority: AlertPriority.Medium, text: "Excessive Tilt"),
  AlertStruct(code: "TLT.1.2", priority: AlertPriority.Medium, text: "Excessively High Tilt"),
  AlertStruct(code: "TMP.0.1", priority: AlertPriority.High, text: "Critically High Internal Temperature"),
  AlertStruct(code: "TMP.0.2", priority: AlertPriority.High, text: "Critically Low Internal Temperature "),
  AlertStruct(code: "TMP.1.1", priority: AlertPriority.Medium, text: "High Internal Temperature"),
  AlertStruct(code: "TMP.1.2", priority: AlertPriority.Medium, text: "Low Internal Temperature"),
  AlertStruct(code: "ICE.1.1", priority: AlertPriority.Medium, text: "Replace Ice")

];

// Creates a periodic timer for 1 second, retrives data from backend and update UI
// @param MainModel: is the page state for the Main page Widget
// @param setState: is functional parameter that exposes the main widget state
void autoUpdate(MainModel model, void Function(MainModel) setState) {

  setupBluetooth();
  // timer counter used to derive when alert needs to cycled
  int counter =0;
  // number of timer counts to cycle alert
  const int alertDisplayTimeCounts = 5;
  // Create periodic timer
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    var newModel = await updateModel(model, counter, alertDisplayTimeCounts );
    setState(newModel);
    counter++;
  });
}

Future<void> setupBluetooth() async{
  int? result = await platform.invokeMethod('setupBluetooth');
    print(result);
}

// A method that performs async calls to the backend android/ios to get the latest UIStruct
// @param MainModel: is the page state for the Main page Widget
Future<MainModel> updateModel(MainModel model, int counter, int alertDisplayTimeCounts) async {
  try {
    // Execute backend function to retrieve new UIStruct for UI update
    // The result of the execution is a JSON object generated from UIStruct.kt
    final Map<dynamic, dynamic>? result =
        await platform.invokeMethod('getUIStruct');
    // If there was a return, update the parameter model with the info from the method return
    return result != null ? fromUIStruct(model, result, counter, alertDisplayTimeCounts) : MainModel();
  } on PlatformException catch (e) {
    // Something went wrong during method invokation.
    // Prints are for debug and will be removed
    print("Failed to get model");
    print(e.toString());
  }
  // Return the updated model
  return MainModel();
}

// Convert UIStruct from the Kotlin backend to the MainModel needed for the UI display
// The model from the previous round is used as the basis to retain aspect of the initalisation
// The values in model are updated based on the values given in the UIStruct
// The reuse of the model is important as it allows for certain information to be retained (such as alert count)
MainModel fromUIStruct(MainModel m, Map<dynamic, dynamic>? json,  int counter, int alertDisplayTimeCounts) {

  m.activeChannels = json?['active_channels']! as int;

  //Channel Info
  m.flow1 = json?['flow_1']! as double;
  m.flow2 = json?['flow_2']! as double;
  m.flow3 = json?['flow_3']! as double;
  m.pressure1 = json?['pressure_1']! as double;
  m.pressure2 = json?['pressure_2']! as double;
  m.pressure3 = json?['pressure_3']! as double;

  // Temperature Info
  int temperatureFormat = json?['temperature_format']! as int;
  // Convert temperature format int to Enum used by the UI
  m.temperatureFormat = temperatureFormat == 0
      ? TemperatureFormat.Celsius
      : TemperatureFormat.Fahrenheit;

  m.temperatureTarget = json?['temperature_target']! as int;

  double temperatureBowl = json?['temperature_bowl']! as double;
 // Temperature is displayed as an integer, rounding is used to convert from float/double
  m.temperatureBowl = temperatureBowl.round();

  double temperatureLatched = json?['temperature_bowl_latched']! as double;
  m.temperatureBowlLatched = temperatureLatched.round();

  // Time conversion from seconds from UIStruct to hours/minutes/seconds for display
  int time = json?['time']! as int;
  m.timeHours = (time / 3600).floor();
  m.timeMinutes = ((time - m.timeHours * 3600) / 60).floor();
  m.timeSeconds = (time - m.timeHours * 3600).remainder(60);

  //Decoding organ type int flag into enum
  switch (json?['organ_type']! as int) {
    case 1:
      m.organType = OrganType.Pancreas;
    case 2:
      m.organType = OrganType.Kidney;
    case 3:
      m.organType = OrganType.Liver;
    case 4:
      m.organType = OrganType.Heart;
    case 5:
      m.organType = OrganType.CompositeTissue;
    case 6:
      m.organType = OrganType.Lung;
  }

  // Battery
  m.batteryPercentage = json?['battery_percentage']! as int;

  m.batteryCharging = (json?['battery_charging'] as int) != 0;


  //Decoding bluetooth status int flag into enum
  switch (json?['bluetooth_status'] as int) {
    case 0:
      m.bluetooth = Bluetooth.NotActive;
    case 1:
      m.bluetooth = Bluetooth.Active;
    case 2:
      m.bluetooth = Bluetooth.Paired;
    case 3:
      m.bluetooth = Bluetooth.Fault;
  }

  // Alerts and Alarms
  // Parses AA bitmask to create a list of alerts/alarms and picks the next
  List<AlertStruct> alerts = decodeAlertsAlarms(json?['alerts_alarms']);

  // Update alert count if:
  //  you cycle this timer tick then increment counter count or
  if (counter % alertDisplayTimeCounts == 0 ||
  //  The number of alerts and alarms changed or
      (m.alertMaxCount != alerts.length) ||
  //  the currently displayed alert is no longer there
      !alerts.contains(m.alert)) {
  // Update alert count, if its time to cycle alert/alarm
    m.alertCount = (alerts.isEmpty || m.alertCount >= alerts.length)
        ? 1
        : m.alertCount + 1;
  }//, else skip

  // Total number of alarms/alert
  m.alertMaxCount = alerts.length;

  // Populate the alert for the display based on the next alarm
  m.alert = alerts.isNotEmpty ?  alerts[m.alertCount - 1] : AlertStruct(code: "", text: "", priority: AlertPriority.low);

  // Select the colours for the error bars in the alert status section based on
  // the highest priority active alert. This does not change when the error cycles
  m.highestALertPriorityActive = alerts.any((a) => a.priority == AlertPriority.High)
      ?  AlertPriority.High
      : ( alerts.any((a) => a.priority == AlertPriority.Medium)
            ?  AlertPriority.Medium
            : AlertPriority.low
        );

  // Inverted condition... Should update UI flag to match UI struct
  m.sounderActive = !(json?['alarm_silenced'] as bool);

  // Alarm Button
  m.alarmSilenceButton = json?['alarm_silence_button'] as int;


  // Lid
  m.lidStatus = json?['lid_open'] as bool;

  // Device Status for the status update. The colour text is defined in the front end
  // Based on the data dictionary Issue C
  switch (json?['device_status'] as int) {
    case 0:
      m.deviceStatus = DeviceStatus.NoDisplay;
    case 1:
      m.deviceStatus = DeviceStatus.Initialising;
    case 2:
      m.deviceStatus = DeviceStatus.InsertConsumable;
    case 3:
      m.deviceStatus = DeviceStatus.Authenticating;
    case 4:
      m.deviceStatus = DeviceStatus.Calibrating;
    case 5:
      m.deviceStatus = DeviceStatus.ReadytoCalibrate;
    case 6:
      m.deviceStatus = DeviceStatus.Updating;
    case 7:
      m.deviceStatus = DeviceStatus.ReadyToPersufflate;
    case 8:
      m.deviceStatus = DeviceStatus.PersufflationPaused;
    case 9:
      m.deviceStatus = DeviceStatus.PersufflatingNormal;
    case 10:
      m.deviceStatus = DeviceStatus.PersufflatingAlert;
    case 11:
      m.deviceStatus = DeviceStatus.PersufflatingAlarm;
    case 12:
      m.deviceStatus = DeviceStatus.PersufflationHalted;
    case 13:
      m.deviceStatus = DeviceStatus.InvalidConsumable;
    case 14:
      m.deviceStatus = DeviceStatus.ExpiredConsumable;
    case 15:
      m.deviceStatus = DeviceStatus.SystemError;
    case 16:
      m.deviceStatus = DeviceStatus.CalibrationBlocked;
    case 17:
      m.deviceStatus = DeviceStatus.ActivePreservation;
  }


  // UI Elements bitmask decoding
  int bitMask = json?['ui_elements_bitmask'] as int;
  m.pausedSymbolVisible = decodeBitmask(bitMask, 0);
  m.alertInfoVisible = decodeBitmask(bitMask, 1);
  m.calibrationTimeVisible = decodeBitmask(bitMask, 2);
  m.persufflationTimeVisible = decodeBitmask(bitMask, 3);
  m.temperatureInfoVisible = decodeBitmask(bitMask, 4);
  m.organIconLargeVisible = decodeBitmask(bitMask, 5);
  m.organIconSmallVisible = decodeBitmask(bitMask, 6);
  m.topBarInfoVisible = decodeBitmask(bitMask, 7);
  m.channel3InfoVisible = decodeBitmask(bitMask, 8);
  m.channel2InfoVisible = decodeBitmask(bitMask, 9);
  m.channel1InfoVisible = decodeBitmask(bitMask, 10);
  m.deviceStatusBarVisible = decodeBitmask(bitMask, 11);
  m.stxLogoVisible = decodeBitmask(bitMask, 12);
  m.latchedTemperatureVisible = decodeBitmask(bitMask, 13);

  m.persufflationButton = json?['alarm_silence_button'] as int;
  
  // Channel flow/pressure value colours booleans set based on existence of specific AA in alerts list

  // Channel flow is flight if either PSF.1.2 or PSF.1.3 are active
  m.channel1FlowAlert = alerts.where((a) => (a.code == "PSF.1.2 Ch1") || (a.code  == "PSF.1.3 Ch1")).isNotEmpty;
  m.channel2FlowAlert = alerts.where((a) => (a.code == "PSF.1.2 Ch2") || (a.code  == "PSF.1.3 Ch2")).isNotEmpty;
  m.channel3FlowAlert = alerts.where((a) => (a.code == "PSF.1.2 Ch3") || (a.code  == "PSF.1.3 Ch3")).isNotEmpty;

  //Channel pressure is highlighted Yellow if PSF.1.1 is active
  m.channel1PressureAlert = alerts.where((a) => a.code == "PSF.1.1 Ch1").isNotEmpty;
  m.channel2PressureAlert = alerts.where((a) => a.code == "PSF.1.1 Ch2").isNotEmpty;
  m.channel3PressureAlert = alerts.where((a) => a.code == "PSF.1.1 Ch3").isNotEmpty;

  //Channel pressure is highlighted Red if PSF.0.1 is active
  m.channel1PressureAlarm = alerts.where((a) => a.code == "PSF.0.1 Ch1").isNotEmpty;
  m.channel2PressureAlarm = alerts.where((a) => a.code == "PSF.0.1 Ch2").isNotEmpty;
  m.channel3PressureAlarm = alerts.where((a) => a.code == "PSF.0.1 Ch3").isNotEmpty;

  // Return Updated Model
  return m;
}


// Decodes the alerts and alarms bitmask into a list of active alert/alarms
List<AlertStruct> decodeAlertsAlarms(int bitMask) {
  List<AlertStruct> alerts =  <AlertStruct>[];
  for(int i = 0; i < allAlertsAlarms.length; i++){
    // forall bits in the bitmask, if 1, then add the corresponding alert for the alerts
    // list from the stored list of all alerts and alarms
    // Bitmask is always processed in the same order ensuring alerts/ alarms report the same way.
    if (decodeBitmask(bitMask, i)){
      alerts.add(allAlertsAlarms[i]);
    }
  }
  return alerts;
}

// Given a bitmask and a bit, this method returns false if the bit is 0, true otherwise
bool decodeBitmask(int bitMask, int bit) {
  // Convert bit to an int value
  int value = pow(2, bit) as int;
  // logical and with the given bitmask to see if bit is true
  return (bitMask & value) != 0;
}
