import 'package:chardike/screens/CheckOutPage/screens/payment_page.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class PaymentFailed extends StatelessWidget {
  PaymentFailed({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.9),
      appBar: AppBar(
        leading: SizedBox(),
        backgroundColor: Colors.grey.withOpacity(0.9),
        title: Text("Payment Failed"),
      ),
      body: Center(
        child: Container(
          height: SizeConfig.screenHeight * 0.5,
          width: SizeConfig.screenWidth * 0.9,
          padding: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenWidth * 0.02)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.01),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.red.withOpacity(0.7))),
                        child: Icon(
                          Icons.clear_outlined,
                          size: SizeConfig.screenWidth * 0.09,
                          color: Colors.red,
                        )),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Payment Failed",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: SizeConfig.screenWidth * 0.05),
                      ),
                    ),
                  )
                ],
              ),
              Text(
                "For some reason, your payment is not complete.",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black45,
                    fontSize: SizeConfig.screenWidth * 0.04),
              ),
              // InkWell(
              //   onTap: () {
              //     Navigator.pushReplacement(context,
              //         MaterialPageRoute(builder: (_) => PaymentPage(url: url)));
              //   },
              //   child: Container(
              //     width: double.infinity,
              //     color: Colors.lightGreenAccent,
              //     padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
              //     child: Center(child: Text("Retry Payment")),
              //   ),
              // ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(SizeConfig.screenWidth * 0.04),
                  child: Center(
                      child: Text(
                    "Cancel",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
