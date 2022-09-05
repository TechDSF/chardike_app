import 'package:chardike/screens/UserPage/model/order_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../CommonData/common_data.dart';
import '../../../../size_config.dart';

class StatusItem extends StatelessWidget {
  StatusItem({Key? key, required this.result}) : super(key: key);
  bool isTab = SizeConfig.screenWidth > 768;
  OrderStatusModel result;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: <Widget>[
        Container(
          height: getProportionateScreenHeight(10),
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
        ),
        ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
          title: Text("Order ${result.id} >"),
          subtitle: Text(
              "Placed on ${result.orderedDate.day}/${result.orderedDate.month}/${result.orderedDate.year}"),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: result.items.length,
              itemBuilder: (context, ind) {
                var items = result.items[ind];
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: SizeConfig.screenHeight * 0.01),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: SizeConfig.screenWidth * 0.2,
                        width: SizeConfig.screenWidth * 0.2,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.2)),
                            image: DecorationImage(
                                image: NetworkImage(items.item.featureImage))),
                      ),
                      SizedBox(
                        width: SizeConfig.screenWidth * 0.02,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items.item.productName,
                            maxLines: 2,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: isTab
                                    ? SizeConfig.screenWidth * 0.02
                                    : SizeConfig.screenWidth * 0.035),
                          ),
                          Text(
                            CommonData.takaSign + " ${items.amountItem}",
                            style: TextStyle(
                                fontSize: isTab
                                    ? SizeConfig.screenWidth * 0.02
                                    : SizeConfig.screenWidth * 0.03,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "x" + " ${items.quantity}",
                            style: TextStyle(
                                fontSize: isTab
                                    ? SizeConfig.screenWidth * 0.02
                                    : SizeConfig.screenWidth * 0.025,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ))
                    ],
                  ),
                );
              }),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: SizeConfig.screenWidth * 0.02),
              child: Text(
                "${result.items.length} item, Total ${CommonData.takaSign} ${result.total}",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: isTab
                        ? SizeConfig.screenWidth * 0.02
                        : SizeConfig.screenWidth * 0.035),
              ),
            )),
        SizedBox(
          height: SizeConfig.screenHeight * 0.01,
        )
      ]),
    );
  }
}
