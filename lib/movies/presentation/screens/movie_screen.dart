import 'package:flutter/material.dart';
import 'package:movie_app/movies/data/data%20source/remote_movie_data_source.dart';
import 'package:movie_app/movies/data/repository/movie_repo_imp.dart';
import 'package:movie_app/movies/domain/repository/base_movie_repo.dart';
import 'package:movie_app/movies/domain/use%20cases/get_now_playing_movies_use_case.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() async {
    BaseRemoteMovieDataSource remoteMovieDataSource =
        RemoteMovieDataSourceImp();
    BaseMovieRepo movieRepo = MovieRepoImp(remoteMovieDataSource);
    final result = await GetNowPlayingMoviesUseCase(movieRepo).execute();
    print(result);
  }
}
