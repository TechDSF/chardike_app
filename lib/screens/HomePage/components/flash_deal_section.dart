import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';
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
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Obx(() {
          if (_homeController.isFlashProductLoading.value) {
            return SizedBox(
              height: SizeConfig.screenWidth * 0.4,
              width: double.infinity,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.1),
                        highlightColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          height: SizeConfig.screenWidth * 0.4,
                          width: SizeConfig.screenWidth * 0.32,
                          color: Colors.yellow,
                        ),
                      ),
                    );
                  }),
            );
          } else {
            if (_homeController.flashProductList.isEmpty) {
              return SizedBox();
            } else {
              return Container(
                color: Colors.grey.withOpacity(0.1),
                child: Column(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.02),
                      child: FlashDealSectionTitle(onTap: () {
                        Navigator.pushNamed(
                            context, FlashSaleDetails.routeName);
                      }),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    SizedBox(
                        height: SizeConfig.screenWidth * 0.5,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.005),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  _homeController.flashProductList.length,
                              itemBuilder: (context, index) {
                                var result =
                                    _homeController.flashProductList[index];
                                return InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, ProductDetails.routeName,
                                          arguments: {
                                            "type": false,
                                            "ds": result.flashPrice.toString(),
                                            "product": result.flashProduct
                                          });
                                    },
                                    child: SizedBox(
                                      height: SizeConfig.screenWidth * 0.5,
                                      width: SizeConfig.screenWidth * 0.32,
                                      child: Card(
                                        color: Colors.white,
                                        shadowColor: Colors.grey,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.screenWidth * 0.02),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(
                                              SizeConfig.screenWidth * 0.01),
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                height: SizeConfig.screenWidth *
                                                    0.27,
                                                width: SizeConfig.screenWidth *
                                                    0.32,
                                                padding: EdgeInsets.all(
                                                    SizeConfig.screenWidth *
                                                        0.01),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            SizeConfig
                                                                    .screenWidth *
                                                                0.02)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            result.flashProduct
                                                                .featureImage),
                                                        fit: BoxFit.fill)),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Container(
                                                      padding: EdgeInsets.all(
                                                          SizeConfig
                                                                  .screenWidth *
                                                              0.001),
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(SizeConfig
                                                                      .screenWidth *
                                                                  0.006),
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.3)),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            size: SizeConfig
                                                                    .screenWidth *
                                                                0.02,
                                                            color:
                                                                Colors.orange,
                                                          ),
                                                          SizedBox(
                                                            width: SizeConfig
                                                                    .screenWidth *
                                                                0.005,
                                                          ),
                                                          Text(
                                                            "${CommonData.calculateRating(result.flashProduct.reviews)}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.02),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: SizeConfig
                                                              .screenWidth *
                                                          0.05,
                                                      width: SizeConfig
                                                              .screenWidth *
                                                          0.05,
                                                      child: Icon(
                                                        Icons.favorite,
                                                        color: Colors.orange,
                                                        size: SizeConfig
                                                                .screenWidth *
                                                            0.03,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          color: Colors.grey
                                                              .withOpacity(
                                                                  0.3)),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.screenWidth *
                                                    0.01,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Text(
                                                      result.flashProduct
                                                          .productName,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.black,
                                                          fontSize: SizeConfig
                                                                  .screenWidth *
                                                              0.028,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .screenWidth *
                                                          0.003,
                                                    ),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      TextSpan(
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: SizeConfig
                                                                      .screenWidth *
                                                                  0.027),
                                                          text: "₺" +
                                                              result.flashPrice
                                                                  .toString()),
                                                      TextSpan(
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color:
                                                                  Colors.black,
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              fontSize: SizeConfig
                                                                      .screenWidth *
                                                                  0.019),
                                                          text: " ₺" +
                                                              result
                                                                  .flashProduct
                                                                  .regularPrice
                                                                  .toString())
                                                    ])),
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .screenWidth *
                                                          0.005,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Text(
                                                          "${result.flashDiscount}%",
                                                          //"${CommonData.calculateDiscount(regularPrice: double.parse(result.flashProduct.regularPrice), sellingPrice: result.flashPrice)}%",
                                                          style: TextStyle(
                                                              color: AllColors
                                                                  .mainColor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        // SizedBox(
                                                        //   width: SizeConfig
                                                        //           .screenWidth *
                                                        //       0.12,
                                                        //   child:
                                                        //       LinearPercentIndicator(
                                                        //     lineHeight: 4.0,
                                                        //     percent: double
                                                        //         .parse((50 /
                                                        //                 100)
                                                        //             .toStringAsFixed(
                                                        //                 1)),
                                                        //     progressColor:
                                                        //         Colors.red,
                                                        //   ),
                                                        // ),
                                                        Container(
                                                            padding: EdgeInsets
                                                                .all(SizeConfig
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
                                                                color: Color(
                                                                    0xFFff3366)),
                                                            child: Text(
                                                              "Shop Now",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      SizeConfig
                                                                              .screenWidth *
                                                                          0.018),
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ));
                              }),
                        )),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                  ],
                ),
              );
            }
          }
        }),
      ],
    );
  }
}
