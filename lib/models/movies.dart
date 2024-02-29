class Movie {
  final String movieName;
  final String movieOverview;
  final String moviePoster;
  final String movieBackdrop;
  final String releaseDate;
  final id;

  Movie({
    required this.movieName,
    required this.movieOverview,
    required this.moviePoster,
    required this.movieBackdrop,
    required this.releaseDate,
    required this.id,
  });
  Map<String, dynamic> toMap() {
    return {
      'movieName': movieName,
      'moviePoster': moviePoster,
      'movieBackdrop': movieBackdrop,
      'movieOverview': movieOverview,
      'releaseDate': releaseDate,
      'id': id,
    };
  }
}
