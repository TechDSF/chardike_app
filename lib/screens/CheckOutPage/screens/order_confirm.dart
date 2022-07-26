import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../MainScreen/main_screen.dart';

class OrderConfirm extends StatelessWidget {
  const OrderConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: Text("Order Confirmed"),
      ),
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight * 0.5,
          width: SizeConfig.screenWidth * 0.8,
          padding: EdgeInsets.all(SizeConfig.screenHeight * 0.03),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(15))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "Your Order is Complete",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenWidth * 0.05),
              ),
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: SizeConfig.screenWidth * 0.3,
              ),
              Text(
                "Thank you for your purchase",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Text(
                "You will recive an order confirmation email or phone with details of your order",
                textAlign: TextAlign.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => MainScreen()),
                        (route) => false);
                  },
                  child: Text("Continue Shopping"))
            ],
          ),
        ),
      ),
    );
  }
}
