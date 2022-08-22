import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon(
    this.icon, {
    Key? key,
  }) : super(key: key);

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Icon(icon),
        SizedBox(height: 8.h),
      ],
    );
  }
}
