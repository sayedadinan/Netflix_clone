import 'package:flutter/material.dart';
import 'package:netflix_/widgets/color_size.dart';

class Buttonscontainer extends StatelessWidget {
  final Color textcolor;
  final Color containercolor;
  final String text;
  final IconData icon;
  const Buttonscontainer(
      {super.key,
      required this.textcolor,
      required this.containercolor,
      required this.text,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaqueryHeight(0.07, context),
      decoration: BoxDecoration(
          color: containercolor, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: textcolor,
          ),
          sizedBoxWidth(10),
          mytext(text, 16, FontWeight.w600, textcolor),
        ],
      )),
    );
  }
}
