import 'package:flutter/material.dart';

class TipsTricksScreen extends StatelessWidget {
  const TipsTricksScreen({Key? key}) : super(key: key);
  static const String routeName = "tips_tricks_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tips and Tricks"),
      ),
    );
  }
}
