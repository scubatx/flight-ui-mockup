import 'package:collection/collection.dart';

enum TemperatureFormat {
  Celsius,
  Fahrenheit,
}

enum OrganType {
  Pancreas,
  Kidney,
  Liver,
  Heart,
  CompositeTissue,
  Lung,
}

enum Bluetooth {
  NotActive,
  Active,
  Paired,
  Fault,
}

enum AlertPriority {
  low,
  Medium,
  High,
}

enum DeviceStatus {
  NoDisplay,
  SplashScreen,
  Initialising,
  InsertConsumable,
  Authenticating,
  Calibrating,
  ReadytoCalibrate,
  Updating,
  ReadyToPersufflate,
  PersufflationPaused,
  PersufflatingNormal,
  PersufflatingAlert,
  PersufflatingAlarm,
  PersufflationHalted,
  InvalidConsumable,
  ExpiredConsumable,
  SystemError,
  CalibrationBlocked,
  ActivePreservation,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (TemperatureFormat):
      return TemperatureFormat.values.deserialize(value) as T?;
    case (OrganType):
      return OrganType.values.deserialize(value) as T?;
    case (Bluetooth):
      return Bluetooth.values.deserialize(value) as T?;
    case (AlertPriority):
      return AlertPriority.values.deserialize(value) as T?;
    case (DeviceStatus):
      return DeviceStatus.values.deserialize(value) as T?;
    default:
      return null;
  }
}
