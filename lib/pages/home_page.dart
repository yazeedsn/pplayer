import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/api_handler.dart';
import 'package:pplayer/models/podcast.dart';
import 'package:pplayer/components/podcast_card.dart';
import 'package:pplayer/components/podcast_list_tile.dart';
import 'package:pplayer/components/slide_view.dart';

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<Podcast>>(
            future: ApiHandler().getTrendingPodcasts(max: 4),
            builder: (context, snapshot) => SlideView(
                podcasts: snapshot.data ?? [],
                slidesCount:
                    (snapshot.data != null) ? snapshot.data!.length : 0,
                controller: _controller)),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 238.h),
              Container(
                padding:
                    const EdgeInsets.only(top: 2, bottom: 4, right: 8, left: 4),
                decoration: const BoxDecoration(
                  color: Color(0xFF13131A),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Text(
                  'Popular Broadcast',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              FutureBuilder<List<Podcast>>(
                  future: ApiHandler().getTrendingPodcasts(max: 10),
                  builder: (context, snapshot) {
                    var podcasts = snapshot.data ?? [];
                    var count = podcasts.length;
                    return SizedBox(
                      height: 160.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        clipBehavior: Clip.none,
                        itemCount: (count > 0) ? count - 4 : 0,
                        itemBuilder: (buildContext, index) =>
                            PodcastCard(podcast: podcasts[index + 4]),
                        separatorBuilder: (buildContext, index) =>
                            SizedBox(width: 15.w),
                      ),
                    );
                  }),
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
                  clipBehavior: Clip.antiAlias,
                  itemCount: 4,
                  itemBuilder: (buildContext, index) => const PodcastListTile(),
                  separatorBuilder: (buildContext, index) =>
                      SizedBox(height: 9.h),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
