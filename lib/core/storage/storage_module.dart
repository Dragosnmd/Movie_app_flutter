import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_database.dart';

@module
@dev
abstract class StorageModule {

  @preResolve
  @dev
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  // late final FlutterSecureStorage _secureStorage;
  @lazySingleton
  @dev
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
