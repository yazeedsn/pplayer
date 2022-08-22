import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PodcastListTile extends StatelessWidget {
  const PodcastListTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      visualDensity: VisualDensity.comfortable,
      tileColor: const Color(0xFF0B0B15),
      leading: Image.asset('assets/images/pd2.png'),
      title: Text(
        'Expeditiously with tip "T.I." Harris',
        style: TextStyle(
            color: Colors.white, fontSize: 10.sp, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Greenwood Online Banking For Us By Us',
        style: TextStyle(
            color: const Color(0xFF5C5E6F),
            fontSize: 10.sp,
            fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(
        Icons.more_horiz,
        color: Colors.white,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    );
  }
}
