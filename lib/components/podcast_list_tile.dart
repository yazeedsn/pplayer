import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastListTile extends StatelessWidget {
  const PodcastListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0B15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Image.asset('assets/images/pd2.png'),
          ),
          SizedBox(width: 12.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Expeditiously with tip "T.I." Harris',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                'Greenwood Online Banking For Us By Us',
                style: TextStyle(
                    color: const Color(0xFF5C5E6F),
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const Expanded(child: SizedBox(width: 1)),
          const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          SizedBox(width: 16.w),
        ],
      ),
    );
  }
}
