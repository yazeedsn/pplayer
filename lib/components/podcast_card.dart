import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/models/podcast.dart';
import 'package:pplayer/screens/podcast_screen.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PodcastScreen(podcast: podcast))),
      child: SizedBox(
        width: 124,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 124.w,
              height: 124.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF191925),
                      blurRadius: 20.r,
                      offset: Offset(0.w, 4.h),
                    )
                  ]),
              child: Image(
                image: CachedNetworkImageProvider(podcast.image ??
                    'https://www.svgrepo.com/show/52131/loading.svg'),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    podcast.title ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    podcast.author ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: const Color(0xFF5C5E6F),
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
