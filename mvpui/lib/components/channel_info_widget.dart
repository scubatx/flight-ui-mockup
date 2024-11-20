import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'channel_info_model.dart';
export 'channel_info_model.dart';

class ChannelInfoWidget extends StatefulWidget {
  const ChannelInfoWidget({
    super.key,
    String? flow,
    String? pressure,
    String? channelNo,
    bool? flowAlert,
    bool? pressureAlert,
    bool? pressureAlarm,
  })  : this.flow = flow ?? '-',
        this.pressure = pressure ?? '-',
        this.channelNo = channelNo ?? '1',
        this.flowAlert = flowAlert ?? false,
        this.pressureAlert = pressureAlert ?? false,
        this.pressureAlarm = pressureAlarm ?? false;

  final String flow;
  final String pressure;
  final String channelNo;
  final bool flowAlert;
  final bool pressureAlert;
  final bool pressureAlarm;

  @override
  State<ChannelInfoWidget> createState() => _ChannelInfoWidgetState();
}

class _ChannelInfoWidgetState extends State<ChannelInfoWidget> {
  late ChannelInfoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChannelInfoModel());
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
                    'CHANNEL',
                    style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Archivo',
                      letterSpacing: 0.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                    child: Text(
                      widget!.channelNo,
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
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
                        'Flow',
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      valueOrDefault<String>(
                        widget!.flow,
                        '-',
                      ),
                      style:
                      FlutterFlowTheme.of(context).displayMedium.override(
                        fontFamily: 'Archivo',
                        color: widget!.flowAlert
                            ? FlutterFlowTheme.of(context).warning
                            : FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 2),
                    child: Text(
                      'ml/min',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
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
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                    child: Text(
                      'Pressure',
                      style: FlutterFlowTheme.of(context).titleMedium.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      widget!.pressure,
                      style: FlutterFlowTheme.of(context)
                          .displayMedium
                          .override(
                        fontFamily: 'Archivo',
                        color: () {
                          if (widget!.pressureAlarm) {
                            return FlutterFlowTheme.of(context).error;
                          } else if (widget!.pressureAlert) {
                            return FlutterFlowTheme.of(context).warning;
                          } else {
                            return FlutterFlowTheme.of(context).primaryText;
                          }
                        }(),
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 2),
                    child: Text(
                      'mmHg',
                      style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily: 'Archivo',
                        letterSpacing: 0.0,
                      ),
                    ),
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
