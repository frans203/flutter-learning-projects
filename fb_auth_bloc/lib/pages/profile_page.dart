import 'package:fb_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:fb_auth_bloc/blocs/profile/profile_cubit.dart';
import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/error_dialog.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "/profile";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    _getProfile();
  }

  _getProfile() {
    final String uid = context.read<AuthBloc>().state.user!.uid;
    print("uid: $uid");
    context.read<ProfileCubit>().getProfile(uid: uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.profileStatus == ProfileStatus.error) {
            errorDialog(context, state.customError);
          }
        },
        builder: (context, state) {
          if (state.profileStatus == ProfileStatus.initial) {
            return Container();
          } else if (state.profileStatus == ProfileStatus.loading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.profileStatus == ProfileStatus.error) {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/error.png",
                      width: 75, height: 7, fit: BoxFit.cover),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Ooops\nTry Again!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.redAccent),
                  )
                ],
              ),
            );
          } else {
            return Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage.assetNetwork(
                      placeholder: "assets/images/loading.gif",
                      image: state.user.profileImage,
                      width: double.infinity,
                      fit: BoxFit.cover),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "-id: ${state.user.id}",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "-name: ${state.user.name}",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "-email: ${state.user.email}",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "-point: ${state.user.point}",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "-rank: ${state.user.rank}",
                          style: TextStyle(fontSize: 10.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
