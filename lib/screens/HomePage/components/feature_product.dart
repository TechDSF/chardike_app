import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';
import '../../FeatureProduct/screens/feature_products.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/home_controller.dart';

class FeatureProductSection extends StatelessWidget {
  FeatureProductSection({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///Feature product section
        SectionTitle(title: "Feature Product", onTap: () {
          Navigator.pushNamed(context, FeatureProduct.routeName);
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
                height: isTab?getProportionateScreenHeight(220):getProportionateScreenHeight(170),
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
                              right: getProportionateScreenWidth(7)),
                          child: SizedBox(
                            height: isTab?getProportionateScreenHeight(220):getProportionateScreenHeight(170),
                            width: isTab?getProportionateScreenWidth(160):getProportionateScreenWidth(110),
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  height: isTab?getProportionateScreenHeight(150):getProportionateScreenHeight(110),
                                  width: isTab?getProportionateScreenWidth(150):getProportionateScreenHeight(110),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(
                                              7)),
                                      border: Border.all(
                                          color: Colors.grey
                                              .withOpacity(0.3))),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(
                                            7)),
                                    child: Stack(
                                      children: <Widget>[
                                        Center(
                                          child: Image.network(
                                            result.featureImage,
                                            fit: BoxFit.cover,
                                            height: isTab?getProportionateScreenHeight(145):getProportionateScreenHeight(105),
                                            width: isTab?getProportionateScreenWidth(145):getProportionateScreenHeight(105),
                                          ),
                                        ),
                                        Positioned(
                                            height:
                                            getProportionateScreenWidth(
                                                20),
                                            width:
                                            getProportionateScreenWidth(
                                                45),
                                            right: 0,
                                            child: Container(
                                              height:
                                              getProportionateScreenWidth(
                                                  20),
                                              width:
                                              getProportionateScreenWidth(
                                                  45),
                                              decoration: BoxDecoration(
                                                  color:
                                                  Colors.orange,
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
                                                        color:
                                                        Colors.white,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  )),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  getProportionateScreenHeight(10),
                                ),
                                SizedBox(
                                  width:
                                  getProportionateScreenWidth(110),
                                  child: Text(
                                    result.productName.toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize:
                                        isTab?getProportionateScreenWidth(
                                            15):getProportionateScreenWidth(
                                            12),
                                        overflow:
                                        TextOverflow.ellipsis),
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "₺" + result.newPrice,
                                        style: TextStyle(
                                            color: AllColors.mainColor,
                                            fontSize:
                                            getProportionateScreenWidth(
                                                12)),
                                      ),
                                      TextSpan(
                                        text: " ",
                                      ),
                                      TextSpan(
                                        text: "₺" + result.regularPrice.toString(),
                                        style: TextStyle(
                                            decoration: TextDecoration
                                                .lineThrough,
                                            color: Colors.grey,
                                            fontSize:
                                            getProportionateScreenWidth(
                                                10)),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          }
        }),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
      ],
    );
  }
}
