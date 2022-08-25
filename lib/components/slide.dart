import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Slide extends StatelessWidget {
  const Slide({
    Key? key,
    required this.title,
    required this.author,
    this.imageUrl,
  }) : super(key: key);

  final String title;
  final String author;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 375.h,
        width: 375.w,
        child: (imageUrl != null)
            ? Image.network(
                imageUrl ?? '',
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              )
            : Image.asset(
                'assets/images/slider.png',
                fit: BoxFit.cover,
              ),
      ),
      Column(
        children: [
          SizedBox(height: 105.h),
          Container(
            padding: const EdgeInsets.all(6),
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author,
                  style: TextStyle(
                    color: Colors.white,
                    //color: const Color(0xFF7B7B8B),
                    fontSize: 11.sp,
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28.sp,
                    fontFamily: 'CircularStd',
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]);
  }
}
