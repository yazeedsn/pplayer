import 'package:flutter/material.dart';
import 'package:pplayer/screens/genera_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GeneraListTile extends StatelessWidget {
  const GeneraListTile({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GeneraScreen(title: title)));
      },
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF0B0B15),
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 13.sp),
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
    );
  }
}
