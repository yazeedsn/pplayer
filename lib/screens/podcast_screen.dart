import 'package:flutter/material.dart';
import 'package:pplayer/api_handler.dart';
import 'package:pplayer/components/podcast_list_tile.dart';
import 'package:pplayer/components/scaffold_with_bottom_bar.dart';
import 'package:pplayer/models/eposide.dart';
import 'package:pplayer/models/podcast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                            image: NetworkImage(podcast.image))),
                  ),
                  SizedBox(width: 12.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.h),
                      Text(
                        podcast.title,
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
                            podcast.description,
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
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 32.0.h, bottom: 8.h),
                  child: FutureBuilder<List<Eposide>>(
                      future: ApiHandler.instance.getEposides(podcast.id),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        }
                        var eposides = snapshot.data;
                        return ListView.separated(
                          shrinkWrap: true,
                          clipBehavior: Clip.none,
                          itemCount: (eposides != null) ? eposides.length : 0,
                          itemBuilder: (buildContext, index) =>
                              PodcastListTile.fromEposide(eposides![index]),
                          separatorBuilder: (buildContext, index) =>
                              SizedBox(height: 9.h),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
