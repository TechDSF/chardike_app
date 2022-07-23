import 'package:chardike/screens/UserPage/components/MyPurchases/status_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../size_config.dart';
import '../../controller/purchase_controller.dart';

class OnTheWay extends StatelessWidget {
  OnTheWay({Key? key}) : super(key: key);
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: Obx(() {
          if (_purchaseController.statusOnTheWayList.isEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: getProportionateScreenHeight(50),
                ),
                Image.asset(
                  "asset/images/empty_cart.png",
                  height: getProportionateScreenWidth(100),
                  width: getProportionateScreenWidth(100),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                  width: double.infinity,
                ),
                Text("No Orders Yet")
              ],
            );
          } else {
            return ListView.builder(
                itemCount: _purchaseController.statusOnTheWayList.length,
                itemBuilder: (context, index) {
                  var result = _purchaseController.statusOnTheWayList[index];
                  return StatusItem(result: result);
                });
          }
        }));
  }
}
