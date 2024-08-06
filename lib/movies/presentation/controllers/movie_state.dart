import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  //
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMovies,
        popularState,
        popularMessage,
      ];
}
