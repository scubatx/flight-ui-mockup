import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'alerts_model.dart';
export 'alerts_model.dart';

class AlertsWidget extends StatefulWidget {
  const AlertsWidget({
    super.key,
    String? alertText,
    int? alertNumber,
    int? totalAlertNumber,
    required this.alertPriority,
    bool? sounderActive,
    required this.highestPriority,
  })  : this.alertText = alertText ?? 'Alarm',
        this.alertNumber = alertNumber ?? 1,
        this.totalAlertNumber = totalAlertNumber ?? 1,
        this.sounderActive = sounderActive ?? false;

  final String alertText;
  final int alertNumber;
  final int totalAlertNumber;
  final AlertPriority? alertPriority;
  final bool sounderActive;
  final AlertPriority? highestPriority;

  @override
  State<AlertsWidget> createState() => _AlertsWidgetState();
}

class _AlertsWidgetState extends State<AlertsWidget> {
  late AlertsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AlertsModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(3, 0, 3, 0),
      child: Container(
        width: 1280,
        height: 50,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: 12,
                decoration: BoxDecoration(
                  color: () {
                    if (widget!.highestPriority == AlertPriority.High) {
                      return FlutterFlowTheme.of(context).error;
                    } else if (widget!.highestPriority ==
                        AlertPriority.Medium) {
                      return FlutterFlowTheme.of(context).warning;
                    } else {
                      return FlutterFlowTheme.of(context).lowAlert;
                    }
                  }(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.5,
                decoration: BoxDecoration(),
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1, 0, 1, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Builder(
                          builder: (context) {
                            if (widget!.sounderActive == true) {
                              return Builder(
                                builder: (context) {
                                  if (widget!.alertPriority ==
                                      AlertPriority.High) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/AlarmSilence.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (widget!.alertPriority ==
                                      AlertPriority.Medium) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/AlertSilence.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (widget!.alertPriority ==
                                      AlertPriority.low) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/AlertLowSilence.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(),
                                    );
                                  }
                                },
                              );
                            } else {
                              return Builder(
                                builder: (context) {
                                  if (widget!.alertPriority ==
                                      AlertPriority.High) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Alarm.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (widget!.alertPriority ==
                                      AlertPriority.Medium) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/Alert.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else if (widget!.alertPriority ==
                                      AlertPriority.low) {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(0),
                                      child: Image.asset(
                                        'assets/images/LowAlert.png',
                                        width: 28,
                                        height: 28,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      decoration: BoxDecoration(),
                                    );
                                  }
                                },
                              );
                            }
                          },
                        ),
                        if (widget!.totalAlertNumber > 1)
                          Container(
                            decoration: BoxDecoration(),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      8, 0, 0, 0),
                                  child: Text(
                                    widget!.alertNumber.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Archivo',
                                      color: valueOrDefault<Color>(
                                            () {
                                          if (widget!.alertPriority ==
                                              AlertPriority.High) {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .error;
                                          } else if (widget!
                                              .alertPriority ==
                                              AlertPriority.Medium) {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .warning;
                                          } else {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .lowAlert;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                                Text(
                                  '/',
                                  style: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .override(
                                    fontFamily: 'Archivo',
                                    color: valueOrDefault<Color>(
                                          () {
                                        if (widget!.alertPriority ==
                                            AlertPriority.High) {
                                          return FlutterFlowTheme.of(
                                              context)
                                              .error;
                                        } else if (widget!.alertPriority ==
                                            AlertPriority.Medium) {
                                          return FlutterFlowTheme.of(
                                              context)
                                              .warning;
                                        } else {
                                          return FlutterFlowTheme.of(
                                              context)
                                              .lowAlert;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context)
                                          .primaryText,
                                    ),
                                    letterSpacing: 0.0,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 2, 0),
                                  child: Text(
                                    widget!.totalAlertNumber.toString(),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                      fontFamily: 'Archivo',
                                      color: valueOrDefault<Color>(
                                            () {
                                          if (widget!.alertPriority ==
                                              AlertPriority.High) {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .error;
                                          } else if (widget!
                                              .alertPriority ==
                                              AlertPriority.Medium) {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .warning;
                                          } else {
                                            return FlutterFlowTheme.of(
                                                context)
                                                .lowAlert;
                                          }
                                        }(),
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                      ),
                                      letterSpacing: 0.0,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                  child: VerticalDivider(
                                    width: 20,
                                    thickness: 2,
                                    color: valueOrDefault<Color>(
                                          () {
                                        if (widget!.alertPriority ==
                                            AlertPriority.High) {
                                          return FlutterFlowTheme.of(context)
                                              .error;
                                        } else if (widget!.alertPriority ==
                                            AlertPriority.Medium) {
                                          return FlutterFlowTheme.of(context)
                                              .warning;
                                        } else {
                                          return FlutterFlowTheme.of(context)
                                              .lowAlert;
                                        }
                                      }(),
                                      FlutterFlowTheme.of(context).primaryText,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                          child: Text(
                            valueOrDefault<String>(
                              widget!.alertText,
                              '---',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                              fontFamily: 'Archivo',
                              letterSpacing: 0.0,
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
              padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.25,
                height: 12,
                decoration: BoxDecoration(
                  color: () {
                    if (widget!.highestPriority == AlertPriority.High) {
                      return FlutterFlowTheme.of(context).error;
                    } else if (widget!.highestPriority ==
                        AlertPriority.Medium) {
                      return FlutterFlowTheme.of(context).warning;
                    } else {
                      return FlutterFlowTheme.of(context).lowAlert;
                    }
                  }(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
