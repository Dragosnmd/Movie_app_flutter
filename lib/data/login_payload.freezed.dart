// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginPayload _$LoginPayloadFromJson(Map<String, dynamic> json) {
  return _LoginPayload.fromJson(json);
}

/// @nodoc
mixin _$LoginPayload {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'request_token')
  String get requestToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginPayloadCopyWith<LoginPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPayloadCopyWith<$Res> {
  factory $LoginPayloadCopyWith(
          LoginPayload value, $Res Function(LoginPayload) then) =
      _$LoginPayloadCopyWithImpl<$Res, LoginPayload>;
  @useResult
  $Res call(
      {String username,
      String password,
      @JsonKey(name: 'request_token') String requestToken});
}

/// @nodoc
class _$LoginPayloadCopyWithImpl<$Res, $Val extends LoginPayload>
    implements $LoginPayloadCopyWith<$Res> {
  _$LoginPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? requestToken = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      requestToken: null == requestToken
          ? _value.requestToken
          : requestToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginPayloadCopyWith<$Res>
    implements $LoginPayloadCopyWith<$Res> {
  factory _$$_LoginPayloadCopyWith(
          _$_LoginPayload value, $Res Function(_$_LoginPayload) then) =
      __$$_LoginPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String username,
      String password,
      @JsonKey(name: 'request_token') String requestToken});
}

/// @nodoc
class __$$_LoginPayloadCopyWithImpl<$Res>
    extends _$LoginPayloadCopyWithImpl<$Res, _$_LoginPayload>
    implements _$$_LoginPayloadCopyWith<$Res> {
  __$$_LoginPayloadCopyWithImpl(
      _$_LoginPayload _value, $Res Function(_$_LoginPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
    Object? requestToken = null,
  }) {
    return _then(_$_LoginPayload(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      requestToken: null == requestToken
          ? _value.requestToken
          : requestToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginPayload implements _LoginPayload {
  _$_LoginPayload(
      {required this.username,
      required this.password,
      @JsonKey(name: 'request_token') required this.requestToken});

  factory _$_LoginPayload.fromJson(Map<String, dynamic> json) =>
      _$$_LoginPayloadFromJson(json);

  @override
  final String username;
  @override
  final String password;
  @override
  @JsonKey(name: 'request_token')
  final String requestToken;

  @override
  String toString() {
    return 'LoginPayload(username: $username, password: $password, requestToken: $requestToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginPayload &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.requestToken, requestToken) ||
                other.requestToken == requestToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, username, password, requestToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginPayloadCopyWith<_$_LoginPayload> get copyWith =>
      __$$_LoginPayloadCopyWithImpl<_$_LoginPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginPayloadToJson(
      this,
    );
  }
}

abstract class _LoginPayload implements LoginPayload {
  factory _LoginPayload(
          {required final String username,
          required final String password,
          @JsonKey(name: 'request_token') required final String requestToken}) =
      _$_LoginPayload;

  factory _LoginPayload.fromJson(Map<String, dynamic> json) =
      _$_LoginPayload.fromJson;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(name: 'request_token')
  String get requestToken;
  @override
  @JsonKey(ignore: true)
  _$$_LoginPayloadCopyWith<_$_LoginPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
