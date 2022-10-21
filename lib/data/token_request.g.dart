// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TokenRequest _$$_TokenRequestFromJson(Map<String, dynamic> json) =>
    _$_TokenRequest(
      expiresAt: const StringDateTimeConverter()
          .fromJson(json['expires_at'] as String),
      value: json['request_token'] as String,
    );

Map<String, dynamic> _$$_TokenRequestToJson(_$_TokenRequest instance) =>
    <String, dynamic>{
      'expires_at': const StringDateTimeConverter().toJson(instance.expiresAt),
      'request_token': instance.value,
    };
