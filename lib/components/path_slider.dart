import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PathSlider extends StatelessWidget {
  const PathSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double position = 0.2;
    return SizedBox(
      width: 280,
      height: 29,
      child: ShaderMask(
        blendMode: BlendMode.srcATop,
        shaderCallback: (rect) => LinearGradient(
          stops: [position, position],
          colors: const [
            Color(0xFFF11775),
            Color(0xFF7B7B8B),
          ],
        ).createShader(rect),
        child: SvgPicture.asset(
          'assets/images/Path.svg',
          color: const Color(0xFF7B7B8B),
          //        color: const Color(0xFFF11775),
        ),
      ),
    );
  }
}
