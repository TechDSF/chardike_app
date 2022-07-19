import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/purchase_controller.dart';

class Processing extends StatelessWidget {
  Processing({Key? key}) : super(key: key);
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.withOpacity(0.1),
        body: Obx(() {
          if (_purchaseController.statusProcessingList.isEmpty) {
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
                itemCount: _purchaseController.statusProcessingList.length,
                itemBuilder: (context, index) {
                  var result = _purchaseController.statusProcessingList[index];
                  return Container(
                    color: Colors.white,
                    child: Column(children: <Widget>[
                      Container(
                        height: getProportionateScreenHeight(10),
                        width: double.infinity,
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      ListTile(
                        title: Text("Order ${result.id} >"),
                        subtitle: Text(
                            "Placed on ${result.orderedDate.day}/${result.orderedDate.month}/${result.orderedDate.year}"),
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            height: SizeConfig.screenWidth * 0.1,
                            width: SizeConfig.screenWidth * 0.1,
                          ),
                        ],
                      )
                    ]),
                  );
               
                });
          }
        }));
  }
}
