import 'package:chardike/screens/UserPage/components/MyPurchases/status_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../CommonData/all_colors.dart';
import '../../../../../size_config.dart';
import '../../../controller/purchase_controller.dart';

class Shipped extends StatelessWidget {
  Shipped({Key? key}) : super(key: key);
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _purchaseController.getMyOrders,
      color: AllColors.mainColor,
      child: Scaffold(
          backgroundColor: Colors.grey.withOpacity(0.1),
          body: Obx(() {
            if (_purchaseController.isOrderStausLoading.value) {
              return Center(
                child: CircularProgressIndicator(
                  color: AllColors.mainColor,
                ),
              );
            } else {
              if (_purchaseController.statusShippedList.isEmpty) {
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
                    itemCount: _purchaseController.statusShippedList.length,
                    itemBuilder: (context, index) {
                      var result = _purchaseController.statusShippedList[index];
                      return StatusItem(result: result);
                    });
              }
            }
          })),
    );
  }
}
