import 'package:flutter/material.dart';

import 'package:pplayer/pages/home_page.dart';
import 'package:pplayer/pages/profile_page.dart';
import 'package:pplayer/pages/genera_page.dart';

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
  @override
  void initState() {
    super.initState();
  }

  var pages = <Widget>[
    HomePage(),
    const GeneraPage(),
    Container(),
    Container(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131A),
      body: widget.body,
    );
  }
}
