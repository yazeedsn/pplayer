import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StationsPage extends StatelessWidget {
  const StationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Text(
            'Radio Stations',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'CircularStd',
              fontSize: 23.sp,
            ),
          )
        ],
      ),
    );
  }
}
