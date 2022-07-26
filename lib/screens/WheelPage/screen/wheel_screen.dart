import 'dart:async';
import 'dart:math';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../HomePage/controller/home_controller.dart';
import '../../ProductDetails/product_details.dart';

class WheelScreen extends StatelessWidget {
  WheelScreen({Key? key}) : super(key: key);
  static const String routeName = "/wheel_screen";
  StreamController<int> controller = StreamController<int>();
  var ran = Random();
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;

    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Offer"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHeight / 3.4,
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              margin: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                  color: Color(0xFFB5F1EC),
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(10))),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: FortuneWheel(
                      selected: controller.stream,
                      indicators: [
                        FortuneIndicator(
                            alignment: Alignment.topCenter,
                            child: Container(
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "asset/icons/wheel_detect_icon.png"))),
                              height: getProportionateScreenHeight(15),
                              width: getProportionateScreenHeight(15),
                            )),
                        FortuneIndicator(
                            alignment: Alignment.center,
                            child: Container(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(3)),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [Colors.orange, Colors.yellow])),
                              height: getProportionateScreenHeight(40),
                              width: getProportionateScreenHeight(40),
                              child: Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(1)),
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.brown),
                                height: getProportionateScreenHeight(30),
                                width: getProportionateScreenHeight(30),
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(2)),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  height: getProportionateScreenHeight(30),
                                  width: getProportionateScreenHeight(30),
                                  child: Center(
                                      child: Text(
                                    "SPIN",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(7),
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            )),
                      ],
                      items: [
                        FortuneItem(
                            style: FortuneItemStyle(
                                color: AllColors.mainColor,
                                borderColor: AllColors.mainColor,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "70% ছাড়!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                        FortuneItem(
                            style: const FortuneItemStyle(
                                color: Colors.orange,
                                borderColor: Colors.orange,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "একটি কিনলে একটি ফ্রি",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(
                                color: AllColors.mainColor,
                                borderColor: AllColors.mainColor,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "60% ছাড়!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                        FortuneItem(
                            style: const FortuneItemStyle(
                                color: Colors.orange,
                                borderColor: Colors.orange,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "একটি কিনলে একটি ফ্রি",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                        FortuneItem(
                            style: FortuneItemStyle(
                                color: AllColors.mainColor,
                                borderColor: AllColors.mainColor,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "50% ছাড়!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                        FortuneItem(
                            style: const FortuneItemStyle(
                                color: Colors.orange,
                                borderColor: Colors.orange,
                                textAlign: TextAlign.center),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: getProportionateScreenWidth(10)),
                              child: Text(
                                "একটি কিনলে একটি ফ্রি",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Play",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(22)),
                      ),
                      Text(
                        "&",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(22)),
                      ),
                      Text(
                        "Win",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(22)),
                      )
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  "asset/icons/three_line_icon.png",
                  height: getProportionateScreenWidth(25),
                  width: getProportionateScreenWidth(25),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text("Just For You"),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Image.asset(
                  "asset/icons/three_line_icon.png",
                  height: getProportionateScreenWidth(25),
                  width: getProportionateScreenWidth(25),
                )
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: getProportionateScreenWidth(5),
                  mainAxisSpacing: getProportionateScreenWidth(5),
                  childAspectRatio: aspt(300),
                ),
                itemCount: _homeController.popularProductList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var result = _homeController.popularProductList[
                      (_homeController.popularProductList.length - 1) - index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetails.routeName,
                          arguments: _homeController.popularProductList[index]);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.05)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.3))),
                              child: Stack(
                                children: <Widget>[
                                  Image.network(
                                    result.featureImage,
                                    fit: BoxFit.fill,
                                  ),
                                  Positioned(
                                      right: 0,
                                      child: Container(
                                        height: getProportionateScreenWidth(20),
                                        width: getProportionateScreenWidth(45),
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(
                                                    getProportionateScreenWidth(
                                                        10)),
                                                bottomLeft: Radius.circular(
                                                    getProportionateScreenWidth(
                                                        10)))),
                                        child: Center(
                                            child: Text(
                                          "-10%",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10),
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ))
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            result.productName.toString(),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            "₺ " + result.sellingPrice.toString() + " ",
                            style: TextStyle(
                                color: AllColors.mainColor,
                                fontSize: getProportionateScreenWidth(13)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: 4.4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: getProportionateScreenWidth(10),
                                direction: Axis.horizontal,
                              ),
                              Text(
                                "(34)",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
