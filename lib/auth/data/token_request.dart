
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../core/network/string_date_time_convertor.dart';

part 'token_request.freezed.dart';
part 'token_request.g.dart';

@freezed
class TokenRequest with _$TokenRequest {
  factory TokenRequest({
    @StringDateTimeConverter()
    @JsonKey(name: 'expires_at')
        required DateTime expiresAt,
    @JsonKey(name: 'request_token') required String value,
  }) = _TokenRequest;

  factory TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$TokenRequestFromJson(json);
}
