import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data%20source/remote_movie_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repo_imp.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controllers/movie_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // Register RemoteMovieDataSourceImp as BaseRemoteMovieDataSource
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSourceImp());

    // Register MovieRepoImp as BaseMovieRepo
    sl.registerLazySingleton<BaseMovieRepo>(
        () => MovieRepoImp(sl<BaseRemoteMovieDataSource>()));

    // Register GetNowPlayingMoviesUseCase
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl<BaseMovieRepo>()));

    // Register GetNowPlayingMoviesUseCase
    sl.registerFactory(() =>
        MovieBloc(sl())); // create different object every time you call it
  }
}
