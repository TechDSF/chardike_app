import 'dart:ui';

import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
      child: Column(
        children: <Widget>[
          ///all product section
          SectionTitle(title: "Daily Discover", onTap: () {}),
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
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTab ? 4 : 3,
                    crossAxisSpacing: getProportionateScreenWidth(5),
                    mainAxisSpacing: getProportionateScreenWidth(5),
                    childAspectRatio: isTab
                        ? aspt(getProportionateScreenWidth(420))
                        : aspt(SizeConfig.screenWidth * 0.7),
                  ),
                  itemCount: _homeController.latestProductList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    ProductModel result =
                        _homeController.latestProductList[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: result);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * 0.02),
                        ),
                        child: Column(children: <Widget>[
                          Container(
                            height: SizeConfig.screenWidth * 0.3,
                            width: SizeConfig.screenWidth * 0.3,
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenWidth * 0.015),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(
                                      SizeConfig.screenWidth * 0.02),
                                  topRight: Radius.circular(
                                      SizeConfig.screenWidth * 0.02),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(result.featureImage),
                                    fit: BoxFit.fill)),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(
                                        SizeConfig.screenWidth * 0.004),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                SizeConfig.screenWidth * 0.015),
                                            bottomRight: Radius.circular(
                                                SizeConfig.screenWidth *
                                                    0.015)),
                                        color: Colors.green),
                                    child: Text(
                                      "10%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.023),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: SizeConfig.screenWidth * 0.05,
                                        width: SizeConfig.screenWidth * 0.05,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.orange,
                                          size: SizeConfig.screenWidth * 0.03,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.grey.withOpacity(0.3)),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.008,
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.screenWidth * 0.008),
                            decoration: BoxDecoration(
                                color: Color(0xFFF3F5F8),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(
                                        SizeConfig.screenWidth * 0.01),
                                    bottomRight: Radius.circular(
                                        SizeConfig.screenWidth * 0.01))),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text(
                                    result.productName,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize:
                                            SizeConfig.screenWidth * 0.025,
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.025),
                                              text: "₺" +
                                                  result.variant[0].sellingPrice
                                                      .toString()),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.015),
                                              text: " ₺" +
                                                  result.variant[0].regularPrice
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
                                            size:
                                                SizeConfig.screenWidth * 0.024,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "${CommonData.calculateRating(result.reviews)}",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.024,
                                            ),
                                          ),
                                          Text(
                                            "(${result.reviews.length})",
                                            style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              fontSize:
                                                  SizeConfig.screenWidth * 0.02,
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
                    );
                  });
            }
          }),
          SizedBox(
            height: getProportionateScreenHeight(50),
          ),
        ],
      ),
    );
  }
}
