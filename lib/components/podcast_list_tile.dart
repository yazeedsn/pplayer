import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:pplayer/components/network_image_loader.dart';
import 'package:pplayer/models/eposide.dart';
import 'package:pplayer/models/podcast.dart';

class PodcastListTile extends StatelessWidget {
  const PodcastListTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.imageLink,
  }) : super(key: key);

  factory PodcastListTile.fromPodcast(Podcast podcast) {
    return PodcastListTile(
        title: podcast.title,
        subtitle: podcast.author,
        imageLink: podcast.image);
  }

  factory PodcastListTile.fromEposide(Eposide eposide) {
    return PodcastListTile(
        title: eposide.title,
        subtitle: eposide.title,
        imageLink: eposide.image);
  }

  final String title;
  final String subtitle;
  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: SizedBox(
                width: 50.w,
                height: 50.h,
                child: NetworkImageLoader(imageLink)),
          ),
          SizedBox(width: 12.w),
          SizedBox(
            width: 180.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  maxLines: 2,
                  style: TextStyle(
                      color: const Color(0xFF5C5E6F),
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const Expanded(child: SizedBox(width: 1)),
          const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
