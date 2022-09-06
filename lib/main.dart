import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pplayer/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (contextBuild, child) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: const Color(0xFF181A26),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: const Color(0xFFFB6580),
              unselectedItemColor: const Color(0xFF5C5E6F),
              selectedLabelStyle: TextStyle(
                fontSize: 9.sp,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 9.sp,
              ),
              selectedIconTheme: IconThemeData(
                size: 20.r,
              ),
              unselectedIconTheme: IconThemeData(
                size: 20.r,
              )),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
