import 'package:get_it/get_it.dart';
import 'package:movie_app/movies/data/data%20source/remote_movie_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repo_imp.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    // BaseRemoteMovieDataSource baseRemoteMovieDataSource =
    //     RemoteMovieDataSourceImp();
    sl.registerLazySingleton<BaseRemoteMovieDataSource>(
        () => RemoteMovieDataSourceImp());

    // BaseMovieRepo baseMovieRepo = MovieRepoImp(baseRemoteMovieDataSource);

    sl.registerLazySingleton<BaseMovieRepo>(() => MovieRepoImp(sl()));

    // final result =
    //     await GetNowPlayingMoviesUseCase(baseMovieRepo).execute();

    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(
        () => GetNowPlayingMoviesUseCase(sl()));
  }
}
