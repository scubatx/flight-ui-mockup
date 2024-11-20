import '/backend/schema/enums/enums.dart';
import '/components/status_bar_widget.dart';
import '/components/temperature_info_widget.dart';
import '/components/time_info_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'system_info_widget.dart' show SystemInfoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SystemInfoModel extends FlutterFlowModel<SystemInfoWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for TopBar component.
  late TopBarModel topBarModel;
  // Model for StatusBar component.
  late StatusBarModel statusBarModel;
  // Model for TemperatureInfoValue.
  late TemperatureInfoModel temperatureInfoValueModel;
  // Model for TemperatureInfoTarget.
  late TemperatureInfoModel temperatureInfoTargetModel;
  // Model for TimeInfo component.
  late TimeInfoModel timeInfoModel;

  @override
  void initState(BuildContext context) {
    topBarModel = createModel(context, () => TopBarModel());
    statusBarModel = createModel(context, () => StatusBarModel());
    temperatureInfoValueModel =
        createModel(context, () => TemperatureInfoModel());
    temperatureInfoTargetModel =
        createModel(context, () => TemperatureInfoModel());
    timeInfoModel = createModel(context, () => TimeInfoModel());
  }

  @override
  void dispose() {
    topBarModel.dispose();
    statusBarModel.dispose();
    temperatureInfoValueModel.dispose();
    temperatureInfoTargetModel.dispose();
    timeInfoModel.dispose();
  }
}
