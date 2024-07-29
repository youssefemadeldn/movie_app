import 'package:dio/dio.dart';
import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/network/api_constant.dart';
import 'package:movie_app/core/network/error_message_model.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

abstract class BaseRemoteMovieDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource {
  // Methods
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstant.nowPlayingMoviesUrl);

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerExceptions(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }
}
