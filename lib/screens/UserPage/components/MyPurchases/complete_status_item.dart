import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/UserPage/model/order_status_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../CommonData/common_data.dart';
import '../../../../size_config.dart';

class CompleteStatusItem extends StatelessWidget {
  CompleteStatusItem({Key? key, required this.result}) : super(key: key);
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
                          SizedBox(
                            height: SizeConfig.screenWidth * 0.02,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      CommonData.takaSign +
                                          " ${items.amountItem}",
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
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showReviewDialog(
                                      context: context,
                                      productId: items.item.id);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(
                                      SizeConfig.screenWidth * 0.02),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenWidth * 0.02)),
                                  child: Text("Set Review"),
                                ),
                              ),
                            ],
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
        ),
      ]),
    );
  }

  var ratingNumber = (0.0).obs;
  var reviewTextField = TextEditingController();
  void showReviewDialog(
      {required BuildContext context, required int productId}) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      pageBuilder: (_, __, ___) {
        return Center(
          child: Container(
            height: SizeConfig.screenHeight * 0.5,
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.05),
            child: LoaderOverlay(
              child: Scaffold(
                  body: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Set Review",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.02,
                          ),
                          Obx(() => RatingBar.builder(
                                initialRating: ratingNumber.value,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  ratingNumber.value = rating;
                                  print(ratingNumber.value);
                                },
                              )),
                          SizedBox(
                            height: SizeConfig.screenHeight * 0.01,
                          ),
                          Container(
                            height: SizeConfig.screenHeight * 0.27,
                            padding:
                                EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: TextField(
                              controller: reviewTextField,
                              maxLines: 5,
                              decoration: InputDecoration(
                                  hintText: "Your Review",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Cancel")),
                          TextButton(
                              onPressed: () {
                                if (reviewTextField.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg: "Please enter your message!");
                                } else if (ratingNumber.value == 0.0) {
                                  Fluttertoast.showToast(
                                      msg: "Please select your star!");
                                } else {
                                  int st = (ratingNumber.value).toInt();

                                  Fluttertoast.showToast(msg: "$st");
                                  setReview(
                                      context: context,
                                      productId: productId,
                                      reviewMessage: reviewTextField.text,
                                      star: st);
                                }
                              },
                              child: Text("Review"))
                        ],
                      )
                    ]),
              )),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth * 0.03)),
          ),
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: Offset(0, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: Offset(0, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  setReview(
      {required BuildContext context,
      required int productId,
      required String reviewMessage,
      required int star}) async {
    context.loaderOverlay.show();
    try {
      SharedPreferences sh = await SharedPreferences.getInstance();
      int id = int.parse(sh.getString(CommonData.userProfileId) ?? "0");
      print(star);
      var result = await ApiService.createReview(
          profileId: id,
          productId: productId,
          star: star,
          message: reviewMessage);
      if (result) {
        context.loaderOverlay.hide();
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Review is created!");
      } else {
        context.loaderOverlay.hide();
        Fluttertoast.showToast(msg: "Failed to create review!");
      }
    } on Exception catch (e) {
      print(e.toString());
      // TODO
    }
  }
}
