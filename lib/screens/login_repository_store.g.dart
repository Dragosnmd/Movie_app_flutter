// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_repository_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginRepositoryStore on _LoginRepositoryStore, Store {
  Computed<bool>? _$isLoginComputed;

  @override
  bool get isLogin => (_$isLoginComputed ??= Computed<bool>(() => super.isLogin,
          name: '_LoginRepositoryStore.isLogin'))
      .value;

  late final _$isLogedinAtom =
      Atom(name: '_LoginRepositoryStore.isLogedin', context: context);

  @override
  bool get isLogedin {
    _$isLogedinAtom.reportRead();
    return super.isLogedin;
  }

  @override
  set isLogedin(bool value) {
    _$isLogedinAtom.reportWrite(value, super.isLogedin, () {
      super.isLogedin = value;
    });
  }

  @override
  String toString() {
    return '''
isLogedin: ${isLogedin},
isLogin: ${isLogin}
    ''';
  }
}
