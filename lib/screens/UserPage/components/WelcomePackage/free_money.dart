import 'package:flutter/material.dart';

class FreeMoney extends StatelessWidget {
  const FreeMoney({Key? key}) : super(key: key);
  static const String routeName = "/free_money";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Money"),
      ),
    );
  }
}
