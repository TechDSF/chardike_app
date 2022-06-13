import 'package:flutter/material.dart';

class FreeGifts extends StatelessWidget {
  const FreeGifts({Key? key}) : super(key: key);
  static const String routeName = "/free_gifts";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Gifts"),
      ),
    );
  }
}
