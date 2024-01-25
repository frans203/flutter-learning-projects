import 'package:bloc_context/counter/counter_cubit.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";

class ShowMeCounter extends StatelessWidget {
  ShowMeCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
      ),
      body: BlocBuilder<CounterCubit, CounterState>(
        builder: (context, state) => Center(
          child: Text(
            "${state.counter}",
            style: TextStyle(fontSize: 52.0),
          ),
        ),
      ),
    );
  }
}
