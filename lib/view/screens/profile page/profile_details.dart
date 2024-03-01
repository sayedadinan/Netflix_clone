import 'package:flutter/material.dart';
import 'package:netflix_/controller/movie_data_geting.dart';
import 'package:netflix_/view/screens/profile%20page/widgets/list_tile.dart';
import 'package:netflix_/view/screens/profile%20page/widgets/personal_data.dart';
import 'package:netflix_/widgets/color_size.dart';
import 'package:netflix_/widgets/movie_backdrop.dart';
import 'package:netflix_/widgets/movie_moving.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBoxHeight(25),
            const ProfileImage(),
            Listtile(
              title: 'Notifications',
              color: Colors.red,
              icon: Icons.notifications,
            ),
            sizedBoxHeight(12),
            Listtile(
              title: 'Downloads',
              color: const Color.fromARGB(255, 33, 65, 243),
              icon: Icons.download,
            ),
            sizedBoxHeight(13),
            MovieContents(
              title: " TV Shows & Movies You've Liked",
              movies: MovieData().getNowPlayingMovies(),
            ),
            sizedBoxHeight(13),
            MovieContentsBackDrop(
                movies: MovieData().getTrendingMovies(),
                title: 'Trailers Your watched'),
            sizedBoxHeight(13),
            MovieContents(
              title: " TV Shows & Movies You've Like",
              movies: MovieData().getratedmovies(),
            ),
          ],
        ),
      ),
    );
  }
}
