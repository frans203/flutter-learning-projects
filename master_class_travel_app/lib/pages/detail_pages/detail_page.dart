import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/colors/colors.dart';
import 'package:master_class_travel_app/cubit/app_cubit.dart';
import 'package:master_class_travel_app/cubit/app_state.dart';
import 'package:master_class_travel_app/pages/detail_pages/cubit/store_page_info_cubit.dart';
import 'package:master_class_travel_app/widgets/app_large_text.dart';
import 'package:master_class_travel_app/widgets/app_text.dart';
import 'package:master_class_travel_app/widgets/details/app_buttons.dart';
import 'package:master_class_travel_app/widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        DetailState detailState = state as DetailState;
        context
            .read<StorePageInfoCubits>()
            .addPageInfo(detailState.place.name, -1);
        StorePageInfoState currentPage = context
            .read<StorePageInfoCubits>()
            .getCurrentPageData(detailState.place.name);
        int gottenStars = detailState.place.stars;

        return Scaffold(
          body: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 400,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              "http://mark.bslmeiyu.com/uploads/${detailState.place.img}"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 40,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            context.read<AppCubit>().goHomePage();
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.more_vert,
                            color: Colors.white,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                Positioned(
                  top: 320,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 900,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppLargeText(
                                text: "${detailState.place.name}",
                                color: Colors.black54),
                            AppLargeText(
                                text: "\$ ${detailState.place.price}",
                                color: AppColors.mainColor),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: AppColors.mainColor),
                            SizedBox(
                              width: 5,
                            ),
                            AppText(text: "${detailState.place.location}"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: index >= gottenStars
                                        ? AppColors.textColor2
                                        : AppColors.starColor);
                              }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: "(${detailState.place.stars})",
                                color: AppColors.textColor2),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppLargeText(
                                text: "People",
                                color: Colors.black.withOpacity(0.8),
                                size: 20,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              AppText(
                                  text: "Number of people in your group",
                                  color: AppColors.mainTextColor),
                              SizedBox(
                                height: 10,
                              ),
                              Wrap(
                                children: List.generate(5, (index) {
                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        // selectedIndex = index;
                                      });

                                      context
                                          .read<StorePageInfoCubits>()
                                          .changeIndexStorePage(
                                              detailState.place.name, index);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(right: 10),
                                      child: AppButtons(
                                        text: (index + 1).toString(),
                                        size: 50,
                                        backgroundColor:
                                            currentPage.index == index
                                                ? Colors.black
                                                : AppColors.buttonBackground,
                                        color: currentPage.index == index
                                            ? Colors.white
                                            : Colors.black,
                                        borderColor: AppColors.buttonBackground,
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppLargeText(
                            text: "Description",
                            color: Colors.black.withOpacity(0.8),
                            size: 20),
                        SizedBox(height: 10),
                        AppText(
                            text: detailState.place.description,
                            color: AppColors.mainTextColor),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppButtons(
                            isIcon: true,
                            icon: Icons.favorite_border,
                            color: AppColors.textColor2,
                            size: 60,
                            backgroundColor: Colors.white,
                            borderColor: AppColors.textColor2),
                        SizedBox(
                          width: 20,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        )
                      ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
