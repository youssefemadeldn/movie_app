import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/movies/domain/entities/movie.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepo baseMovieRepo;
  // BaseMovieRepo baseMovieRepo2 = BaseMovieRepo();

  GetNowPlayingMoviesUseCase(this.baseMovieRepo);

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}
