import 'package:flutter/material.dart';

class ScaffoldWithBackground extends StatelessWidget {
  const ScaffoldWithBackground({Key? key, this.bottomNavigationBar, this.child})
      : super(key: key);

  final Widget? child;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: bottomNavigationBar,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFF2D2C3C),
                  Color(0xFF191925),
                ],
                radius: 0.85,
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          child!,
        ],
      ),
    );
  }
}
