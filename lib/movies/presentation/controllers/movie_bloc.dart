import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/domain/use%20cases/get_popular_movies_use_case.dart';
import 'package:movie_app/movies/domain/use%20cases/get_top_rated_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controllers/movie_event.dart';
import 'package:movie_app/movies/presentation/controllers/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MovieBloc(this.getNowPlayingMoviesUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
        result.fold(
          (failure) => emit(
            state.copWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: failure.message,
            ),
          ),
          (movies) => emit(
            state.copWith(
              nowPlayingState: RequestState.loaded,
              nowPlayingMovies: movies,
            ),
          ),
        );
      },
    );

    on<GetPopularMoviesEvent>(
      (event, emit) async {
        final result = await getPopularMoviesUseCase.execute();

        result.fold(
          (failure) => emit(
            state.copWith(
              popularState: RequestState.error,
              popularMessage: failure.message,
            ),
          ),
          (movies) => state.copWith(
            popularState: RequestState.loaded,
            popularMovies: movies,
          ),
        );
      },
    );
  }
}
