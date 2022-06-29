import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../TopProduct/screens/top_product_main.dart';
import '../../TopProduct/screens/top_product_page.dart';
import '../controller/home_controller.dart';

class TopProduct extends StatelessWidget {
  TopProduct({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///related product
        SectionTitle(
            title: "Top Product",
            onTap: () {
              Navigator.pushNamed(context, TopProductMain.routeName);
            }),
        Divider(),
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
                height: getProportionateScreenHeight(220),
                child: ListView.builder(
                    itemCount: _homeController.allProductList.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var result = _homeController.allProductList[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            right: getProportionateScreenWidth(10)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, TopProductPage.routeName);
                          },
                          child: Container(
                            width: getProportionateScreenHeight(150),
                            height: getProportionateScreenHeight(220),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Image.network(
                                      result.featureImage,
                                      width: getProportionateScreenHeight(150),
                                      height: getProportionateScreenHeight(150),
                                      fit: BoxFit.fill,
                                    ),
                                    Positioned(
                                        child: Container(
                                      height: getProportionateScreenWidth(30),
                                      width: getProportionateScreenWidth(25),
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius: BorderRadius.only(
                                              bottomRight: Radius.circular(
                                                  getProportionateScreenWidth(
                                                      10)),
                                              bottomLeft: Radius.circular(
                                                  getProportionateScreenWidth(
                                                      10)))),
                                      child: Center(
                                          child: Text(
                                        "Top",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(8),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ))
                                  ],
                                ),
                                Expanded(
                                    child: Container(
                                  color: Colors.grey.withOpacity(0.05),
                                  width: double.infinity,
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(5)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Cleansing Oil",
                                        style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize:
                                                getProportionateScreenWidth(12),
                                            color: Colors.black),
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "16k+ sold",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(11),
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 1,
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }));
          }
        }),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}
