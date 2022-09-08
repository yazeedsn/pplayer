import 'package:flutter/material.dart';
import 'package:pplayer/components/scaffold_with_bottom_bar.dart';
import 'package:pplayer/components/podcast_list_tile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/models/podcast.dart';
import 'package:pplayer/api_handler.dart';

class GeneraScreen extends StatelessWidget {
  const GeneraScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithBottomBar(
      selected: 0,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'CircularStd',
                  fontSize: 23.sp,
                ),
              ),
              SizedBox(height: 32.h),
              Expanded(
                child: FutureBuilder<List<Podcast>>(
                    future: ApiHandler.instance
                        .getTrendingPodcasts(max: 100, cat: title),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        );
                      }
                      var podcasts = snapshot.data;
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: (podcasts != null) ? podcasts.length : 0,
                        itemBuilder: (buildContext, index) =>
                            PodcastListTile.fromPodcast(podcasts![index]),
                        separatorBuilder: (buildContext, index) =>
                            SizedBox(height: 9.h),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
