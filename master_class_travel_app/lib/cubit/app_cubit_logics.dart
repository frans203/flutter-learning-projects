import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/cubit/app_cubit.dart';
import 'package:master_class_travel_app/cubit/app_state.dart';
import 'package:master_class_travel_app/pages/detail_pages/detail_page.dart';
import 'package:master_class_travel_app/pages/navpages/main_page.dart';
import 'package:master_class_travel_app/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<AppCubit, AppState>(builder: (context, state) {
      if (state is WelcomeState) {
        return WelcomePage();
      } else if (state is LoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is LoadedState) {
        return MainPage();
      } else if (state is DetailState) {
        return DetailPage();
      } else {
        return Container();
      }
    }));
  }
}
