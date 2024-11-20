// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AlertStruct extends BaseStruct {
  AlertStruct({
    String? code,
    String? text,
    AlertPriority? priority,
  })  : _code = code,
        _text = text,
        _priority = priority;

  // "Code" field.
  String? _code;
  String get code => _code ?? 'PSF.0.1';
  set code(String? val) => _code = val;

  bool hasCode() => _code != null;

  // "Text" field.
  String? _text;
  String get text => _text ?? 'Excessive Overpressure';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  // "Priority" field.
  AlertPriority? _priority;
  AlertPriority get priority => _priority ?? AlertPriority.High;
  set priority(AlertPriority? val) => _priority = val;

  bool hasPriority() => _priority != null;

  static AlertStruct fromMap(Map<String, dynamic> data) => AlertStruct(
        code: data['Code'] as String?,
        text: data['Text'] as String?,
        priority: deserializeEnum<AlertPriority>(data['Priority']),
      );

  static AlertStruct? maybeFromMap(dynamic data) =>
      data is Map ? AlertStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Code': _code,
        'Text': _text,
        'Priority': _priority?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Code': serializeParam(
          _code,
          ParamType.String,
        ),
        'Text': serializeParam(
          _text,
          ParamType.String,
        ),
        'Priority': serializeParam(
          _priority,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static AlertStruct fromSerializableMap(Map<String, dynamic> data) =>
      AlertStruct(
        code: deserializeParam(
          data['Code'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['Text'],
          ParamType.String,
          false,
        ),
        priority: deserializeParam<AlertPriority>(
          data['Priority'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'AlertStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AlertStruct &&
        code == other.code &&
        text == other.text &&
        priority == other.priority;
  }

  @override
  int get hashCode => const ListEquality().hash([code, text, priority]);
}

AlertStruct createAlertStruct({
  String? code,
  String? text,
  AlertPriority? priority,
}) =>
    AlertStruct(
      code: code,
      text: text,
      priority: priority,
    );
