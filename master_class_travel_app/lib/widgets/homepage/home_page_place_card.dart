import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/colors/colors.dart';
import 'package:master_class_travel_app/cubit/app_cubit.dart';
import 'package:master_class_travel_app/model/data_model.dart';

class HomePagePlaceCard extends StatelessWidget {
  int index;
  HomePagePlaceCard({required this.index});

  @override
  Widget build(BuildContext context) {
    List<DataModel> places = context.read<AppCubit>().places;
    return GestureDetector(
      onTap: () {
        context.read<AppCubit>().getSingleDataDetailPage(places[index]);
      },
      child: Container(
        width: 200,
        height: 300,
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage(
                "http://mark.bslmeiyu.com/uploads/${places[index].img}"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.only(bottom: 15, left: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [Colors.transparent, AppColors.mainColor],
              begin: AlignmentDirectional.topEnd,
              end: Alignment(0.9, 1),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${places[index].name}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.pin_drop_rounded,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Text(
                      "${places[index].location}",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
