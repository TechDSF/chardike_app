import 'package:flutter/material.dart';

class FreeDeals extends StatelessWidget {
  const FreeDeals({Key? key}) : super(key: key);
  static const String routeName = "/free_deals";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Deals"),
      ),
    );
  }
}
