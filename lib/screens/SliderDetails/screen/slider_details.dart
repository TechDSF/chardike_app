import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../HomePage/model/product_model.dart';
import '../../ProductDetails/product_details.dart';

class SliderDetails extends StatelessWidget {
  SliderDetails({Key? key, required this.banner}) : super(key: key);
  BannerModel banner;
  final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());

  Widget SectionTitle(String text, VoidCallback onTap) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                        text: text + " ",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: "SALE",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold)),
                  ])),
              InkWell(
                  onTap: onTap,
                  child: Text("See More",
                      style: TextStyle(color: AllColors.mainColor)))
            ],
          ),
        ),
        Divider(
          color: Colors.grey.withOpacity(0.5),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;
    bool isTab = SizeConfig.screenWidth > 768;

    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        titleSpacing: 0,
        centerTitle: false,
        title: Text("${banner.name}"),
        actions: <Widget>[
          Center(
              child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CommonData.icon(
                          icon: "asset/icons/cart.png",
                          color: Colors.grey,
                          isTab: isTab),
                      Positioned(
                        left: -5,
                        top: 0,
                        child: Container(
                          width: SizeConfig.screenWidth * 0.035,
                          height: SizeConfig.screenWidth * 0.035,
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: Center(
                            child: Obx(() => Text(
                                  _cartController.cartList.value.length
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: SizeConfig.screenWidth * 0.03),
                                )),
                          ),
                        ),
                      )
                    ],
                  ))),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child:

            ///all product
            Obx(() {
          if (_homeController.isBannerLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            if (banner.products.isEmpty) {
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
                  itemCount: banner.products.length,
                  itemBuilder: (context, index) {
                    ProductModel result = banner.products[index].bannerProduct!;
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: {
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
                                        image:
                                            NetworkImage(result.featureImage),
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
                                          "${CommonData.calculateDiscount(regularPrice: double.parse(result.regularPrice), sellingPrice: double.parse(result.sellingPrice))}%",
                                          //"${result.regularPrice}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.03),
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
                                              size:
                                                  SizeConfig.screenWidth * 0.03,
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.008,
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
                                      result.productName,
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
                                          text: "₺" +
                                              result.sellingPrice.toString()),
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
                                              result.regularPrice.toString())
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
                                          "(${result.reviews.length})",
                                          style: TextStyle(
                                            fontSize: isTab
                                                ? SizeConfig.screenWidth * 0.02
                                                : SizeConfig.screenWidth * 0.03,
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
          }
        }),
      ),
    );
  }
}
