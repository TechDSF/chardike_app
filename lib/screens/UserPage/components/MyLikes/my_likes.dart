import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/UserPage/controller/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../CommonData/common_data.dart';
import '../../../../size_config.dart';
import '../../../CartPage/screen/cart_screen.dart';
import '../../../ProductDetails/product_details.dart';

class MyLikes extends StatelessWidget {
  MyLikes({Key? key}) : super(key: key);
  static const String routeName = "/favourite_product";
  bool isTab = SizeConfig.screenWidth > 768;
  final HomeController _homeController = Get.put(HomeController());
  final FavouriteController _favouriteController =
      Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    _favouriteController.getFavouriteProduct();
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
        iconTheme: IconThemeData(color: AllColors.mainColor),
        title: Text("My Likes"),
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Obx(() {
              if (_favouriteController.favouriteList.value.isEmpty) {
                return Container(
                  height: SizeConfig.screenHeight * 0.3,
                  color: Colors.grey.withOpacity(0.07),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      SizedBox(),
                      Image.asset(
                        "asset/icons/search_document.png",
                        color: Colors.grey,
                        height: SizeConfig.screenHeight * 0.1,
                        width: double.infinity,
                      ),
                      Text(
                        "You haven't liked any product yet",
                        style: TextStyle(color: Colors.black),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Go Shopping Now"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              AllColors.mainColor),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _favouriteController.favouriteList.value.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTab ? 3 : 2,
                        childAspectRatio:
                            aspt(getProportionateScreenHeight(250)),
                        crossAxisSpacing: getProportionateScreenWidth(1),
                        mainAxisSpacing: getProportionateScreenWidth(1)),
                    itemBuilder: (context, index) {
                      var result =
                          _favouriteController.favouriteList.value[index];
                      return Container(
                        margin: EdgeInsets.all(getProportionateScreenWidth(3)),
                        padding: EdgeInsets.only(
                            top: getProportionateScreenWidth(7),
                            left: getProportionateScreenWidth(10),
                            right: getProportionateScreenWidth(10)),
                        color: Colors.grey.withOpacity(0.1),
                        child: Column(
                          children: [
                            Container(
                              height: getProportionateScreenHeight(180),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(result.image),
                                    fit: BoxFit.fill),
                                border: Border.all(color: Colors.grey),
                                color: Colors.transparent,
                              ),
                            ),
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        result.name,
                                        maxLines: 2,
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        CommonData.takaSign +
                                            " ${result.newPrice}",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenHeight(
                                                    12),
                                            color: AllColors.mainColor),
                                      )
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                  ),
                                ),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                )
                              ],
                            ))
                          ],
                        ),
                      );
                    });
              }
            }),
            Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenHeight(20)),
              child: Text(
                "You May Also Like",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10)),
              child: Obx(() {
                if (_homeController.isApiProductLoading.value) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTab ? 4 : 3,
                          crossAxisSpacing: getProportionateScreenWidth(5),
                          mainAxisSpacing: getProportionateScreenWidth(5)),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Container(
                            height: getProportionateScreenHeight(170),
                            color: Colors.yellow,
                          ),
                        );
                      });
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTab ? 4 : 3,
                        crossAxisSpacing: getProportionateScreenWidth(5),
                        mainAxisSpacing: getProportionateScreenWidth(5),
                        childAspectRatio: isTab
                            ? aspt(getProportionateScreenWidth(420))
                            : aspt(getProportionateScreenWidth(300)),
                      ),
                      itemCount: _homeController.apiProductList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var result = _homeController.apiProductList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetails.routeName,
                                arguments:
                                    _homeController.apiProductList[index]);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.05)),
                            padding:
                                EdgeInsets.all(getProportionateScreenWidth(8)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: isTab
                                      ? getProportionateScreenWidth(110)
                                      : getProportionateScreenWidth(90),
                                  width: isTab
                                      ? getProportionateScreenWidth(110)
                                      : getProportionateScreenWidth(90),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey.withOpacity(0.3))),
                                  child: Stack(
                                    children: <Widget>[
                                      Center(
                                        child: Image.network(
                                          result.featureImage,
                                          fit: BoxFit.cover,
                                          height: isTab
                                              ? getProportionateScreenWidth(105)
                                              : getProportionateScreenWidth(85),
                                          width: isTab
                                              ? getProportionateScreenWidth(105)
                                              : getProportionateScreenWidth(85),
                                        ),
                                      ),
                                      Positioned(
                                          right: 0,
                                          child: Container(
                                            height:
                                                getProportionateScreenWidth(20),
                                            width:
                                                getProportionateScreenWidth(45),
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
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(
                                  result.productName.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Text(
                                  "₺ " + result.newPrice.toString() + " ",
                                  style: TextStyle(
                                      color: AllColors.mainColor,
                                      fontSize:
                                          getProportionateScreenWidth(13)),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: 4.4,
                                      itemBuilder: (context, index) =>
                                          const Icon(
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
                                          fontSize:
                                              getProportionateScreenWidth(10)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
