import 'package:mvpui/stx_custom/auto_update.dart';
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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';
export 'main_model.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({super.key});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  late MainModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientationLandscape();
    });

    autoUpdate(_model, (MainModel model) {
      _model  = model;
      setState(() {});
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('StartPSF pressed ...');
                        },
                        text: '',
                        icon: Icon(
                          Icons.play_arrow,
                          color: () {
                            if (_model.persufflationButton == 0) {
                              return Color(0xFF1F68FC);
                            } else if (_model.persufflationButton == 1) {
                              return FlutterFlowTheme.of(context).tertiary;
                            } else {
                              return Color(0xFF818181);
                            }
                          }(),
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 50,
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Archivo',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: () {
                              if (_model.persufflationButton == 0) {
                                return Color(0xFF1F68FC);
                              } else if (_model.persufflationButton == 1) {
                                return FlutterFlowTheme.of(context).tertiary;
                              } else {
                                return Color(0xFF818181);
                              }
                            }(),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: FFButtonWidget(
                        onPressed: () {
                          print('AlarmSilence pressed ...');
                        },
                        text: '',
                        icon: FaIcon(
                          FontAwesomeIcons.volumeMute,
                          color: valueOrDefault<Color>(
                                () {
                              if (_model.alarmSilenceButton == 1) {
                                return FlutterFlowTheme.of(context).warning;
                              } else if (_model.alarmSilenceButton == 2) {
                                return FlutterFlowTheme.of(context).error;
                              } else {
                                return Color(0xFF818181);
                              }
                            }(),
                            Color(0xFF818181),
                          ),
                          size: 20,
                        ),
                        options: FFButtonOptions(
                          width: 50,
                          height: 50,
                          padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                          iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          textStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                            fontFamily: 'Archivo',
                            color: Colors.white,
                            letterSpacing: 0.0,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: valueOrDefault<Color>(
                                  () {
                                if (_model.alarmSilenceButton == 1) {
                                  return FlutterFlowTheme.of(context).warning;
                                } else if (_model.alarmSilenceButton == 2) {
                                  return FlutterFlowTheme.of(context).error;
                                } else {
                                  return Color(0xFF818181);
                                }
                              }(),
                              Color(0xFF818181),
                            ),
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                    child: Container(
                      width: 1280,
                      height: 320,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, -1),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 500,
                                        height: 256,
                                        decoration: BoxDecoration(),
                                        child: Align(
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Container(
                                            height: 256,
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        10, 0, 10, 5),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .systemInfoModel,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      updateOnChange: true,
                                                      child: SystemInfoWidget(
                                                        temperatureInfo: _model
                                                            .temperatureInfoVisible,
                                                        persufflationTimeInfo:
                                                        _model
                                                            .persufflationTimeVisible,
                                                        batteryPercentage: _model
                                                            .batteryPercentage,
                                                        lidStatus:
                                                        _model.lidStatus,
                                                        chargingStatus: _model
                                                            .batteryCharging,
                                                        bluetooth:
                                                        _model.bluetooth!,
                                                        organType:
                                                        _model.organType!,
                                                        deviceStatus: _model
                                                            .deviceStatus!,
                                                        timeSeconds:
                                                        _model.timeSeconds,
                                                        timeMinutes:
                                                        _model.timeMinutes,
                                                        timeHours:
                                                        _model.timeHours,
                                                        calibrationTimeInfo: _model
                                                            .calibrationTimeVisible,
                                                        temperature: _model
                                                            .temperatureBowl,
                                                        temperatureTarget: _model
                                                            .temperatureTarget,
                                                        temperatureUnits: _model
                                                            .temperatureFormat!,
                                                        latchedTemperature: _model
                                                            .temperatureBowlLatched,
                                                        latchedTemperatureVisible:
                                                        _model
                                                            .latchedTemperatureVisible,
                                                        showOrgan: _model
                                                            .organIconSmallVisible,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Container(
                                          width: 232,
                                          height: 256,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: _model.activeChannels >= 1,
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: wrapWithModel(
                                                model: _model.channelInfo1Model,
                                                updateCallback: () =>
                                                    safeSetState(() {}),
                                                child: ChannelInfoWidget(
                                                  flow: _model.flow1.toString(),
                                                  pressure: _model.pressure1
                                                      .toString(),
                                                  channelNo: '1',
                                                  flowAlert:
                                                  _model.channel1FlowAlert,
                                                  pressureAlert: _model
                                                      .channel1PressureAlert,
                                                  pressureAlarm: _model
                                                      .channel1PressureAlarm,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Container(
                                          width: 232,
                                          height: 256,
                                          decoration: BoxDecoration(),
                                          child: Builder(
                                            builder: (context) {
                                              if (_model.activeChannels > 0) {
                                                return Visibility(
                                                  visible:
                                                  _model.activeChannels >=
                                                      2,
                                                  child: Padding(
                                                    padding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        0, 8, 0, 0),
                                                    child: wrapWithModel(
                                                      model: _model
                                                          .channelInfo2Model,
                                                      updateCallback: () =>
                                                          safeSetState(() {}),
                                                      child: ChannelInfoWidget(
                                                        flow: _model.flow2
                                                            .toString(),
                                                        pressure: _model
                                                            .pressure2
                                                            .toString(),
                                                        channelNo: '2',
                                                        flowAlert: _model
                                                            .channel2FlowAlert,
                                                        pressureAlert: _model
                                                            .channel2PressureAlert,
                                                        pressureAlarm: _model
                                                            .channel2PressureAlarm,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: wrapWithModel(
                                                    model: _model
                                                        .temperatureOnlyInfoModel,
                                                    updateCallback: () =>
                                                        safeSetState(() {}),
                                                    child:
                                                    TemperatureOnlyInfoWidget(
                                                      target: _model
                                                          .temperatureTarget,
                                                      value: _model
                                                          .temperatureBowl,
                                                      latchedValue: _model
                                                          .temperatureBowlLatched,
                                                      latched: _model
                                                          .latchedTemperatureVisible,
                                                      units: _model
                                                          .temperatureFormat!,
                                                    ),
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 5, 0),
                                        child: Container(
                                          width: 232,
                                          height: 256,
                                          decoration: BoxDecoration(),
                                          child: Visibility(
                                            visible: _model.activeChannels >= 3,
                                            child: Align(
                                              alignment:
                                              AlignmentDirectional(0, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: wrapWithModel(
                                                  model:
                                                  _model.channelInfo3Model,
                                                  updateCallback: () =>
                                                      safeSetState(() {}),
                                                  child: ChannelInfoWidget(
                                                    flow:
                                                    _model.flow3.toString(),
                                                    pressure: _model.pressure3
                                                        .toString(),
                                                    channelNo: '3',
                                                    flowAlert: _model
                                                        .channel3FlowAlert,
                                                    pressureAlert: _model
                                                        .channel3PressureAlert,
                                                    pressureAlarm: _model
                                                        .channel3PressureAlarm,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 1240,
                                      height: 60,
                                      decoration: BoxDecoration(),
                                      child: Visibility(
                                        visible: _model.alertInfoVisible,
                                        child: wrapWithModel(
                                          model: _model.alertsModel,
                                          updateCallback: () =>
                                              safeSetState(() {}),
                                          child: AlertsWidget(
                                            alertText: _model.alert != null
                                                ? _model.alert!.text
                                                : ' ',
                                            alertNumber: _model.alertCount,
                                            totalAlertNumber:
                                            _model.alertMaxCount,
                                            alertPriority: _model.alert != null
                                                ? _model.alert!.priority
                                                : AlertPriority.low,
                                            sounderActive: _model.sounderActive,
                                            highestPriority: _model
                                                .highestALertPriorityActive!,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
