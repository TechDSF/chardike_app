import 'package:flutter/material.dart';

class FreeVouchers extends StatelessWidget {
  const FreeVouchers({Key? key}) : super(key: key);
  static const String routeName = "/free_vouchers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Vouchers"),
      ),
    );
  }
}
