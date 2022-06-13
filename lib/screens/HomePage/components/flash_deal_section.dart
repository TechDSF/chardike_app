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
        FlashDealSectionTitle(onTap: () {
          Navigator.pushNamed(context, FlashSaleDetails.routeName);
        }),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Obx(() {
          if (_homeController.isApiProductLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            return SizedBox(
                height: getProportionateScreenHeight(170),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _homeController.apiProductList.length,
                    itemBuilder: (context, index) {
                      var result =
                      _homeController.apiProductList[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                              context, ProductDetails.routeName,
                              arguments:
                              _homeController.apiProductList[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: getProportionateScreenWidth(5)),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height:
                                getProportionateScreenHeight(110),
                                width: getProportionateScreenWidth(110),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey
                                            .withOpacity(0.2)),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(7)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(7)),
                                    child: Stack(
                                      children: <Widget>[
                                        // FadeInImage.assetNetwork(placeholder: "asset/images/shopping_beg.png", image: result.featureImage,height:
                                        // getProportionateScreenWidth(
                                        //     110),
                                        //   width:
                                        //   getProportionateScreenWidth(
                                        //       110),
                                        //   fit: BoxFit.fill,),
                                        Image.network(
                                          result.featureImage,
                                          height:
                                          getProportionateScreenWidth(
                                              110),
                                          width:
                                          getProportionateScreenWidth(
                                              110),
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                            right: 0,
                                            child: Container(
                                              height:
                                              getProportionateScreenWidth(
                                                  20),
                                              width:
                                              getProportionateScreenWidth(
                                                  45),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius
                                                          .circular(
                                                          getProportionateScreenWidth(
                                                              10)),
                                                      bottomLeft: Radius
                                                          .circular(
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
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  )),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:
                                getProportionateScreenHeight(10),
                              ),
                              Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(
                                        width: getProportionateScreenHeight(
                                            110),
                                        child: LinearPercentIndicator(
                                          lineHeight: 8.0,
                                          percent: double.parse((50 / 100)
                                              .toStringAsFixed(1)),
                                          progressColor: Colors.orange,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                        getProportionateScreenHeight(
                                            10),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                            getProportionateScreenWidth(
                                                5)),
                                        child: Text(
                                          "₺ " + result.newPrice.toString(),
                                          style: TextStyle(
                                              color: AllColors.mainColor),
                                        ),
                                      ),
                                    ],
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                  ))
                            ],
                          ),
                        ),
                      );
                    }));
          }
        }),
      ],
    );
  }
}
