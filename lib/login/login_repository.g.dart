// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginRepository on LoginRepositoryBase, Store {
  late final _$loginSucceedAtom =
      Atom(name: 'LoginRepositoryBase.loginSucceed', context: context);

  @override
  bool get loginSucceed {
    _$loginSucceedAtom.reportRead();
    return super.loginSucceed;
  }

  @override
  set loginSucceed(bool value) {
    _$loginSucceedAtom.reportWrite(value, super.loginSucceed, () {
      super.loginSucceed = value;
    });
  }

  @override
  String toString() {
    return '''
loginSucceed: ${loginSucceed}
    ''';
  }
}
