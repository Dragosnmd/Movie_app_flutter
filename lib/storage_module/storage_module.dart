import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:movie_app/storage_module/app_database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  // static StorageModule? _storageModule;

  // StorageModule();
  // static StorageModule getInstance() {
  //   if (_storageModule != null) {
  //     return _storageModule!;
  //   }
  //   _storageModule = StorageModule._();
  //   return _storageModule!;
  // }
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  // late final FlutterSecureStorage _secureStorage;
  @lazySingleton
  AppDatabase get database => AppDatabase();

  // static Future<StorageModule> createModule() async {
  //   final module = StorageModule();
  //   module._sharedPreference = await SharedPreferences.getInstance();
  //   module._secureStorage = const FlutterSecureStorage();
  //   return module;
  // }

  // SharedPreferences get sharedPreferences => _sharedPreference;
  // FlutterSecureStorage get secureStorage => _secureStorage;
}
