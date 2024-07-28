import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';

class GetTopRatedMoviesUseCase {
  final BaseMovieRepo baseMovieRepo;

  GetTopRatedMoviesUseCase(this.baseMovieRepo);

  Future<List<Movie>> execute() async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}
