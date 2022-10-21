// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginPayload _$$_LoginPayloadFromJson(Map<String, dynamic> json) =>
    _$_LoginPayload(
      username: json['username'] as String,
      password: json['password'] as String,
      requestToken: json['request_token'] as String,
    );

Map<String, dynamic> _$$_LoginPayloadToJson(_$_LoginPayload instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'request_token': instance.requestToken,
    };
