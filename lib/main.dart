import 'package:flutter/material.dart';
import 'package:newsapp/pages/authentication/authentication.dart';
import 'package:newsapp/pages/profilePage/profile.dart';
import 'package:newsapp/pages/homePage/home_page.dart';
import 'package:newsapp/pages/individualNewsFeed/individual_news_feed.dart';
import 'package:newsapp/pages/loginPage/login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/homePage',
        routes: {
          '/logIn': (context) => const LoginPage(),
          '/homePage': (context) => const HomePage(),
          '/individualNewsFeed': (context) => const IndividualNewsFeed(),
          '/authentication': (context) => const Authentication(),
          '/profilePage': (context) => const ProfilePage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, elevation: 0, titleSpacing: 2),
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
