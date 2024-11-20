import '/backend/schema/enums/enums.dart';
import '/components/status_bar_widget.dart';
import '/components/temperature_info_widget.dart';
import '/components/time_info_widget.dart';
import '/components/top_bar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'system_info_model.dart';
export 'system_info_model.dart';

class SystemInfoWidget extends StatefulWidget {
  const SystemInfoWidget({
    super.key,
    bool? temperatureInfo,
    bool? persufflationTimeInfo,
    int? batteryPercentage,
    bool? lidStatus,
    required this.bluetooth,
    required this.chargingStatus,
    required this.organType,
    required this.deviceStatus,
    required this.timeSeconds,
    required this.timeMinutes,
    required this.timeHours,
    required this.calibrationTimeInfo,
    required this.temperature,
    required this.temperatureTarget,
    required this.temperatureUnits,
    required this.latchedTemperature,
    required this.latchedTemperatureVisible,
    required this.showOrgan,
  })  : this.temperatureInfo = temperatureInfo ?? true,
        this.persufflationTimeInfo = persufflationTimeInfo ?? true,
        this.batteryPercentage = batteryPercentage ?? 8,
        this.lidStatus = lidStatus ?? true;

  final bool temperatureInfo;
  final bool persufflationTimeInfo;
  final int batteryPercentage;
  final bool lidStatus;
  final Bluetooth? bluetooth;
  final bool? chargingStatus;
  final OrganType? organType;
  final DeviceStatus? deviceStatus;
  final int? timeSeconds;
  final int? timeMinutes;
  final int? timeHours;
  final bool? calibrationTimeInfo;
  final int? temperature;
  final int? temperatureTarget;
  final TemperatureFormat? temperatureUnits;
  final int? latchedTemperature;
  final bool? latchedTemperatureVisible;
  final bool? showOrgan;

  @override
  State<SystemInfoWidget> createState() => _SystemInfoWidgetState();
}

class _SystemInfoWidgetState extends State<SystemInfoWidget> {
  late SystemInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SystemInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
      child: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 2),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              wrapWithModel(
                model: _model.topBarModel,
                updateCallback: () => safeSetState(() {}),
                child: TopBarWidget(
                  bluetooth: widget!.bluetooth!,
                  chargingStatus: widget!.chargingStatus!,
                  batteryPercentage: widget!.batteryPercentage,
                  lidStatus: widget!.lidStatus,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 15),
                child: wrapWithModel(
                  model: _model.statusBarModel,
                  updateCallback: () => safeSetState(() {}),
                  child: StatusBarWidget(
                    deviceStatus: widget!.deviceStatus!,
                    showOrgan: widget!.showOrgan!,
                    organType: widget!.organType!,
                  ),
                ),
              ),
              Container(
                height: 150,
                decoration: BoxDecoration(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (widget!.temperatureInfo)
                      wrapWithModel(
                        model: _model.temperatureInfoValueModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TemperatureInfoWidget(
                          value: widget!.temperature,
                          units: widget!.temperatureUnits!,
                          latchedTemperature: widget!.latchedTemperature,
                          temperatureTarget: false,
                          latchedTemperatureVisible:
                          widget!.latchedTemperatureVisible,
                        ),
                      ),
                    if (widget!.temperatureInfo)
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    if (widget!.temperatureInfo)
                      wrapWithModel(
                        model: _model.temperatureInfoTargetModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TemperatureInfoWidget(
                          value: widget!.temperatureTarget,
                          units: widget!.temperatureUnits!,
                          latchedTemperature: widget!.latchedTemperature,
                          temperatureTarget: true,
                        ),
                      ),
                    if (widget!.temperatureInfo)
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: FlutterFlowTheme.of(context).primaryText,
                      ),
                    if (widget!.persufflationTimeInfo ||
                        widget!.calibrationTimeInfo!)
                      wrapWithModel(
                        model: _model.timeInfoModel,
                        updateCallback: () => safeSetState(() {}),
                        child: TimeInfoWidget(
                          hours: widget!.timeHours?.toString(),
                          minutes: widget!.timeMinutes?.toString(),
                          paused: (widget!.deviceStatus ==
                              DeviceStatus.ReadyToPersufflate) ||
                              (widget!.deviceStatus ==
                                  DeviceStatus.ReadytoCalibrate) ||
                              (widget!.deviceStatus ==
                                  DeviceStatus.PersufflationPaused),
                          seconds: widget!.timeSeconds!.toString(),
                          persufflationTime: widget!.persufflationTimeInfo,
                          calibrationTime: widget!.calibrationTimeInfo!,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
