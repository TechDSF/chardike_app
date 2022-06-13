import 'package:flutter/material.dart';

import '../../../../size_config.dart';

class ToRecive extends StatelessWidget {
  const ToRecive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: getProportionateScreenHeight(50),),
          Image.asset("asset/images/empty_cart.png",height: getProportionateScreenWidth(100),width: getProportionateScreenWidth(100),),
          SizedBox(height: getProportionateScreenHeight(10),width: double.infinity,),
          Text("No Orders Yet to ")
        ],
      ),
    );
  }
}
