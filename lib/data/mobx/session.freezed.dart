// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionLoad _$SessionLoadFromJson(Map<String, dynamic> json) {
  return _SessionLoad.fromJson(json);
}

/// @nodoc
mixin _$SessionLoad {
  @JsonKey(name: 'request_token')
  String get requestToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionLoadCopyWith<SessionLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionLoadCopyWith<$Res> {
  factory $SessionLoadCopyWith(
          SessionLoad value, $Res Function(SessionLoad) then) =
      _$SessionLoadCopyWithImpl<$Res, SessionLoad>;
  @useResult
  $Res call({@JsonKey(name: 'request_token') String requestToken});
}

/// @nodoc
class _$SessionLoadCopyWithImpl<$Res, $Val extends SessionLoad>
    implements $SessionLoadCopyWith<$Res> {
  _$SessionLoadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestToken = null,
  }) {
    return _then(_value.copyWith(
      requestToken: null == requestToken
          ? _value.requestToken
          : requestToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionLoadCopyWith<$Res>
    implements $SessionLoadCopyWith<$Res> {
  factory _$$_SessionLoadCopyWith(
          _$_SessionLoad value, $Res Function(_$_SessionLoad) then) =
      __$$_SessionLoadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'request_token') String requestToken});
}

/// @nodoc
class __$$_SessionLoadCopyWithImpl<$Res>
    extends _$SessionLoadCopyWithImpl<$Res, _$_SessionLoad>
    implements _$$_SessionLoadCopyWith<$Res> {
  __$$_SessionLoadCopyWithImpl(
      _$_SessionLoad _value, $Res Function(_$_SessionLoad) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? requestToken = null,
  }) {
    return _then(_$_SessionLoad(
      requestToken: null == requestToken
          ? _value.requestToken
          : requestToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionLoad implements _SessionLoad {
  _$_SessionLoad({@JsonKey(name: 'request_token') required this.requestToken});

  factory _$_SessionLoad.fromJson(Map<String, dynamic> json) =>
      _$$_SessionLoadFromJson(json);

  @override
  @JsonKey(name: 'request_token')
  final String requestToken;

  @override
  String toString() {
    return 'SessionLoad(requestToken: $requestToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionLoad &&
            (identical(other.requestToken, requestToken) ||
                other.requestToken == requestToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, requestToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionLoadCopyWith<_$_SessionLoad> get copyWith =>
      __$$_SessionLoadCopyWithImpl<_$_SessionLoad>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionLoadToJson(
      this,
    );
  }
}

abstract class _SessionLoad implements SessionLoad {
  factory _SessionLoad(
      {@JsonKey(name: 'request_token')
          required final String requestToken}) = _$_SessionLoad;

  factory _SessionLoad.fromJson(Map<String, dynamic> json) =
      _$_SessionLoad.fromJson;

  @override
  @JsonKey(name: 'request_token')
  String get requestToken;
  @override
  @JsonKey(ignore: true)
  _$$_SessionLoadCopyWith<_$_SessionLoad> get copyWith =>
      throw _privateConstructorUsedError;
}
