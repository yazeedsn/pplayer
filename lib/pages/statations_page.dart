import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/api_handler.dart';
import 'package:pplayer/components/podcast_list_tile_with_fav_button';
import 'package:pplayer/models/eposide.dart';

class StationsPage extends StatelessWidget {
  const StationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 44.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Generas',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'CircularStd',
                fontSize: 23.sp,
              ),
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: FutureBuilder<List<String>>(
                  future: ApiHandler().getCats(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
                    }

                    var cats = snapshot.data;

                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: (cats != null) ? cats.length : 0,
                      itemBuilder: (buildContext, index) => Container(
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0B0B15),
                          borderRadius: BorderRadius.all(Radius.circular(6.r)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              cats![index],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 13.sp),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: const BoxDecoration(
                                color: Color(0xFF2B2A39),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white,
                                size: 6,
                              ),
                            )
                          ],
                        ),
                      ),
                      separatorBuilder: (buildContext, index) =>
                          SizedBox(height: 9.h),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
