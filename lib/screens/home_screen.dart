import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _index = 0;
var _pages = <Widget>[
  const HomePage(),
  Container(),
  Container(),
  Container(),
  Container(),
];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF13131A),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (index) {
          setState(() => _index = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.radio),
            label: 'Radio Stations',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.podcasts),
            label: 'Podcasts',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.event),
            label: 'Events',
          ),
          BottomNavigationBarItem(
            icon: BottomBarIcon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: _pages[_index],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 340.h,
              child: Image.asset(
                'assets/images/slider.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 105.h),
                  Text(
                    'Tabitha Nauser',
                    style: TextStyle(
                        color: const Color(0xFF7B7B8B), fontSize: 11.sp),
                  ),
                  Text(
                    'Bulletproof',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 31.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 90.h),
              Text(
                'Popular Broadcast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                height: 160.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  itemCount: 4,
                  itemBuilder: (buildContext, index) => const PodcastCard(),
                  separatorBuilder: (buildContext, index) =>
                      SizedBox(width: 15.w),
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                'Similar Broadcast',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.h),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (buildContext, index) => const PodcastListTile(),
                  separatorBuilder: (buildContext, index) =>
                      SizedBox(height: 9.h),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

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
