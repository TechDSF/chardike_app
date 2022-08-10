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
import '../../../HomePage/model/product_model.dart';
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
            _homeController.popularProductList.isEmpty
                ? SizedBox()
                : Container(
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
                if (_homeController.isPopularProductLoading.value) {
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
                          baseColor: Colors.grey.withOpacity(0.07),
                          highlightColor: Colors.grey.withOpacity(0.2),
                          child: Container(
                            height: getProportionateScreenHeight(170),
                            color: Colors.yellow,
                          ),
                        );
                      });
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTab ? 3 : 2,
                          crossAxisSpacing: getProportionateScreenWidth(5),
                          mainAxisSpacing: getProportionateScreenWidth(5),
                          childAspectRatio: CommonData.aspactRatio(
                              height: isTab
                                  ? SizeConfig.screenWidth * 0.7
                                  : SizeConfig.screenWidth * 0.7,
                              context: context,
                              crossAxisCount: 2,
                              crossAxisSpacing: 5)),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _homeController.popularProductList.length,
                      itemBuilder: (context, index) {
                        ProductModel result =
                            _homeController.popularProductList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetails.routeName, arguments: {
                              "type": true,
                              "ds": "0",
                              "product": result
                            });
                          },
                          child: SizedBox(
                            height: isTab
                                ? SizeConfig.screenWidth * 0.7
                                : SizeConfig.screenWidth * 0.5,
                            width: SizeConfig.screenWidth * 0.32,
                            child: Card(
                              color: Color(0xFFF3F5F8),
                              shadowColor: Colors.grey,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenWidth * 0.02),
                              ),
                              child: Column(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: isTab
                                        ? SizeConfig.screenWidth * 0.3
                                        : SizeConfig.screenWidth * 0.43,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.screenWidth * 0.015),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeConfig.screenWidth * 0.02),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                result.featureImage),
                                            fit: BoxFit.fill)),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(
                                                SizeConfig.screenWidth * 0.004),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        SizeConfig.screenWidth *
                                                            0.015),
                                                    bottomRight: Radius
                                                        .circular(SizeConfig
                                                                .screenWidth *
                                                            0.015)),
                                                color: Colors.green),
                                            child: Text(
                                              "${CommonData.calculateDiscount(regularPrice: double.parse(result.regularPrice), sellingPrice: double.parse(result.sellingPrice))}%",
                                              //"${result.regularPrice}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.023),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: SizeConfig.screenWidth *
                                                    0.05,
                                                width: SizeConfig.screenWidth *
                                                    0.05,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.orange,
                                                  size: SizeConfig.screenWidth *
                                                      0.03,
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey
                                                        .withOpacity(0.3)),
                                              ),
                                              SizedBox(
                                                width: SizeConfig.screenWidth *
                                                    0.008,
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenWidth * 0.01,
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.003),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              SizeConfig.screenWidth * 0.02),
                                          bottomRight: Radius.circular(
                                              SizeConfig.screenWidth * 0.02))),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          result.productName,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: isTab
                                                  ? SizeConfig.screenWidth *
                                                      0.02
                                                  : SizeConfig.screenWidth *
                                                      0.03,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.025
                                                      : SizeConfig.screenWidth *
                                                          0.03),
                                              text: "₺" +
                                                  result.sellingPrice
                                                      .toString()),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.018
                                                      : SizeConfig.screenWidth *
                                                          0.022),
                                              text: " ₺" +
                                                  result.regularPrice
                                                      .toString())
                                        ])),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  CommonData.calculateRating(
                                                      result.reviews),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize: isTab
                                                  ? SizeConfig.screenWidth *
                                                      0.02
                                                  : SizeConfig.screenWidth *
                                                      0.03,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            Text(
                                              "(${result.reviews.length})",
                                              style: TextStyle(
                                                fontSize: isTab
                                                    ? SizeConfig.screenWidth *
                                                        0.02
                                                    : SizeConfig.screenWidth *
                                                        0.03,
                                              ),
                                            )
                                          ],
                                        ),
                                      ]),
                                ))
                              ]),
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
