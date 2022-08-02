import 'package:chardike/screens/HomePage/components/all_product_details.dart';
import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/home_controller.dart';

class AllProductSection extends StatelessWidget {
  AllProductSection({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

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

    return Column(
      children: <Widget>[
        ///all product section
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
          child: SectionTitle(
              title: "All Products",
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => AllProductDetails()));
              }),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Obx(() {
          if (_homeController.isLatestProductLoading.value) {
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
            return Column(
              children: [
                GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: getProportionateScreenWidth(5),
                      mainAxisSpacing: getProportionateScreenWidth(5),
                      childAspectRatio: aspt(SizeConfig.screenWidth * 0.7),
                    ),
                    itemCount: _homeController.latestProductList.length > 18
                        ? 18
                        : _homeController.latestProductList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      ProductModel result =
                          _homeController.latestProductList[index];
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
                              ? SizeConfig.screenWidth * 0.6
                              : SizeConfig.screenWidth * 0.5,
                          width: SizeConfig.screenWidth * 0.32,
                          child: Card(
                            color: Color(0xFFF3F5F8),
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.screenWidth * 0.02),
                            ),
                            child: Column(children: <Widget>[
                              Container(
                                height: isTab
                                    ? SizeConfig.screenWidth * 0.3
                                    : SizeConfig.screenWidth * 0.27,
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
                                                : SizeConfig.screenWidth *
                                                    0.025,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: isTab
                                                          ? SizeConfig
                                                                  .screenWidth *
                                                              0.02
                                                          : SizeConfig
                                                                  .screenWidth *
                                                              0.027),
                                                  text: "₺" +
                                                      result.sellingPrice
                                                          .toString()),
                                              TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: isTab
                                                          ? SizeConfig
                                                                  .screenWidth *
                                                              0.012
                                                          : SizeConfig
                                                                  .screenWidth *
                                                              0.019),
                                                  text: " ₺" +
                                                      result.regularPrice
                                                          .toString())
                                            ])),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.star,
                                                size: SizeConfig.screenWidth *
                                                    0.024,
                                                color: Colors.orange,
                                              ),
                                              Text(
                                                "${CommonData.calculateRating(result.reviews)}",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.02
                                                      : SizeConfig.screenWidth *
                                                          0.024,
                                                ),
                                              ),
                                              Text(
                                                "(${result.reviews.length})",
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.02,
                                                ),
                                              )
                                            ],
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
                _homeController.latestProductList.length > 18
                    ? SizedBox(
                        height: getProportionateScreenHeight(10),
                      )
                    : SizedBox(),
                _homeController.latestProductList.length > 18
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllProductDetails()));
                        },
                        child: Container(
                          padding:
                              EdgeInsets.all(SizeConfig.screenWidth * 0.02),
                          decoration: BoxDecoration(
                              color: AllColors.mainColor,
                              borderRadius: BorderRadius.circular(
                                  SizeConfig.screenWidth * 0.01)),
                          child: Text(
                            "SHOW ALL",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    : SizedBox(),
              ],
            );
          }
        }),

        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}
