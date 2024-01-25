import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/colors/colors.dart';
import 'package:master_class_travel_app/cubit/app_cubit.dart';
import 'package:master_class_travel_app/cubit/app_state.dart';
import 'package:master_class_travel_app/widgets/app_large_text.dart';
import 'package:master_class_travel_app/widgets/app_text.dart';
import 'package:master_class_travel_app/widgets/homepage/home_page_place_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var imagesExplore = {
    "balloning.png": "Balloning",
    "hiking.png": "Hiking",
    "kayaking.png": "Kayaking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(body: BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is LoadedState) {
          // print(state.places);
          return SingleChildScrollView(
            child: SafeArea(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          const EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.menu, size: 30, color: Colors.black54),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black54),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: AppLargeText(text: "Discover"),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TabBar(
                            labelPadding:
                                const EdgeInsets.only(right: 20, left: 20),
                            controller: _tabController,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            isScrollable: true,
                            indicatorSize: TabBarIndicatorSize.label,
                            indicator: CircleTabIndicator(
                                color: AppColors.mainColor, radius: 4),
                            tabs: [
                              Tab(text: "Places"),
                              Tab(text: "Inspiration"),
                              Tab(text: "Emotion")
                            ]),
                      ),
                    ),
                    Container(
                      height: 300,
                      margin: const EdgeInsets.only(top: 20),
                      padding: const EdgeInsets.only(left: 20),
                      width: double.maxFinite,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.places.length,
                              itemBuilder: (BuildContext context, int index) {
                                return HomePagePlaceCard(index: index);
                              }),
                          Text("there"),
                          Text("there"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: "Explore More",
                            size: 22,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: AppText(
                                  text: "See All",
                                  color: AppColors.textColor1)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 110,
                      width: double.maxFinite,
                      padding: const EdgeInsets.only(left: 20),
                      child: ListView.builder(
                          itemCount: 4,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 30),
                              child: Column(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white10,
                                        image: DecorationImage(
                                          image: AssetImage(
                                            'assets/images/${imagesExplore.keys.elementAt(index)}',
                                          ),
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Text(
                                      "${imagesExplore.values.elementAt(index)}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColors.textColor2,
                                          fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;
  _CirclePainter({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    //calculate the position for offset
    final Offset circleOffset = Offset(configuration.size!.width / 2 - radius,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
