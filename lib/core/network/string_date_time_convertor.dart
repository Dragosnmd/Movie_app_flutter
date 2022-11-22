import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

class StringDateTimeConverter implements JsonConverter<DateTime, String> {
  const StringDateTimeConverter();

  @override
  DateTime fromJson(String json) {
    return DateFormat('yyy-MM-dd HH:mm:ss').parse(json, true);
  }

  @override
  String toJson(DateTime data) => DateFormat('yyy-MM-dd HH:mm:ss').format(data);
}
