import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/models/podcast.dart';

class PodcastListTile extends StatelessWidget {
  const PodcastListTile({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  final Podcast podcast;

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
            child: Image.network(podcast.image ?? ''),
          ),
          SizedBox(width: 12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                podcast.title ?? '',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                podcast.author ?? '',
                style: TextStyle(
                    color: const Color(0xFF5C5E6F),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
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
