import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastCard extends StatelessWidget {
  const PodcastCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Image.asset(
            'assets/images/pd2.png',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          'THE JORDAN HARBING..',
          style: TextStyle(
              color: Colors.white,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold),
        ),
        Text(
          'Celeste Headlee',
          style: TextStyle(
              color: const Color(0xFF5C5E6F),
              fontSize: 9.sp,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
