import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/components/slide.dart';
import 'package:pplayer/models/podcast.dart';

class SlideView extends StatelessWidget {
  const SlideView({
    Key? key,
    required this.podcasts,
    required this.slidesCount,
    required this.controller,
  }) : super(key: key);

  final PageController controller;
  final int slidesCount;
  final List<Podcast> podcasts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      width: 375.w,
      child: PageView.builder(
        controller: controller,
        scrollDirection: Axis.vertical,
        itemCount: slidesCount,
        itemBuilder: (context, index) => Slide(
          title: podcasts[index].title,
          author: podcasts[index].author,
          imageUrl: podcasts[index].image,
        ),
      ),
    );
  }
}
