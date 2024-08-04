import 'package:flutter/material.dart';
import 'package:movie_app/core/services/service_locator.dart';
import 'package:movie_app/movies/presentation/screens/movie_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MovieScreen(),
    );
  }
}
