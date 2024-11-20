import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'status_bar_model.dart';
export 'status_bar_model.dart';

class StatusBarWidget extends StatefulWidget {
  const StatusBarWidget({
    super.key,
    required this.deviceStatus,
    bool? showOrgan,
    required this.organType,
  }) : this.showOrgan = showOrgan ?? true;

  final DeviceStatus? deviceStatus;
  final bool showOrgan;
  final OrganType? organType;

  @override
  State<StatusBarWidget> createState() => _StatusBarWidgetState();
}

class _StatusBarWidgetState extends State<StatusBarWidget> {
  late StatusBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2, 5, 2, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 4,
        decoration: BoxDecoration(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            if (widget!.showOrgan == true)
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: Builder(
                  builder: (context) {
                    if (widget!.organType == OrganType.Pancreas) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Pancreas.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                            alignment: Alignment(0, 0),
                          ),
                        ),
                      );
                    } else if (widget!.organType == OrganType.Kidney) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Kidney.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else if (widget!.organType == OrganType.Liver) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Liver.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else if (widget!.organType == OrganType.Heart) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Heart.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else if (widget!.organType == OrganType.CompositeTissue) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Lungs.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else if (widget!.organType == OrganType.Lung) {
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/Lungs.png',
                            width: 8,
                            height: 5,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    } else {
                      return Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
                          child: FaIcon(
                            FontAwesomeIcons.solidQuestionCircle,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24,
                          ),
                        ),
                      );
                    }
                  },
                ),
              ),
            Builder(
              builder: (context) {
                if (widget!.deviceStatus == DeviceStatus.Initialising) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 32,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Initialising',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.InsertConsumable) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Insert Consumable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.Authenticating) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Authenticating Consumable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus == DeviceStatus.Calibrating) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Calibrating',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.ReadytoCalibrate) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Ready to Calibrate',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus == DeviceStatus.Updating) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Updating',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.ReadyToPersufflate) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).success,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Ready to Persufflate',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.PersufflationPaused) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 32,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).success,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Persufflation Paused',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.PersufflatingNormal) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Persufflating',
                          style:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.PersufflatingAlert) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).warning,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Persufflating',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.PersufflatingAlarm) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).error,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Persufflating',
                          style:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.PersufflationHalted) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).warning,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Persufflation Halted',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.InvalidConsumable) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lowAlert,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Invalid Consumable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.ExpiredConsumable) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lowAlert,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Expired Consumable',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus == DeviceStatus.SystemError) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lowAlert,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'System Error',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.CalibrationBlocked) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).lowAlert,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Calibration Blocked',
                          style: FlutterFlowTheme.of(context)
                              .bodyLarge
                              .override(
                            fontFamily: 'Archivo',
                            color:
                            FlutterFlowTheme.of(context).secondaryText,
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else if (widget!.deviceStatus ==
                    DeviceStatus.ActivePreservation) {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).info,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Text(
                          'Active Temperture Control',
                          style:
                          FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Container(
                      width: valueOrDefault<double>(
                        widget!.showOrgan ? 400.0 : 440.0,
                        400.0,
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).alternate,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(100),
                          topRight: Radius.circular(100),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
