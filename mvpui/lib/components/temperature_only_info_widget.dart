import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'temperature_only_info_model.dart';
export 'temperature_only_info_model.dart';

class TemperatureOnlyInfoWidget extends StatefulWidget {
  const TemperatureOnlyInfoWidget({
    super.key,
    this.target,
    this.value,
    required this.latchedValue,
    required this.units,
    bool? latched,
  }) : this.latched = latched ?? false;

  final int? target;
  final int? value;
  final int? latchedValue;
  final TemperatureFormat? units;
  final bool latched;

  @override
  State<TemperatureOnlyInfoWidget> createState() =>
      _TemperatureOnlyInfoWidgetState();
}

class _TemperatureOnlyInfoWidgetState extends State<TemperatureOnlyInfoWidget> {
  late TemperatureOnlyInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemperatureOnlyInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height * 1,
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(1, 1, 1, 1),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    'TEMPERATURE',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Archivo',
                      letterSpacing: 0.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                      child: Text(
                        'Target',
                        style:
                        FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Archivo',
                          letterSpacing: 0.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.target?.toString(),
                        '0',
                      ),
                      style:
                      FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget!.units == TemperatureFormat.Fahrenheit) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '°F',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Archivo',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '°C',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Archivo',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              Divider(
                height: 20,
                thickness: 1,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: Text(
                      'Actual',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  if (widget!.latched)
                    Container(
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                            EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: Image.asset(
                                  'assets/images/Alarm.png',
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            valueOrDefault<String>(
                              widget!.latchedValue?.toString(),
                              '0',
                            ),
                            style: FlutterFlowTheme.of(context)
                                .titleMedium
                                .override(
                              fontFamily: 'Archivo',
                              color: FlutterFlowTheme.of(context).error,
                              letterSpacing: 0.0,
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              if (widget!.units ==
                                  TemperatureFormat.Fahrenheit) {
                                return Text(
                                  '°F',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                    fontFamily: 'Archivo',
                                    color:
                                    FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                                );
                              } else {
                                return Text(
                                  '°C',
                                  style: FlutterFlowTheme.of(context)
                                      .labelMedium
                                      .override(
                                    fontFamily: 'Archivo',
                                    color:
                                    FlutterFlowTheme.of(context).error,
                                    letterSpacing: 0.0,
                                  ),
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.value?.toString(),
                        '0',
                      ),
                      style:
                      FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget!.units == TemperatureFormat.Fahrenheit) {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '°F',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Archivo',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                          child: Text(
                            '°C',
                            style: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Archivo',
                              color:
                              FlutterFlowTheme.of(context).primaryText,
                              letterSpacing: 0.0,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
