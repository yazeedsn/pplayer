import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/components/podcast_card.dart';
import 'package:pplayer/components/podcast_list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 340.h,
              child: Image.asset(
                'assets/images/slider.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 105.h),
                  Text(
                    'Tabitha Nauser',
                    style: TextStyle(
                        color: const Color(0xFF7B7B8B), fontSize: 11.sp),
                  ),
                  Text(
                    'Bulletproof',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90.h),
              Text(
                'Popular Broadcast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 4,
                  itemBuilder: (buildContext, index) => const PodcastCard(),
                  separatorBuilder: (buildContext, index) =>
                      SizedBox(width: 15.w),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Similar Broadcast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (buildContext, index) => const PodcastListTile(),
                  separatorBuilder: (buildContext, index) =>
                      SizedBox(height: 9.h),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
