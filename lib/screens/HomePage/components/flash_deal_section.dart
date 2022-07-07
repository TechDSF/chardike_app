import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';
import '../../FlashSaleDetails/screens/flash_sale_details.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/home_controller.dart';
import 'flash_deal_section_title.dart';

class FlashDealSection extends StatelessWidget {
  FlashDealSection({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///flash deal product

        Obx(() {
          if (_homeController.isLatestProductLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            if (_homeController.latestProductList.isEmpty) {
              return SizedBox();
            } else {
              return Container(
                color: Color(0xFFF4F2F2),
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    FlashDealSectionTitle(onTap: () {
                      Navigator.pushNamed(context, FlashSaleDetails.routeName);
                    }),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                        height: SizeConfig.screenWidth * 0.35,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _homeController.latestProductList.length,
                            itemBuilder: (context, index) {
                              var result =
                                  _homeController.latestProductList[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetails.routeName,
                                        arguments: result);
                                  },
                                  child: Container(
                                    height: SizeConfig.screenWidth * 0.35,
                                    width: SizeConfig.screenWidth * 0.25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          SizeConfig.screenWidth * 0.02),
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.only(
                                        right: SizeConfig.screenWidth * 0.02),
                                    child: Column(
                                      children: <Widget>[
                                        Container(
                                          height: SizeConfig.screenWidth * 0.22,
                                          width: SizeConfig.screenWidth * 0.25,
                                          padding: EdgeInsets.all(
                                              SizeConfig.screenWidth * 0.01),
                                          decoration: BoxDecoration(
                                              color:
                                                  Colors.green.withOpacity(0.2),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      SizeConfig.screenWidth *
                                                          0.02),
                                                  topRight: Radius.circular(
                                                      SizeConfig.screenWidth *
                                                          0.02)),
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
                                                    SizeConfig.screenWidth *
                                                        0.001),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .circular(SizeConfig
                                                                .screenWidth *
                                                            0.006),
                                                    color: Colors.grey
                                                        .withOpacity(0.3)),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.star,
                                                      size: SizeConfig
                                                              .screenWidth *
                                                          0.02,
                                                      color: Colors.orange,
                                                    ),
                                                    SizedBox(
                                                      width: SizeConfig
                                                              .screenWidth *
                                                          0.005,
                                                    ),
                                                    Text(
                                                      "4.9",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: SizeConfig
                                                                  .screenWidth *
                                                              0.02),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                result.productName,
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        SizeConfig.screenWidth *
                                                            0.02,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.screenWidth *
                                                    0.003,
                                              ),
                                              RichText(
                                                  text: TextSpan(children: [
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: SizeConfig
                                                                .screenWidth *
                                                            0.025),
                                                    text: "₺" +
                                                        result.variant[0]
                                                            .sellingPrice
                                                            .toString()),
                                                TextSpan(
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: SizeConfig
                                                                .screenWidth *
                                                            0.015),
                                                    text: " ₺" +
                                                        result.variant[0]
                                                            .regularPrice
                                                            .toString())
                                              ])),
                                              SizedBox(
                                                height: SizeConfig.screenWidth *
                                                    0.005,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  SizedBox(
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.12,
                                                    child:
                                                        LinearPercentIndicator(
                                                      lineHeight: 4.0,
                                                      percent: double.parse(
                                                          (50 / 100)
                                                              .toStringAsFixed(
                                                                  1)),
                                                      progressColor: Colors.red,
                                                    ),
                                                  ),
                                                  Container(
                                                      padding: EdgeInsets.all(
                                                          SizeConfig
                                                                  .screenWidth *
                                                              0.005),
                                                      margin: EdgeInsets.only(
                                                          right: SizeConfig
                                                                  .screenWidth *
                                                              0.01),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(SizeConfig
                                                                      .screenWidth *
                                                                  0.006),
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.3)),
                                                      child: Text(
                                                        "Shop Now",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: SizeConfig
                                                                    .screenWidth *
                                                                0.015),
                                                      )),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            })),
                  ],
                ),
              );
            }
          }
        }),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
      ],
    );
  }
}
