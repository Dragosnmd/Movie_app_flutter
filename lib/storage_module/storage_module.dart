import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movie_app/storage_module/app_database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageModule {
  static StorageModule? _storageModule;

  StorageModule._();
  static StorageModule getInstance() {
    if (_storageModule != null) {
      return _storageModule!;
    }
    _storageModule = StorageModule._();
    return _storageModule!;
  }

  late final SharedPreferences _sharedPreference;

  late final FlutterSecureStorage _secureStorage;

  late final AppDatabase database;

  Future<void> initModule() async {
    _sharedPreference = await SharedPreferences.getInstance();

    _secureStorage = const FlutterSecureStorage();

    database = AppDatabase();
  }

  SharedPreferences get sharedPreferences => _sharedPreference;

  FlutterSecureStorage get secureStorage => _secureStorage;

  // Database get database => _database;
}
