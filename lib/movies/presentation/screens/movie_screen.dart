import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/movies/presentation/controllers/movie_bloc.dart';
import 'package:movie_app/movies/presentation/controllers/movie_event.dart';
import 'package:movie_app/movies/presentation/controllers/movie_state.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MovieBloc>(
      create: (context) {
        return MovieBloc()..add(GetNowPlayingMoviesEvent());
      },
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          print(state);
          return Scaffold();
        },
      ),
    );
  }
}
