import 'package:flutter/material.dart';
import 'package:pplayer/components/scaffold_with_background.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBackground(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
