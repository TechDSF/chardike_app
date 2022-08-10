import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../size_config.dart';
import '../../PopularProduct/popular_product.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/home_controller.dart';

class PopularProductSection extends StatelessWidget {
  PopularProductSection({Key? key}) : super(key: key);
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
                    vertical: SizeConfig.screenWidth * 0.02),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.screenWidth * 0.02),
                      child: SectionTitle(
                          title: "Feature Product",
                          buttonText: "See More",
                          onTap: () {
                            Navigator.pushNamed(
                                context, PopularProduct.routeName);
                          }),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    SizedBox(
                        height: SizeConfig.screenWidth * 0.45,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.screenWidth * 0.005),
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
                                          arguments: {
                                            "type": true,
                                            "ds": "0",
                                            "product": result
                                          });
                                    },
                                    child: SizedBox(
                                      height: SizeConfig.screenWidth * 0.45,
                                      width: SizeConfig.screenWidth * 0.32,
                                      child: Card(
                                        color: Colors.white,
                                        elevation: 1,
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
                                                    0.26,
                                                padding: EdgeInsets.all(
                                                    SizeConfig.screenWidth *
                                                        0.01),
                                                decoration: BoxDecoration(
                                                    color: Colors.green
                                                        .withOpacity(0.2),
                                                    borderRadius: BorderRadius
                                                        .all(Radius.circular(
                                                            SizeConfig
                                                                    .screenWidth *
                                                                0.02)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            result
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
                                                            "${CommonData.calculateRating(result.reviews)}",
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
                                                      result.productName,
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
                                                              result
                                                                  .sellingPrice
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
                                                                  .regularPrice
                                                                  .toString())
                                                    ])),
                                                    SizedBox(
                                                      height: SizeConfig
                                                              .screenWidth *
                                                          0.005,
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
