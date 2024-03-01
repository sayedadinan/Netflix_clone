import 'package:flutter/material.dart';
import 'package:netflix_/controller/get_tv_data.dart';
import 'package:netflix_/controller/movie_data_geting.dart';
import 'package:netflix_/view/screens/Home_screen/widgets/appbar_container.dart';
import 'package:netflix_/view/screens/Home_screen/widgets/mainpicarea.dart';
import 'package:netflix_/widgets/movie_moving.dart';
import 'package:netflix_/view/screens/Home_screen/widgets/popularmovies.dart';
import 'package:netflix_/widgets/color_size.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appBarContainers(context),
                sizedBoxHeight(14),
                const Padding(
                  padding: EdgeInsets.all(12),
                  child: Wallpaper(),
                ),
                MovieContents(
                  title: 'Trending Now',
                  movies: MovieData().getTrendingMovies(),
                ),
                sizedBoxHeight(14),
                MovieContents(
                  title: 'Top rated movies',
                  movies: MovieData().getratedmovies(),
                ),
                sizedBoxHeight(14),
                MovieContents(
                  title: 'Up coming movies',
                  movies: MovieData().getupcoming(),
                ),
                sizedBoxHeight(14),
                popularmovie(
                  title: 'top rated Tv shows',
                  movies: TvData().topRatedTvSeries(),
                ),
                sizedBoxHeight(14),
                MovieContents(
                  title: 'top rated trailers',
                  movies: MovieData().getTrendingMovies(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
