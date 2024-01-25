import "package:fb_auth_bloc/blocs/auth/auth_bloc.dart";
import "package:fb_auth_bloc/pages/profile_page.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class HomePage extends StatefulWidget {
  static const String routeName = "/home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, ProfilePage.routeName);
              },
              icon: Icon(Icons.account_box),
            ),
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignoutRequestedEvent());
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/bloc_logo_full.png",
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(height: 20.0),
              Text(
                "Bloc State Management Library for Flutter",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
