import 'dart:developer';
import 'package:netflix_/Api%20functions/api_services.dart';
import 'package:netflix_/models/movies.dart';

class SearchingData {
  Apiservices apiCall = Apiservices();

  Future<List<Movie>> _search(String value) async {
    final result = await apiCall.search(value);
    print(result);
    if (result.isNotEmpty) {
      List<Movie> movieDetails = result.map((dynamic item) {
        String moviePoster = apiCall.imageUrl +
            (item['poster_path'] ?? '/dyA6hSkM0rOIOjIAXHPXTiQ0wxO.jpg');
        String backDrop = apiCall.imageUrl +
            (item['backdrop_path'] ?? '/dyA6hSkM0rOIOjIAXHPXTiQ0wxO.jpg');
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
    log('somthing went wrong');
    return [];
  }

  Future<List<Movie>> getSearchingMovies(String value) async {
    List<Movie> trendingMovies = await _search(value);
    return trendingMovies;
  }
}
