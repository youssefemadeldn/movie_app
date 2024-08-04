class ApiConstant {
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String apiKey = "232f32895803b83d8683bab61b60814d";

  static const String nowPlayingMoviesUrl =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String popularMoviesUrl =
      "$baseUrl/movie/popular?api_key=$apiKey";

  static const String topRatedMoviesUrl =
      "$baseUrl/movie/top_rated?api_key=$apiKey";

  static const String baseImageUrl = "https://image.tmdb.org/t/p/w500";

  static String imageUrl(String path) => "$baseImageUrl$path";
}
