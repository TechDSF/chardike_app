import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
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
        Obx(() {
          if (_homeController.isPopularProductLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            if (_homeController.popularProductList.isEmpty) {
              return SizedBox();
            } else {
              return Container(
                color: Color(0xFFDEFCF8),
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.03,
                    vertical: SizeConfig.screenWidth * 0.02),
                child: Column(
                  children: [
                    SectionTitle(
                        title: "Popular Product",
                        onTap: () {
                          Navigator.pushNamed(
                              context, FeatureProduct.routeName);
                        }),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    SizedBox(
                        height: isTab
                            ? getProportionateScreenHeight(220)
                            : SizeConfig.screenWidth * 0.32,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _homeController.popularProductList.length,
                            itemBuilder: (context, index) {
                              var result =
                                  _homeController.popularProductList[index];
                              return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetails.routeName,
                                        arguments: _homeController
                                            .popularProductList[index]);
                                  },
                                  child: Container(
                                    height: SizeConfig.screenWidth * 0.32,
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
          height: getProportionateScreenHeight(5),
        ),
      ],
    );
  }
}
