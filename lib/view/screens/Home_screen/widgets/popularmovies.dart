import 'package:flutter/material.dart';
import 'package:netflix_/models/tvshows.dart';
import 'package:netflix_/widgets/customizetitle.dart';

class popularmovie extends StatelessWidget {
  final String title;
  final Future<List<TvShow>> movies;
  const popularmovie({required this.movies, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Personalizedtitle(
          title: title,
        ),
        SizedBox(
          height: 270,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder<List<TvShow>>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No data available'));
              } else {
                List<TvShow> movie = snapshot.data!;
                return PageView.builder(
                  itemCount: movie.length,
                  padEnds: false,
                  controller: PageController(
                    viewportFraction: 0.3,
                    // initialPage: 1,
                  ),
                  itemBuilder: (context, index) {
                    TvShow movieDetails = movie[index];
                    return GestureDetector(
                      // onTap: () => IndividualContentScrnNavigation()
                      //     .navigateToIndividualContentScrn(
                      //         context, movieDetails),
                      child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(movieDetails.tvShowPoster,
                                fit: BoxFit.cover)),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
