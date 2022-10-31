import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_request.freezed.dart';
part 'session_request.g.dart';

@freezed
class SessionReqeust with _$SessionReqeust {
  factory SessionReqeust({
    @JsonKey(name: 'session_id') required String value,
  }) = _SessionReqeust;

  factory SessionReqeust.fromJson(Map<String, dynamic> json) =>
      _$SessionReqeustFromJson(json);
}
