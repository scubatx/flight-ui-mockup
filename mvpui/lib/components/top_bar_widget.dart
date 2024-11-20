import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'top_bar_model.dart';
export 'top_bar_model.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({
    super.key,
    required this.bluetooth,
    bool? chargingStatus,
    int? batteryPercentage,
    bool? lidStatus,
  })  : chargingStatus = chargingStatus ?? false,
        batteryPercentage = batteryPercentage ?? 8,
        lidStatus = lidStatus ?? false;

  final Bluetooth? bluetooth;
  final bool chargingStatus;
  final int batteryPercentage;
  final bool lidStatus;

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  late TopBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TopBarModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(5.0, 2.0, 0.0, 2.0),
            child: Container(
              decoration: const BoxDecoration(),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                    child: Container(
                      width: 30.0,
                      decoration: const BoxDecoration(),
                      child: Builder(
                        builder: (context) {
                          if (widget.chargingStatus == true) {
                            return Builder(
                              builder: (context) {
                                if (widget.batteryPercentage > 80) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 5.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/BatteryC100.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                } else if (widget.batteryPercentage > 60) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/BatteryC50.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/BatteryC10.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            return Builder(
                              builder: (context) {
                                if (widget.batteryPercentage > 80) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Battery100.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                } else if (widget.batteryPercentage > 60) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Battery50.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                } else if (widget.batteryPercentage > 10) {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Battery10.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        2.0, 0.0, 2.0, 0.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(0.0),
                                      child: Image.asset(
                                        'assets/images/Battery5.png',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  Text(
                    widget.batteryPercentage.toString(),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Archivo',
                          letterSpacing: 0.0,
                        ),
                  ),
                  Text(
                    '%',
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'Archivo',
                          letterSpacing: 0.0,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 60.0,
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (!widget.lidStatus)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(0.0),
                      topLeft: Radius.circular(0.0),
                      topRight: Radius.circular(0.0),
                    ),
                    child: Image.asset(
                      'assets/images/LidOpen.png',
                      width: 20.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (widget.bluetooth != Bluetooth.NotActive)
                  Container(
                    width: 25.0,
                    decoration: const BoxDecoration(),
                    child: Builder(
                      builder: (context) {
                        if (widget.bluetooth == Bluetooth.Active) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/Bluetooth_Not_Connected.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        } else if (widget.bluetooth == Bluetooth.Paired) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/Bluetooth_Connected.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        } else if (widget.bluetooth == Bluetooth.Fault) {
                          return ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(0.0),
                            ),
                            child: Image.asset(
                              'assets/images/Bluetooth_Fault.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return Container(
                            decoration: const BoxDecoration(),
                          );
                        }
                      },
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
