import 'package:fast_cli_demo/app/services.dart';

DateTime? getDateTimeFromTimestamp(dynamic value) {
  if (value == null) return null;
  return connectorService.getDateTimeFromTimestamp(value);
}

getTimestampFromDateTime(DateTime? value) {
  if (value == null) return null;
  return connectorService.getTimestampFromDateTime(value);
}
