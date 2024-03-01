import 'package:netflix_/Api%20functions/api_services.dart';
import 'package:netflix_/models/movies.dart';

class MovieData {
  Apiservices apiservices = Apiservices();
  final String trendingmovieurl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=';
  final String topratedmovieurl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=';
  final String nowplayingmoviesurl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=';
  final String upcomingmovie =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=';
  final String nowplayingmovieurl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=';
  final String upcomingmovieurl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=';
  Future<List<Movie>> fetchMovieData(String url) async {
    final result = await apiservices.getData(url);
    if (result.isNotEmpty) {
      List<Movie> movieDetails = result.map((dynamic item) {
        String moviePoster = apiservices.imageUrl + item['poster_path'];
        String backDrop = apiservices.imageUrl +
            (item['backdrop_path'] ?? item['poster_path']);
        return Movie(
          movieName: item['original_title'],
          moviePoster: moviePoster,
          movieBackdrop: backDrop,
          movieOverview: item['overview'],
          releaseDate: item['release_date'],
          id: item['id'],
        );
      }).toList();

      return movieDetails;
    }
    print('somthing went wrong');
    return [];
  }

  Future<String> gettrendingmoviewallpaper() async {
    List<Movie> trendingMovies = await fetchMovieData(trendingmovieurl);
    Movie topMovie = trendingMovies[0];
    return topMovie.moviePoster;
  }

  Future<List<Movie>> getTrendingMovies() async {
    List<Movie> trendingMovies = await fetchMovieData(trendingmovieurl);
    return trendingMovies;
  }

  Future<List<Movie>> getratedmovies() async {
    List<Movie> trendingMovies = await fetchMovieData(topratedmovieurl);
    return trendingMovies;
  }

  Future<List<Movie>> getupcoming() async {
    List<Movie> trendingMovies = await fetchMovieData(upcomingmovie);
    return trendingMovies;
  }

  Future<List<Movie>> getNowPlayingMovies() async {
    return await fetchMovieData(nowplayingmovieurl);
  }

  Future<List<Movie>> getUpcomingMovies() async {
    return await fetchMovieData(upcomingmovieurl);
  }
}
