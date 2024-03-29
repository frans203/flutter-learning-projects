import 'package:bloc_generated_route/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ShowMeCounter extends StatelessWidget {
  const ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
          child: Text(
        '${BlocProvider.of<CounterCubit>(context).state.counter}',
        style: TextStyle(fontSize: 52.0),
      )),
    );
  }
}
