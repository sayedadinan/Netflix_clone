import 'package:flutter/material.dart';
import 'package:netflix_/view/screens/Home_screen/home_screen.dart';
import 'package:netflix_/view/screens/News%20and%20Hot/newsandhot.dart';
import 'package:netflix_/view/screens/profile%20page/profile_details.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentIndex = 0;
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          // ScreenSearch(),
          Newandhot(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.search, color: Colors.white),
          //   label: 'Search',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.rss_feed, color: Colors.white),
            label: 'News & Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.downloading_rounded, color: Colors.white),
            label: 'Downloads',
          ),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.6),
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor:
            Colors.black, // Change this to your desired background color
        selectedFontSize: 14.0,
        unselectedFontSize: 12.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }
}
