import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:master_class_travel_app/cubit/app_cubit.dart';
import 'package:master_class_travel_app/cubit/app_cubit_logics.dart';
import 'package:master_class_travel_app/pages/detail_pages/cubit/store_page_info_cubit.dart';
import 'package:master_class_travel_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Travel App Master Class",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.white),
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
            create: (context) => AppCubit(
              data: DataServices(),
            ),
          ),
          BlocProvider<StorePageInfoCubits>(
            create: (context) => StorePageInfoCubits(),
          )
        ],
        child: AppCubitLogics(),
      ),
    );
  }
}
