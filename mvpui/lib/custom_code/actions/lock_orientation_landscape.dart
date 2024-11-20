// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter/services.dart';

Future lockOrientationLandscape() async {
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeRight]);

/*
await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
*/

/*
await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
*/
}
