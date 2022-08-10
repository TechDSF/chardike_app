import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';

class AllOfferProducts extends StatelessWidget {
  AllOfferProducts({Key? key, required this.isAllType}) : super(key: key);
  bool isAllType;
  final HomeController _homeController = Get.put(HomeController());

  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    _homeController.getDiscountProducts();
    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: Text(isAllType ? "All Offers" : "60% OFF"),
        ),
        body: Obx(() {
          if (_homeController.isDiscountDataLoading.value) {
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
                    baseColor: Colors.grey.withOpacity(0.05),
                    highlightColor: Colors.grey.withOpacity(0.2),
                    child: Container(
                      height: getProportionateScreenHeight(170),
                      color: Colors.yellow,
                    ),
                  );
                });
          } else {
            if (isAllType
                ? _homeController.discountProductList.isEmpty
                : _homeController.sixtyDiscountProductList.isEmpty) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Container(
                      height: SizeConfig.screenWidth * 0.7,
                      width: SizeConfig.screenWidth * 0.7,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("asset/images/empty_cart.png"))),
                    ),
                  ]);
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
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
                    itemCount: isAllType
                        ? _homeController.discountProductList.length
                        : _homeController.sixtyDiscountProductList.length,
                    itemBuilder: (context, index) {
                      var result = isAllType
                          ? _homeController.discountProductList[index]
                          : _homeController.sixtyDiscountProductList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetails.routeName,
                              arguments: {
                                "type": false,
                                "ds": "${result.price.toInt()}",
                                "product": result.discountProduct
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
                                          image: NetworkImage(result
                                              .discountProduct.featureImage),
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
                                                  bottomRight: Radius.circular(
                                                      SizeConfig.screenWidth *
                                                          0.015)),
                                              color: Colors.green),
                                          child: Text(
                                            "${result.discount}%",
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
                                              height:
                                                  SizeConfig.screenWidth * 0.05,
                                              width:
                                                  SizeConfig.screenWidth * 0.05,
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
                                    horizontal: SizeConfig.screenWidth * 0.003),
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
                                        result.discountProduct.productName,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontSize: isTab
                                                ? SizeConfig.screenWidth * 0.02
                                                : SizeConfig.screenWidth * 0.03,
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
                                            text:
                                                "₺" + result.price.toString()),
                                        TextSpan(
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                fontSize: isTab
                                                    ? SizeConfig.screenWidth *
                                                        0.018
                                                    : SizeConfig.screenWidth *
                                                        0.022),
                                            text: " ₺" +
                                                result.discountProduct
                                                    .regularPrice
                                                    .toString())
                                      ])),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          RatingBar.builder(
                                            initialRating:
                                                CommonData.calculateRating(
                                                    result.discountProduct
                                                        .reviews),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: isTab
                                                ? SizeConfig.screenWidth * 0.02
                                                : SizeConfig.screenWidth * 0.03,
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
                                            "(${result.discountProduct.reviews.length})",
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
                    }),
              );
            }
          }
        }));
  }
}
