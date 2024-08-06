import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';
import 'package:movie_app/movies/presentation/controllers/movie_event.dart';
import 'package:movie_app/movies/presentation/controllers/movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  MovieBloc(this.getNowPlayingMoviesUseCase) : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(
      (event, emit) async {
        final result = await getNowPlayingMoviesUseCase.execute();
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
