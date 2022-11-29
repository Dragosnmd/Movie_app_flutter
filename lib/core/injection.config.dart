// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../auth/data/account_id_api.dart' as _i13;
import '../auth/data/get_request_token_api.dart' as _i7;
import '../auth/data/login_api.dart' as _i8;
import '../auth/data/login_repository.dart' as _i14;
import '../auth/presentation/login_view_model.dart' as _i15;
import '../favorites_movie/data/favorites_movie_dao.dart' as _i5;
import '../favorites_movie/data/favorites_movie_repository.dart' as _i6;
import '../favorites_movie/presentation/favorite_movie_view_model.dart' as _i18;
import '../movie/data/movie_api.dart' as _i9;
import '../movie/data/movie_dao.dart' as _i10;
import '../movie/data/movie_repository.dart' as _i16;
import '../movie/presentation/movie_details_view_model.dart' as _i19;
import '../movie/presentation/movies_view_model.dart' as _i17;
import '../user/data/session_token_api.dart' as _i11;
import 'network/network_module.dart' as _i21;
import 'storage/app_database.dart' as _i3;
import 'storage/storage_module.dart'
    as _i20; // ignore_for_file: unnecessary_lambdas

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
  final networkModule = _$NetworkModule();
  gh.lazySingleton<_i3.AppDatabase>(() => storageModule.database);
  gh.lazySingleton<_i4.Dio>(() => networkModule.dio);
  gh.lazySingleton<_i5.FavoriteMoviesDao>(
      () => _i5.FavoriteMoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i6.FavoritesMovieRepository>(
      () => _i6.FavoritesMovieRepository(get<_i5.FavoriteMoviesDao>()));
  gh.lazySingleton<_i7.GetRequestTokenApi>(
      () => _i7.GetRequestTokenApi(get<_i4.Dio>()));
  gh.lazySingleton<_i8.LoginApi>(() => _i8.LoginApi(get<_i4.Dio>()));
  gh.lazySingleton<_i9.MoviesApi>(() => _i9.MoviesApi(get<_i4.Dio>()));
  gh.lazySingleton<_i10.MoviesDao>(
      () => _i10.MoviesDao(get<_i3.AppDatabase>()));
  gh.lazySingleton<_i11.SessionTokenApi>(
      () => _i11.SessionTokenApi(get<_i4.Dio>()));
  await gh.factoryAsync<_i12.SharedPreferences>(
    () => storageModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i13.AccountIdApi>(() => _i13.AccountIdApi(get<_i4.Dio>()));
  await gh.singletonAsync<_i14.LoginRepository>(
    () => _i14.LoginRepository.create(
      get<_i8.LoginApi>(),
      get<_i7.GetRequestTokenApi>(),
      get<_i11.SessionTokenApi>(),
      get<_i12.SharedPreferences>(),
    ),
    preResolve: true,
  );
  gh.factory<_i15.LoginViewModel>(
      () => _i15.LoginViewModel(get<_i14.LoginRepository>()));
  gh.lazySingleton<_i16.MovieRepository>(() => _i16.MovieRepository(
        get<_i10.MoviesDao>(),
        get<_i9.MoviesApi>(),
        get<_i5.FavoriteMoviesDao>(),
      ));
  gh.factory<_i17.MoviesViewModel>(() => _i17.MoviesViewModel(
        get<_i16.MovieRepository>(),
        get<_i6.FavoritesMovieRepository>(),
        get<_i14.LoginRepository>(),
      ));
  gh.factory<_i18.FavoriteViewModel>(
      () => _i18.FavoriteViewModel(get<_i16.MovieRepository>()));
  gh.factoryParam<_i19.MovieDetailsViewModel, int, dynamic>((
    movieId,
    _,
  ) =>
      _i19.MovieDetailsViewModel(
        get<_i16.MovieRepository>(),
        movieId,
        get<_i6.FavoritesMovieRepository>(),
      ));
  return get;
}

class _$StorageModule extends _i20.StorageModule {}

class _$NetworkModule extends _i21.NetworkModule {}
