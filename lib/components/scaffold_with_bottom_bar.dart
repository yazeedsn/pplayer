import 'package:flutter/material.dart';

import 'package:pplayer/components/bottom_bar_icon.dart';

import 'package:pplayer/pages/home_page.dart';
import 'package:pplayer/pages/profile_page.dart';
import 'package:pplayer/pages/statations_page.dart';

class ScaffoldWithBottomBar extends StatefulWidget {
  const ScaffoldWithBottomBar(
      {Key? key, required this.selected, required this.body})
      : super(key: key);

  final int selected;
  final Widget body;

  @override
  State<ScaffoldWithBottomBar> createState() => _ScaffoldWithBottomBarState();
}

class _ScaffoldWithBottomBarState extends State<ScaffoldWithBottomBar> {
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  var pages = <Widget>[
    HomePage(),
    const StationsPage(),
    Container(),
    Container(),
    const ProfilePage(),
  ];

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
            icon: BottomBarIcon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: widget.body,
    );
  }
}
