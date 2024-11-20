import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'time_info_model.dart';
export 'time_info_model.dart';

class TimeInfoWidget extends StatefulWidget {
  const TimeInfoWidget({
    super.key,
    String? hours,
    String? minutes,
    bool? paused,
    String? seconds,
    bool? persufflationTime,
    bool? calibrationTime,
  })  : hours = hours ?? '',
        minutes = minutes ?? '',
        paused = paused ?? false,
        seconds = seconds ?? '',
        persufflationTime = persufflationTime ?? true,
        calibrationTime = calibrationTime ?? false;

  final String hours;
  final String minutes;
  final bool paused;
  final String seconds;
  final bool persufflationTime;
  final bool calibrationTime;

  @override
  State<TimeInfoWidget> createState() => _TimeInfoWidgetState();
}

class _TimeInfoWidgetState extends State<TimeInfoWidget> {
  late TimeInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimeInfoModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.persufflationTime)
            Text(
              'Persufflation Time',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Archivo',
                    letterSpacing: 0.0,
                  ),
            ),
          if (widget.calibrationTime)
            Text(
              'Calibration  Time',
              style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Archivo',
                    letterSpacing: 0.0,
                  ),
            ),
          Container(
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (widget.paused == true)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                    child: Icon(
                      Icons.pause_circle,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 20.0,
                    ),
                  ),
                if (widget.hours != '')
                  Text(
                    valueOrDefault<String>(
                      widget.hours,
                      '-',
                    ),
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          fontFamily: 'Archivo',
                          letterSpacing: 0.0,
                        ),
                  ),
                if (widget.hours != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'h',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (widget.minutes != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.minutes,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (widget.minutes != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'm',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (widget.seconds != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                    child: Text(
                      widget.seconds,
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
                if (widget.seconds != '')
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 0.0, 0.0),
                    child: Text(
                      's',
                      style: FlutterFlowTheme.of(context).labelMedium.override(
                            fontFamily: 'Archivo',
                            letterSpacing: 0.0,
                          ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
