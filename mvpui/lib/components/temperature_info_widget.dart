import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'temperature_info_model.dart';
export 'temperature_info_model.dart';

class TemperatureInfoWidget extends StatefulWidget {
  const TemperatureInfoWidget({
    super.key,
    this.value,
    required this.units,
    this.latchedTemperature,
    bool? temperatureTarget,
    bool? latchedTemperatureVisible,
  })  : this.temperatureTarget = temperatureTarget ?? false,
        this.latchedTemperatureVisible = latchedTemperatureVisible ?? false;

  final int? value;
  final TemperatureFormat? units;
  final int? latchedTemperature;
  final bool temperatureTarget;
  final bool latchedTemperatureVisible;

  @override
  State<TemperatureInfoWidget> createState() => _TemperatureInfoWidgetState();
}

class _TemperatureInfoWidgetState extends State<TemperatureInfoWidget> {
  late TemperatureInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TemperatureInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Builder(
            builder: (context) {
              if (widget!.temperatureTarget) {
                return Text(
                  'Temperature Target',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Archivo',
                    letterSpacing: 0.0,
                  ),
                );
              } else {
                return Text(
                  'Temperature',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Archivo',
                    letterSpacing: 0.0,
                  ),
                );
              }
            },
          ),
          if (widget!.latchedTemperatureVisible)
            Container(
              decoration: BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
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
                      widget!.latchedTemperature?.toString(),
                      '0',
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                      fontFamily: 'Archivo',
                      color: FlutterFlowTheme.of(context).error,
                      letterSpacing: 0.0,
                    ),
                  ),
                  Builder(
                    builder: (context) {
                      if (widget!.units == TemperatureFormat.Fahrenheit) {
                        return Text(
                          '°F',
                          style:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Archivo',
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                          ),
                        );
                      } else {
                        return Text(
                          '°C',
                          style:
                          FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Archivo',
                            color: FlutterFlowTheme.of(context).error,
                            letterSpacing: 0.0,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          Container(
            decoration: BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  valueOrDefault<String>(
                    widget!.value?.toString(),
                    '-',
                  ),
                  style: FlutterFlowTheme.of(context).titleMedium.override(
                    fontFamily: 'Archivo',
                    letterSpacing: 0.0,
                  ),
                ),
                Builder(
                  builder: (context) {
                    if (widget!.units == TemperatureFormat.Fahrenheit) {
                      return Text(
                        '°F',
                        style:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Archivo',
                          letterSpacing: 0.0,
                        ),
                      );
                    } else {
                      return Text(
                        '°C',
                        style:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Archivo',
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
    );
  }
}
