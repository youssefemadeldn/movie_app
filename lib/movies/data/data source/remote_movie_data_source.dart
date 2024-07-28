import 'package:dio/dio.dart';
import 'package:movie_app/movies/data/models/movie_model.dart';

class RemoteMovieDataSource {
  // Methods
  Future<List<MovieModel>> getNowPlayingMoviesUseCase() async {
    final response = await Dio().get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=232f32895803b83d8683bab61b60814d&language=en-US&page=1");

    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      return [];
    }
  }
}
