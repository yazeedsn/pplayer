import 'package:flutter/material.dart';
import 'package:pplayer/components/bottom_bar_icon.dart';
import 'package:pplayer/pages/home_page.dart';
import 'package:pplayer/pages/genera_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _index = 0;
var _pages = <Widget>[
  HomePage(),
  const GeneraPage(),
  Container(),
  Container(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131A),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() => _index = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.radio),
            label: 'Radio Stations',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.podcasts),
            label: 'Podcasts',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_index],
    );
  }
}
