import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/components/network_image_loader.dart';

class Slide extends StatelessWidget {
  const Slide({
    Key? key,
    required this.title,
    required this.author,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String author;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 375.h,
        width: 375.w,
        child: NetworkImageLoader(imageUrl),
      ),
    ]);
  }
}
