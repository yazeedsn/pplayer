import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/api_handler.dart';
import 'package:pplayer/components/genera_list_tile.dart';

class GeneraPage extends StatelessWidget {
  const GeneraPage({Key? key}) : super(key: key);

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
                  future: ApiHandler.instance.getCats(),
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
                      itemBuilder: (buildContext, index) =>
                          GeneraListTile(title: cats![index]),
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
