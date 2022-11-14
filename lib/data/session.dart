import 'package:freezed_annotation/freezed_annotation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
class SessionLoad with _$SessionLoad {
  factory SessionLoad({
    @JsonKey(name: 'request_token') required String requestToken,
  }) = _SessionLoad;

  factory SessionLoad.fromJson(Map<String, dynamic> json) =>
      _$SessionLoadFromJson(json);
}
