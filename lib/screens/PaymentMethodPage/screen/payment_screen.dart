import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CheckOutPage/controller/check_out_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({Key? key}) : super(key: key);
  static const String routeName = "/payment_screen";
  final CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        centerTitle: false,
        elevation: 0.5,
      ),
      bottomNavigationBar: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        height: getProportionateScreenWidth(80),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              blurRadius: 50,
              offset: Offset(5, -2))
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Subtotal",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(11)),
                ),
                Text(
                  CommonData.takaSign +
                      " " +
                      "${_checkOutController.totalAmount.value}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total Ammount",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(11)),
                ),
                Text(
                  CommonData.takaSign +
                      " " +
                      "${_checkOutController.totalAmount.value}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Row(
                children: <Widget>[
                  Image.asset("asset/icons/dbble.png",
                      height: getProportionateScreenWidth(30),
                      width: getProportionateScreenWidth(30)),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Expanded(
                      child: Text(
                    "SSL",
                    style: CommonData.customTextStyle(),
                  )),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              Divider(
                color: Colors.black.withOpacity(0.5),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Row(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.circleDollarToSlot),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Expanded(
                      child: Text(
                    "Cash On Delivery",
                    style: CommonData.customTextStyle(),
                  )),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
           
            ],
          ),
        ),
      ),
    );
  }
}
