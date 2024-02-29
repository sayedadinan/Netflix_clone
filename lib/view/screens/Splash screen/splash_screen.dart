import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netflix_/view/screens/Home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false,
      );
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Image.asset(
        'lib/assets/netflix_logo 1.jpg',
      )),
    );
  }
}
