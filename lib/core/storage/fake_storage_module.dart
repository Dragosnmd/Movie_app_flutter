import 'dart:async';

import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/core/storage/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
@test
abstract class FakeStorageModule {
  @preResolve
  @test
  Future<SharedPreferences> get sharedPreferences async {
    SharedPreferences.setMockInitialValues({});
    return await SharedPreferences.getInstance();
  }

  // late final FlutterSecureStorage _secureStorage;
  @LazySingleton(dispose: disposeDatabase)
  @test
  AppDatabase get database => AppDatabase(NativeDatabase.memory());
}

/// dispose function signature must match Function(T instance)
FutureOr disposeDatabase(AppDatabase instance) async {
  await instance.close();
}