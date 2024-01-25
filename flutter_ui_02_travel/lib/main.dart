import "package:flutter/material.dart";
import "package:flutter_ui_02_travel/widgets/make_page.dart";

void main() => runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: HomePage(),
          theme: ThemeData(fontFamily: "Nunito")),
    );

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  void _onScroll() {}
  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(_onScroll);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      controller: _pageController,
      children: [
        MakePage(
          assetImage: "one.jpg",
          title: "USA",
          page: 1,
          totalPages: 4,
        ),
        MakePage(
          assetImage: "two.jpg",
          title: "HAWAII",
          page: 2,
          totalPages: 4,
        ),
        MakePage(
          assetImage: "three.jpg",
          title: "CHINA",
          page: 3,
          totalPages: 4,
        ),
        MakePage(
          assetImage: "four.jpg",
          title: "BRAZIL",
          page: 4,
          totalPages: 4,
        ),
      ],
    ));
  }
}
