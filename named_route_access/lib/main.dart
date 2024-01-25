import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:named_route_access/counter/counter_cubit.dart";
import "package:named_route_access/show_me_counter.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple app",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: {
        "/": (context) => BlocProvider.value(
              value: _counterCubit,
              child: MyHomePage(),
            ),
        "/counter": (context) => BlocProvider.value(
              value: _counterCubit,
              child: ShowMeCounter(),
            ),
      },
    );
  }

  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/counter");
            },
            child: Text(
              "Show me counter",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<CounterCubit>(context).increment();
              // print(BlocProvider.of<CounterCubit>(context).state.counter);
            },
            child: Text(
              "Increment Counter",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    ));
  }
}
