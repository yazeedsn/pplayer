import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20.w, top: 44.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'CircularStd',
                fontSize: 23.sp,
              ),
            ),
            Center(
              child: Container(
                width: 118.w,
                height: 118.h,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.pink, width: 5),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF171725),
                        blurRadius: 6.r,
                        offset: Offset(0, 3.h),
                      ),
                    ]),
                child: Image.asset(
                  'assets/images/pd2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Gail Forcewind',
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'gailforcewind2009@email.com',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: const Color(0xFF5C5E6F),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            const Text(
              'Favourite Podcasts',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
            SizedBox(
              height: 130,
              width: double.maxFinite,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                clipBehavior: Clip.none,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const FavCard();
                },
                separatorBuilder: (context, index) => SizedBox(width: 15.w),
              ),
            ),
            SizedBox(height: 30.h),
            const Text(
              'Recent Listens',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}

class FavCard extends StatelessWidget {
  const FavCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 122.w,
      height: 123.h,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(3.r), boxShadow: [
        BoxShadow(
          color: const Color(0xFF171725),
          blurRadius: 24.r,
          offset: const Offset(0, 15),
        ),
      ]),
      child: Stack(
        children: [
          FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(
              'assets/images/pd2.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 18,
            top: 4,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 14.r,
              child: Icon(
                Icons.favorite,
                size: 14.r,
                color: Colors.pink,
              ),
            ),
          )
        ],
      ),
    );
  }
}
