import 'package:flutter/material.dart';
import 'package:netflix_/controller/movie_data_geting.dart';
import 'package:netflix_/view/screens/Home_screen/widgets/appbar_container.dart';
import 'package:netflix_/widgets/color_size.dart';

class Wallpaper extends StatelessWidget {
  const Wallpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: MovieData().gettrendingmoviewallpaper(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          return const Center(
            child: Text('No wallpaper available'),
          );
        } else {
          String wallpaperUrl = snapshot.data!;
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(wallpaperUrl),
              ),
              Positioned(
                bottom: mediaqueryHeight(0.08, context),
                left: mediaqueryWidth(0.09, context),
                child: stackContainer(
                  "▶ Play",
                  whitecolor,
                  blackColor,
                  context,
                ),
              ),
              Positioned(
                bottom: mediaqueryHeight(0.08, context),
                left: mediaqueryWidth(0.48, context),
                child: stackContainer(
                  "✓ My List",
                  greyColor.withOpacity(0.4),
                  whitecolor,
                  context,
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
