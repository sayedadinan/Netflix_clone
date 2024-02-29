import 'package:flutter/material.dart';
import 'package:netflix_/widgets/color_size.dart';

AppBar homePageAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: blackColor,
    leading: Transform.scale(
      scale: 0.5,
      child: Image.asset("lib/assets/netflix_logo0.png"),
    ),
    actions: [
      Icon(
        Icons.cast,
        size: 20,
        color: whitecolor,
      ),
      SizedBox(
        width: mediaqueryHeight(0.02, context),
      ),
      IconButton(
          onPressed: () async {
            // await apiservices.loadtrendingmovies();
          },
          icon: Icon(
            Icons.search,
            color: Colors.white,
          )),
      // Icon(Icons.search, color: whitecolor),
      SizedBox(
        width: mediaqueryHeight(0.02, context),
      ),
    ],
  );
}
