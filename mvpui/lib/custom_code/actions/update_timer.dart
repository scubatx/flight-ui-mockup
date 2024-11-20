// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import "dart:async";
import "dart:math";

Future updateTimer(State widget) async {
  Timer.periodic(const Duration(seconds: 1), (timer) {
    print(timer.tick);
    widget._model.temperatureBowl = Random().nextInt(3) + 2;
  });
}

void handleTimeout(Timer timer) {
  //_model.flow1 = Random().nextInt(5) + 20;
  //_model.temperatureBowl = Random().nextInt(3) + 2;

  //super.setState(() {});
}
