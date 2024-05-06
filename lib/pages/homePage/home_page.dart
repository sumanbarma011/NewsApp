import 'package:flutter/material.dart';
import 'package:newsapp/core/app_logo.dart';
import 'package:newsapp/pages/discover/discover_page.dart';
import 'package:newsapp/pages/discover/profile.dart';
import 'package:newsapp/pages/discover/saved.dart';
import 'package:newsapp/pages/homePage/widget/home_main_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> page = const [
    HomeMainWidget(),
    DiscoverPage(),
    SavedPage(),
    ProfilePage()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Container(
          margin: const EdgeInsets.only(right: 2, left: 13),
          child: Row(
            children: const [
              AppLogo(logoFontSize: 28),
              Spacer(),
              CircleAvatar(
                backgroundColor: Color.fromARGB(71, 216, 211, 211),
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                backgroundColor: Color.fromARGB(71, 216, 211, 211),
                child: Icon(
                  Icons.search_outlined,
                  color: Color.fromARGB(255, 30, 27, 27),
                  // grade: -20,
                ),
              ),
            ],
          ),
        ),
      ),
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.green,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.control_point_rounded), label: 'Discover'),
          BottomNavigationBarItem(icon: Icon(Icons.save_as), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
