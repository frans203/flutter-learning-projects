import "package:flutter/material.dart";

class OtherPage extends StatelessWidget {
  const OtherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("other"),
      ),
      body: Center(
        child: Text(
          "Other",
          style: TextStyle(fontSize: 52.0),
        ),
      ),
    );
  }
}
