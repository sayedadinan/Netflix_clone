import 'package:flutter/material.dart';
import 'package:netflix_/controller/get_search_data.dart';
import 'package:netflix_/controller/movie_data_geting.dart';
import 'package:netflix_/models/movies.dart';
import 'package:netflix_/view/screens/Search%20screen/widget/search_result.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchContent = '';
  Future<List<Movie>>? searchResults;
  TextEditingController searchval = TextEditingController();
  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      super.initState();
      searchResults = MovieData().getTrendingMovies();
    }

    @override
    void dispose() {
      super.dispose();
      searchval.text = '';
    }

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_sharp),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.cast),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            color: const Color.fromARGB(255, 46, 46, 46),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: searchval,
                    onChanged: (value) {
                      setState(() {
                        searchMovies(value);
                      });
                    },
                    autofocus: true,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      hintText: 'Search games, shows, movies...',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 20, left: 10),
                  child: Icon(
                    Icons.mic_none_outlined,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
          FutureBuilder(
            future: searchResults,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else if (!snapshot.hasData || (snapshot.data as List).isEmpty) {
                return const Center(
                  child: Text('No search results'),
                );
              } else {
                List<Movie> searchResults = snapshot.data as List<Movie>;
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SearchResultsTile(
                        movie: searchResults[index],
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5,
                    ),
                    itemCount: searchResults.length,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  void searchMovies(String value) async {
    try {
      List<Movie> results = await SearchingData().getSearchingMovies(value);
      setState(() {
        print('function started.....');
        searchResults = Future.value(results);
      });
    } catch (e) {
      print('Error searching movies: $e');
    }
  }
}
