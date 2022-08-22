import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    Key? key,
    required this.isPlaying,
    this.size,
    this.onPressed,
  }) : super(key: key);

  final bool isPlaying;
  final double? size;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          iconSize: 74.r,
          padding: EdgeInsets.only(top: 12.h),
          onPressed: onPressed,
          icon: Container(
            width: size ?? 72.w,
            height: size ?? 72.h,
            decoration: const BoxDecoration(
              color: Color(0xFF191925),
              shape: BoxShape.circle,
            ),
            child: Icon(
              (isPlaying) ? Icons.stop_rounded : Icons.play_arrow_rounded,
              size: 60.r,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
