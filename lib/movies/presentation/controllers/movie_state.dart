import 'package:equatable/equatable.dart';
import 'package:movie_app/core/utils/enum.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;

  final String message;

  const MovieState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = "",
  });

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        message,
      ];
}
