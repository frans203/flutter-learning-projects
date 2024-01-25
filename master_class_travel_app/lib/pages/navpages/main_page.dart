import 'package:flutter/material.dart';
import 'package:master_class_travel_app/pages/navpages/bar_item_page.dart';
import 'package:master_class_travel_app/pages/navpages/home_page.dart';
import 'package:master_class_travel_app/pages/navpages/my_page.dart';
import 'package:master_class_travel_app/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Widget> pages = [
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPagePage(),
  ];
  int currentIndexPage = 0;
  void onTap(int index) {
    setState(() {
      currentIndexPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black54,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        backgroundColor: Colors.white,
        currentIndex: currentIndexPage,
        unselectedItemColor: Colors.black12,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            label: "Home",
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "BarChart",
            icon: const Icon(Icons.bar_chart_sharp),
          ),
          BottomNavigationBarItem(
            label: "Search",
            icon: const Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: pages[currentIndexPage],
    );
  }
}
