import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/components/network_image_loader.dart';
import 'package:pplayer/components/path_slider.dart';
import 'package:pplayer/components/play_button.dart';
import 'package:pplayer/models/eposide.dart';
import 'package:pplayer/player_handler.dart';

class PlayScreen extends StatelessWidget {
  const PlayScreen({Key? key, required this.eposide}) : super(key: key);

  final Eposide eposide;

  @override
  Widget build(BuildContext context) {
    final player = PlayerHandler.instance;
    var podcastImage = NetworkImageLoader(eposide.image);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  foregroundDecoration: BoxDecoration(
                    gradient: RadialGradient(
                      tileMode: TileMode.decal,
                      radius: 1,
                      colors: [
                        Colors.transparent,
                        const Color(0xFF141535).withOpacity(0.49),
                        const Color(0xFF14121C),
                      ],
                    ),
                  ),
                  child: podcastImage,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      focalRadius: 200,
                      radius: 1,
                      tileMode: TileMode.decal,
                      colors: [
                        Color(0xFF2D2C3C),
                        Color(0xFF191925),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 44.h),
                child: const IconButton(
                  padding: EdgeInsets.zero,
                  visualDensity: VisualDensity.compact,
                  onPressed: null,
                  icon: Icon(
                    Icons.arrow_back,
                    color: Color(0xFFFB6580),
                  ),
                ),
              ),
              SizedBox(height: 106.h),
              SizedBox(
                height: 192.h,
                child: Container(
                  clipBehavior: Clip.none,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF262634).withOpacity(0.92),
                          blurRadius: 20,
                          spreadRadius: 12,
                          blurStyle: BlurStyle.normal)
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Expanded(child: SizedBox(width: 1)),
                      Container(
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0xFF191925),
                                offset: Offset(0, 4),
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: podcastImage),
                      const Expanded(child: SizedBox(width: 1)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        eposide.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        eposide.title,
                        style: TextStyle(
                          color: const Color(0xFF7B7B8B),
                          fontSize: 11.sp,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              '41.08',
                              style: TextStyle(
                                color: const Color(0xFF7B7B8B),
                                fontSize: 9.sp,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            const Expanded(
                              child: PathSlider(position: 0.2),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.favorite,
                                color: const Color(0xFF7B7B8B),
                                size: 18.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.skip_previous_outlined,
                              color: Colors.white,
                              size: 60.r,
                            ),
                          ),
                          SizedBox(width: 18.w),
                          PlayButton(
                              isPlaying: false,
                              onPressed: () {
                                (!player.isPlaying)
                                    ? player.play(eposide.enclosuerUrl)
                                    : player.pause();
                              }),
                          IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.skip_next_outlined,
                              color: Colors.white,
                              size: 60.r,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
