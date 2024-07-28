import 'package:movie_app/movies/domain/entities/movie.dart';

abstract class BaseMovieRepo {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
