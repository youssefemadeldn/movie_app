import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/data/data%20source/remote_movie_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repo_imp.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controllers/movie_event.dart';
import 'package:movie_app/movies/presentation/controllers/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        BaseRemoteMovieDataSource baseRemoteMovieDataSource =
            RemoteMovieDataSourceImp();
        BaseMovieRepo baseMovieRepo = MovieRepoImp(baseRemoteMovieDataSource);
        final result =
            await GetNowPlayingMoviesUseCase(baseMovieRepo).execute();
        emit(const MovieState(nowPlayingState: RequestState.loaded));
        result.fold(
          (ifLeft) => emit(
            MovieState(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: ifLeft.message,
            ),
          ),
          (ifRight) => emit(
            MovieState(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: ifRight,
            ),
          ),
        );
      },
    );
  }
}
