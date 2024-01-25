import 'dart:io';

import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void errorDialog(BuildContext context, CustomError error) {
  print(
      "Code: ${error.code}\nMessage: ${error.message}\nPlugin: ${error.plugin}");

  if (Platform.isIOS) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                child: Text("OK"),
                onPressed: () => Navigator.pop(context),
              )
            ],
            title: Text("${error.code}"),
            content: Text(error.plugin + "\n" + error.message),
          );
        });
  } else {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("${error.code}"),
            content: Text(error.plugin + "\n" + error.message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("OK"),
              ),
            ],
          );
        });
  }
}
