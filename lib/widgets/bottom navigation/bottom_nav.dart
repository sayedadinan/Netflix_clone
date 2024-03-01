import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:netflix_/view/screens/Home_screen/home_screen.dart';
import 'package:netflix_/view/screens/News%20and%20Hot/newsandhot.dart';
import 'package:netflix_/view/screens/profile%20page/profile_details.dart';
import 'package:netflix_/widgets/bottom%20navigation/bottom_nav_fun.dart';
import 'package:netflix_/widgets/color_size.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int currentPage = 0;
  final List<Widget> _pages = [HomeScreen(), Newandhot(), Profile()];
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blackColor,
        leading: buildLeadingWidget(currentPage),
        actions: buildTrailingWidget(currentPage, context),
        title: buildTitleWidget(currentPage),
      ),
      body: PageView(
        controller: _pageController,
        children: _pages,
        onPageChanged: (value) {
          setState(() {
            currentPage = value;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 18,
        backgroundColor: blackColor,
        currentIndex: currentPage,
        onTap: (values) {
          setState(() {
            currentPage = values;
            _pageController.animateToPage(currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease);
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                color: Colors.white,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.newspaper,
                color: Colors.white,
              ),
              label: "News & Hot"),
          BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
              label: "My Netflix")
        ],
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          color: Colors.white,
        ),
        elevation: 8,
      ),
    );
  }
}
