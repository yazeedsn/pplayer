import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/api_handler.dart';
import 'package:pplayer/components/path_slider.dart';
import 'package:pplayer/components/play_button.dart';
import 'package:pplayer/models/player_model.dart';
import 'package:provider/provider.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  final url = 'https://samplelib.com/lib/preview/mp3/sample-9s.mp3';

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset(
                    'assets/images/podcast_bg.png',
                    fit: BoxFit.fitWidth,
                  ),
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
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF262634),
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
                        child: Image.asset('assets/images/pd2.png'),
                      ),
                      const Expanded(child: SizedBox(width: 1)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: ChangeNotifierProvider<PlayerModel>(
                  create: (context) => PlayerModel(url: url),
                  child: Column(
                    children: [
                      Text(
                        'The Jordan Harbinger show',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'Celeste Headlee',
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
                            Expanded(
                              child: Consumer<PlayerModel>(
                                  builder: (buildContext, model, child) {
                                return PathSlider(position: model.position);
                              }),
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
                          Consumer<PlayerModel>(
                            builder: (context, model, child) => PlayButton(
                              isPlaying: model.isPlaying,
                              onPressed: () => (model.isPlaying)
                                  ? model.pause()
                                  : model.play(),
                            ),
                          ),
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
