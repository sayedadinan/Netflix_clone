import 'package:flutter/material.dart';
import 'package:netflix_/widgets/color_size.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.white,
          width: mediaqueryWidth(0.28, context),
          height: mediaqueryHeight(0.14, context),
          child: Image.asset(
            "lib/assets/jaseemka.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
