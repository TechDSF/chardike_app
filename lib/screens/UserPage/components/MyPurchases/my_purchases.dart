import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/components/hold_status.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/components/shipped.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/components/to_recive.dart';
import 'package:chardike/screens/UserPage/controller/purchase_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../CommonData/common_data.dart';
import '../../../../size_config.dart';
import '../../../CartPage/screen/cart_screen.dart';
import 'components/cancel.dart';
import 'components/complete.dart';
import 'components/deleted_status.dart';
import 'components/failed_status.dart';
import 'components/pending.dart';
import 'components/refunded.dart';

class MyPurchases extends StatelessWidget {
  MyPurchases({Key? key}) : super(key: key);
  bool isTab = SizeConfig.screenWidth > 768;
  static const String routeName = "/my_purchases";
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  @override
  Widget build(BuildContext context) {
    _purchaseController.getMyOrders();
    return Obx(() => DefaultTabController(
          initialIndex: _purchaseController.tabIndex.value,
          length: 9,
          child: Scaffold(
              appBar: AppBar(
                title: Text("My Purchases"),
                actions: <Widget>[
                  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CartScreen.routeName);
                      },
                      child: CommonData.icon(
                          icon: "asset/icons/messenger.png",
                          color: AllColors.mainColor,
                          isTab: isTab)),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  )
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
                          text: "Pending",
                        ),
                        Tab(
                          text: "Received",
                        ),
                        Tab(
                          text: "Shipped",
                        ),
                        Tab(
                          text: "On Hold",
                        ),
                        Tab(
                          text: "Completed",
                        ),
                        Tab(
                          text: "Canceled",
                        ),
                        Tab(
                          text: "Refunded",
                        ),
                        Tab(
                          text: "Failed",
                        ),
                        Tab(
                          text: "Deleted",
                        ),
                      ]),
                  Expanded(
                    child: TabBarView(children: [
                      Pending(),
                      RecievedStatus(),
                      Shipped(),
                      HoldStatus(),
                      CompleteStatus(),
                      CancelStatus(),
                      RefundedStatus(),
                      FailedStatus(),
                      DeletedStatus()
                    ]),
                  )
                ],
              )),
        ));
  }
}
