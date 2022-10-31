// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionReqeust _$SessionReqeustFromJson(Map<String, dynamic> json) {
  return _SessionReqeust.fromJson(json);
}

/// @nodoc
mixin _$SessionReqeust {
  @JsonKey(name: 'session_id')
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionReqeustCopyWith<SessionReqeust> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionReqeustCopyWith<$Res> {
  factory $SessionReqeustCopyWith(
          SessionReqeust value, $Res Function(SessionReqeust) then) =
      _$SessionReqeustCopyWithImpl<$Res, SessionReqeust>;
  @useResult
  $Res call({@JsonKey(name: 'session_id') String value});
}

/// @nodoc
class _$SessionReqeustCopyWithImpl<$Res, $Val extends SessionReqeust>
    implements $SessionReqeustCopyWith<$Res> {
  _$SessionReqeustCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SessionReqeustCopyWith<$Res>
    implements $SessionReqeustCopyWith<$Res> {
  factory _$$_SessionReqeustCopyWith(
          _$_SessionReqeust value, $Res Function(_$_SessionReqeust) then) =
      __$$_SessionReqeustCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'session_id') String value});
}

/// @nodoc
class __$$_SessionReqeustCopyWithImpl<$Res>
    extends _$SessionReqeustCopyWithImpl<$Res, _$_SessionReqeust>
    implements _$$_SessionReqeustCopyWith<$Res> {
  __$$_SessionReqeustCopyWithImpl(
      _$_SessionReqeust _value, $Res Function(_$_SessionReqeust) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$_SessionReqeust(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SessionReqeust implements _SessionReqeust {
  _$_SessionReqeust({@JsonKey(name: 'session_id') required this.value});

  factory _$_SessionReqeust.fromJson(Map<String, dynamic> json) =>
      _$$_SessionReqeustFromJson(json);

  @override
  @JsonKey(name: 'session_id')
  final String value;

  @override
  String toString() {
    return 'SessionReqeust(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SessionReqeust &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SessionReqeustCopyWith<_$_SessionReqeust> get copyWith =>
      __$$_SessionReqeustCopyWithImpl<_$_SessionReqeust>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionReqeustToJson(
      this,
    );
  }
}

abstract class _SessionReqeust implements SessionReqeust {
  factory _SessionReqeust(
          {@JsonKey(name: 'session_id') required final String value}) =
      _$_SessionReqeust;

  factory _SessionReqeust.fromJson(Map<String, dynamic> json) =
      _$_SessionReqeust.fromJson;

  @override
  @JsonKey(name: 'session_id')
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$_SessionReqeustCopyWith<_$_SessionReqeust> get copyWith =>
      throw _privateConstructorUsedError;
}
