// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:movie_app/auth/data/account_id_api.dart' as _i15;
import 'package:movie_app/auth/data/get_request_token_api.dart' as _i8;
import 'package:movie_app/auth/data/login_api.dart' as _i9;
import 'package:movie_app/auth/data/login_repository.dart' as _i16;
import 'package:movie_app/auth/presentation/login_view_model.dart' as _i17;
import 'package:movie_app/core/network/network_module.dart' as _i23;
import 'package:movie_app/core/storage/app_database.dart' as _i3;
import 'package:movie_app/core/storage/fake_storage_module.dart' as _i4;
import 'package:movie_app/core/storage/storage_module.dart' as _i22;
import 'package:movie_app/favorites_movie/data/favorites_movie_dao.dart' as _i6;
import 'package:movie_app/favorites_movie/data/favorites_movie_repository.dart'
    as _i7;
import 'package:movie_app/favorites_movie/presentation/favorite_movie_view_model.dart'
    as _i20;
import 'package:movie_app/movie/data/fake_movie_api.dart' as _i11;
import 'package:movie_app/movie/data/movie_api.dart' as _i10;
import 'package:movie_app/movie/data/movie_dao.dart' as _i12;
import 'package:movie_app/movie/data/movie_repository.dart' as _i18;
import 'package:movie_app/movie/presentation/movie_details_view_model.dart'
    as _i21;
import 'package:movie_app/movie/presentation/movies_view_model.dart' as _i19;
import 'package:movie_app/user/data/session_token_api.dart' as _i13;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

const String _dev = 'dev';
const String _test = 'test';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  final storageModule = _$StorageModule();
  final fakeStorageModule = _$FakeStorageModule();
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(
    () => storageModule.database,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i3.AppDatabase>(
    () => fakeStorageModule.database,
    registerFor: {_test},
    dispose: _i4.disposeDatabase,
  );
  gh.lazySingleton<_i5.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i6.FavoriteMoviesDao>(
      () => _i6.FavoriteMoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i7.FavoritesMovieRepository>(
      () => _i7.FavoritesMovieRepository(get<_i6.FavoriteMoviesDao>()));
  gh.lazySingleton<_i8.GetRequestTokenApi>(
      () => _i8.GetRequestTokenApi(get<_i5.Dio>()));
  gh.lazySingleton<_i9.LoginApi>(() => _i9.LoginApi(get<_i5.Dio>()));
  gh.lazySingleton<_i10.MoviesApi>(
    () => _i10.MoviesApi(get<_i5.Dio>()),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i10.MoviesApi>(
    () => _i11.FakeMovieApi(),
    registerFor: {_test},
  );
  gh.lazySingleton<_i12.MoviesDao>(
      () => _i12.MoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i13.SessionTokenApi>(
      () => _i13.SessionTokenApi(get<_i5.Dio>()));
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => storageModule.sharedPreferences,
    registerFor: {_dev},
    preResolve: true,
  );
  await gh.factoryAsync<_i14.SharedPreferences>(
    () => fakeStorageModule.sharedPreferences,
    registerFor: {_test},
    preResolve: true,
  );
  gh.lazySingleton<_i15.AccountIdApi>(() => _i15.AccountIdApi(get<_i5.Dio>()));
  await gh.singletonAsync<_i16.LoginRepository>(
    () => _i16.LoginRepository.create(
      get<_i9.LoginApi>(),
      get<_i8.GetRequestTokenApi>(),
      get<_i13.SessionTokenApi>(),
      get<_i14.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i17.LoginViewModel>(
      () => _i17.LoginViewModel(get<_i16.LoginRepository>()));
  gh.lazySingleton<_i18.MovieRepository>(() => _i18.MovieRepository(
        get<_i12.MoviesDao>(),
        get<_i10.MoviesApi>(),
        get<_i6.FavoriteMoviesDao>(),
      ));
  gh.factory<_i19.MoviesViewModel>(() => _i19.MoviesViewModel(
        get<_i18.MovieRepository>(),
        get<_i7.FavoritesMovieRepository>(),
        get<_i16.LoginRepository>(),
      ));
  gh.factory<_i20.FavoriteViewModel>(() => _i20.FavoriteViewModel(
        get<_i18.MovieRepository>(),
        get<_i7.FavoritesMovieRepository>(),
      ));
  gh.factoryParam<_i21.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i21.MovieDetailsViewModel(
        get<_i18.MovieRepository>(),
        movieId,
        get<_i7.FavoritesMovieRepository>(),
      ));
  return get;
}

class _$StorageModule extends _i22.StorageModule {}

class _$FakeStorageModule extends _i4.FakeStorageModule {}

class _$NetworkModule extends _i23.NetworkModule {}
