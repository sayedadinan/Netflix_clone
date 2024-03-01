import 'package:flutter/material.dart';
import 'package:netflix_/models/movies.dart';
import 'package:netflix_/view/screens/Movie%20details/widgets/buttons.dart';
import 'package:netflix_/widgets/color_size.dart';

class Moviedetail extends StatefulWidget {
  final Movie movie;
  Moviedetail({
    super.key,
    required this.movie,
  });

  @override
  State<Moviedetail> createState() => _MoviedetailsState();
}

class _MoviedetailsState extends State<Moviedetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: mediaqueryHeight(0.35, context),
            child: Image(image: NetworkImage(widget.movie.movieBackdrop)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [mytext(widget.movie.movieName, 20)],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Buttonscontainer(
              containercolor: Colors.grey,
              text: 'play',
              textcolor: Colors.white,
              icon: Icons.play_arrow,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Buttonscontainer(
              containercolor: Color.fromARGB(255, 160, 225, 120),
              text: 'Download',
              textcolor: Colors.white,
              icon: Icons.file_download_sharp,
            ),
          ),
          sizedBoxHeight(15),
          mytext(widget.movie.movieOverview, 13),
          sizedBoxHeight(15),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.add,
                    size: 24,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.thumb_up_sharp,
                    size: 22,
                    color: whitecolor,
                  ),
                  Icon(
                    Icons.share,
                    color: whitecolor,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  mytext("My List", 12, FontWeight.normal, greyColor),
                  mytext("Rate   ", 12, FontWeight.normal, greyColor),
                  mytext("Share", 12, FontWeight.normal, greyColor)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
