import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/components/scaffold_with_bottom_bar.dart';
import 'package:pplayer/models/podcast.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    Key? key,
    required this.podcast,
  }) : super(key: key);

  final Podcast podcast;
  final waitingImageUrl =
      'https://t3.ftcdn.net/jpg/02/46/67/70/360_F_246677065_FY7a89FprqE1iKgPpEVSKDVOWMBTS2MX.jpg';
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
              // TO Do: Replace with the podcast image and handle any occuring errors
              child: CachedNetworkImage(imageUrl: podcast.image ?? ''),
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

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({Key? key, required this.podcast}) : super(key: key);

  final Podcast podcast;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      selected: 0,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 124.w,
                    height: 124.h,
                    color: Colors.white,
                    foregroundDecoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(podcast.image ?? ''))),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        podcast.title ?? 'I Survived',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 178.w,
                        height: 124.h - 28.h,
                        child: SingleChildScrollView(
                          child: Text(
                            podcast.description ??
                                'What is it like to face death and make it out alive? Based on the groundbreaking A&E television series, I Survived documents harrowing stories of human endurance. In their own words, survivors recall how they overcame unbelievable circumstances that changed their lives forever.',
                            overflow: TextOverflow.fade,
                            maxLines: 20,
                            style: const TextStyle(
                              color: Color(0xFF5C5E6F),
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
