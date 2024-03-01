import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Apiservices {
  String apikey = '1d15beb271d7263dc3a59a6b9fc6b5c3';
  String imageUrl = "https://image.tmdb.org/t/p/w500";
  String readaccestoken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZDE1YmViMjcxZDcyNjNkYzNhNTlhNmI5ZmM2YjVjMyIsInN1YiI6IjY1ZTAyYTUwMmQ1MzFhMDE4NWJmYTgzNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.BDBgXsXGlO1_otcV8mkbEENPDLYNBR6QRi_-npU6KOs';

  Future<List> getData(String url, {bool search = false}) async {
    Uri uri = Uri.parse(url + apikey);
    if (search) {
      uri = Uri.parse(url);
    }
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        log('successfully fetched the data');
        final json = jsonDecode(response.body);
        final results = json['results'] as List<dynamic>;
        return results;
      } else {
        print('status code: ${response.statusCode}');
      }
    } catch (e) {
      log('failed when trying to fetch data');
      print(e);
    }
    return [];
  }

  Future<List> search(
    String value,
  ) async {
    final searchsUrl =
        'https://api.themoviedb.org/3/search/movie?query=$value&include_adult=false&language=en-US&api_key=$apikey';
    log(searchsUrl);
    return getData(searchsUrl, search: true);
  }
}
