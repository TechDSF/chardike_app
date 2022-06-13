import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/to_pay.dart';
import 'package:chardike/screens/UserPage/controller/purchase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../CommonData/common_data.dart';
import '../../../../size_config.dart';
import '../../../CartPage/screen/cart_screen.dart';

class MyPurchases extends StatelessWidget {
  MyPurchases({Key? key}) : super(key: key);
  bool isTab = SizeConfig.screenWidth > 768;
  static const String routeName = "/my_purchases";
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>DefaultTabController(
      initialIndex: _purchaseController.tabIndex.value,
      length: 6,
      child: Scaffold(
          appBar: AppBar(
            title: Text("My Purchases"),
            actions: <Widget>[
              InkWell(onTap: (){
                Navigator.pushNamed(context, CartScreen.routeName);
              },child: CommonData.icon(icon: "asset/icons/messenger.png", color: AllColors.mainColor , isTab: isTab)),
              SizedBox(width: getProportionateScreenWidth(10),)
            ],
          ),
          body: Column(
            children: <Widget>[
              TabBar(
                  unselectedLabelColor: Colors.black,
                  isScrollable: true,
                  labelColor: AllColors.mainColor,
                  indicatorColor: AllColors.mainColor,
                  tabs: [
                    Tab(
                      text: "To Pay",
                    ),
                    Tab(
                      text: "To Ship",
                    ),
                    Tab(
                      text: "To Recive",
                    ),
                    Tab(
                      text: "Complete",
                    ),
                    Tab(
                      text: "Cancelled",
                    ),
                    Tab(
                      text: "Return Refund",
                    ),
                  ]),
              Expanded(
                child: TabBarView(children: [
                  ToPay(),
                  ToPay(),
                  ToPay(),
                  ToPay(),
                  ToPay(),
                  ToPay(),
                ]),
              )
            ],
          )
      ),
    ));
  }
}
