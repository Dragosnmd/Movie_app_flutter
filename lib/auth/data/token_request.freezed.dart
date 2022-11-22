// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'token_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TokenRequest _$TokenRequestFromJson(Map<String, dynamic> json) {
  return _TokenRequest.fromJson(json);
}

/// @nodoc
mixin _$TokenRequest {
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_token')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TokenRequestCopyWith<TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TokenRequestCopyWith<$Res> {
  factory $TokenRequestCopyWith(
          TokenRequest value, $Res Function(TokenRequest) then) =
      _$TokenRequestCopyWithImpl<$Res, TokenRequest>;
  @useResult
  $Res call(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          DateTime expiresAt,
      @JsonKey(name: 'request_token')
          String value});
}

/// @nodoc
class _$TokenRequestCopyWithImpl<$Res, $Val extends TokenRequest>
    implements $TokenRequestCopyWith<$Res> {
  _$TokenRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiresAt = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TokenRequestCopyWith<$Res>
    implements $TokenRequestCopyWith<$Res> {
  factory _$$_TokenRequestCopyWith(
          _$_TokenRequest value, $Res Function(_$_TokenRequest) then) =
      __$$_TokenRequestCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          DateTime expiresAt,
      @JsonKey(name: 'request_token')
          String value});
}

/// @nodoc
class __$$_TokenRequestCopyWithImpl<$Res>
    extends _$TokenRequestCopyWithImpl<$Res, _$_TokenRequest>
    implements _$$_TokenRequestCopyWith<$Res> {
  __$$_TokenRequestCopyWithImpl(
      _$_TokenRequest _value, $Res Function(_$_TokenRequest) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? expiresAt = null,
    Object? value = null,
  }) {
    return _then(_$_TokenRequest(
      expiresAt: null == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TokenRequest implements _TokenRequest {
  _$_TokenRequest(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          required this.expiresAt,
      @JsonKey(name: 'request_token')
          required this.value});

  factory _$_TokenRequest.fromJson(Map<String, dynamic> json) =>
      _$$_TokenRequestFromJson(json);

  @override
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  final DateTime expiresAt;
  @override
  @JsonKey(name: 'request_token')
  final String value;

  @override
  String toString() {
    return 'TokenRequest(expiresAt: $expiresAt, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TokenRequest &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, expiresAt, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TokenRequestCopyWith<_$_TokenRequest> get copyWith =>
      __$$_TokenRequestCopyWithImpl<_$_TokenRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TokenRequestToJson(
      this,
    );
  }
}

abstract class _TokenRequest implements TokenRequest {
  factory _TokenRequest(
      {@StringDateTimeConverter()
      @JsonKey(name: 'expires_at')
          required final DateTime expiresAt,
      @JsonKey(name: 'request_token')
          required final String value}) = _$_TokenRequest;

  factory _TokenRequest.fromJson(Map<String, dynamic> json) =
      _$_TokenRequest.fromJson;

  @override
  @StringDateTimeConverter()
  @JsonKey(name: 'expires_at')
  DateTime get expiresAt;
  @override
  @JsonKey(name: 'request_token')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_TokenRequestCopyWith<_$_TokenRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
