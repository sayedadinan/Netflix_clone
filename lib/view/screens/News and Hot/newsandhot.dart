import 'package:flutter/material.dart';
import 'package:netflix_/view/screens/News%20and%20Hot/widgets/poster_with_descrip.dart';
import 'package:netflix_/view/screens/News%20and%20Hot/widgets/selecting_buttons.dart';

class Newandhot extends StatefulWidget {
  const Newandhot({super.key});

  @override
  State<Newandhot> createState() => _NewandhotState();
}

class _NewandhotState extends State<Newandhot> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Selectingbutton(title: '🍿 Coming Soon'),
                Selectingbutton(title: "🔥 Everyone's Watching"),
                Selectingbutton(title: '🎮 Games'),
                Selectingbutton(title: '🔝 Top Tv Shows'),
                Selectingbutton(title: '🔝 Top Tv Movies'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Describtion(),
        ],
      ),
    );
  }
}
