import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Slide extends StatelessWidget {
  const Slide({
    Key? key,
    required this.title,
    required this.author,
    this.imageUrl,
  }) : super(key: key);

  final String title;
  final String author;
  final String? imageUrl;

  final waitingImageUrl =
      'https://t3.ftcdn.net/jpg/02/46/67/70/360_F_246677065_FY7a89FprqE1iKgPpEVSKDVOWMBTS2MX.jpg';

  @override
  Widget build(BuildContext context) {
    final networkImage = Image.network(
      imageUrl ?? waitingImageUrl,
      fit: BoxFit.fitWidth,
      errorBuilder: (context, widget, event) => const Center(
          child: Text(
        'Could not load this image.',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28,
        ),
      )),
    );

    return Stack(children: [
      SizedBox(
        height: 375.h,
        width: 375.w,
        child: (networkImage),
      ),
    ]);
  }
}
