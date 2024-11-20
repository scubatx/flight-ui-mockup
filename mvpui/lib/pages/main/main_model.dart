import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/alerts_widget.dart';
import '/components/channel_info_widget.dart';
import '/components/system_info_widget.dart';
import '/components/temperature_only_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  Local state fields for this page.

  int activeChannels = 3;

  double flow1 = 25.0;

  double flow2 = 25.0;

  double flow3 = 25.0;

  double pressure1 = 60.0;

  double pressure2 = 60.0;

  double pressure3 = 60.0;

  TemperatureFormat? temperatureFormat = TemperatureFormat.Celsius;

  int temperatureTarget = 4;

  int temperatureBowl = 0;

  int temperatureBowlLatched = 0;

  int timeSeconds = 0;

  int timeMinutes = 0;

  int timeHours = 0;

  OrganType? organType = OrganType.Pancreas;

  int batteryPercentage = 100;

  Bluetooth? bluetooth = Bluetooth.Active;

  AlertStruct? alert;
  void updateAlertStruct(Function(AlertStruct) updateFn) {
    updateFn(alert ??= AlertStruct());
  }

  bool sounderActive = true;

  bool lidStatus = true;

  DeviceStatus? deviceStatus = DeviceStatus.Calibrating;

  int alarmSilenceButton = 0;

  bool batteryCharging = true;

  bool pausedSymbolVisible = false;

  bool alertInfoVisible = false;

  bool calibrationTimeVisible = false;

  bool persufflationTimeVisible = false;

  bool temperatureInfoVisible = false;

  bool organIconLargeVisible = false;

  bool organIconSmallVisible = false;

  bool topBarInfoVisible = false;

  bool channel3InfoVisible = false;

  bool channel2InfoVisible = false;

  bool channel1InfoVisible = false;

  bool deviceStatusBarVisible = false;

  bool stxLogoVisible = false;

  bool latchedTemperatureVisible = true;

  int alertCount = 1;

  int alertMaxCount = 0;

  int persufflationButton = 0;

  bool channel1PressureAlert = false;

  bool channel1PressureAlarm = false;

  bool channel1FlowAlert = false;

  bool channel2PressureAlert = false;

  bool channel2PressureAlarm = false;

  bool channel2FlowAlert = false;

  bool channel3PressureAlert = false;

  bool channel3PressureAlarm = false;

  bool channel3FlowAlert = false;

  AlertPriority? highestALertPriorityActive = AlertPriority.low;

  ///  State fields for stateful widgets in this page.

  // Model for SystemInfo component.
  late SystemInfoModel systemInfoModel;
  // Model for ChannelInfo1.
  late ChannelInfoModel channelInfo1Model;
  // Model for ChannelInfo2.
  late ChannelInfoModel channelInfo2Model;
  // Model for TemperatureOnlyInfo component.
  late TemperatureOnlyInfoModel temperatureOnlyInfoModel;
  // Model for ChannelInfo3.
  late ChannelInfoModel channelInfo3Model;
  // Model for Alerts component.
  late AlertsModel alertsModel;

  @override
  void initState(BuildContext context) {
    systemInfoModel = createModel(context, () => SystemInfoModel());
    channelInfo1Model = createModel(context, () => ChannelInfoModel());
    channelInfo2Model = createModel(context, () => ChannelInfoModel());
    temperatureOnlyInfoModel =
        createModel(context, () => TemperatureOnlyInfoModel());
    channelInfo3Model = createModel(context, () => ChannelInfoModel());
    alertsModel = createModel(context, () => AlertsModel());
  }

  @override
  void dispose() {
    systemInfoModel.dispose();
    channelInfo1Model.dispose();
    channelInfo2Model.dispose();
    temperatureOnlyInfoModel.dispose();
    channelInfo3Model.dispose();
    alertsModel.dispose();
  }
}
