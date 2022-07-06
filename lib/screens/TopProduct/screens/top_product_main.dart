import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';

class TopProductMain extends StatelessWidget {
  TopProductMain({Key? key}) : super(key: key);
  static const String routeName = "/top_product_main";
  final HomeController _homeController = Get.put(HomeController());

  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;
    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = isTab ? 3 : 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Top Products"),
      ),
      body: Obx(() {
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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: _homeController.popularProductList.length,
                gridDelegate: (SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: getProportionateScreenWidth(10),
                  crossAxisCount: isTab ? 3 : 2,
                  childAspectRatio: isTab
                      ? aspt(getProportionateScreenWidth(350))
                      : aspt(getProportionateScreenWidth(250)),
                  crossAxisSpacing: getProportionateScreenWidth(10),
                )),
                itemBuilder: (context, index) {
                  var result = _homeController.popularProductList[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(right: getProportionateScreenWidth(10)),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, TopProductPage.routeName);
                      },
                      child: Container(
                        width: SizeConfig.screenWidth / 2,
                        height: isTab
                            ? getProportionateScreenWidth(350)
                            : getProportionateScreenWidth(250),
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
                                  width: SizeConfig.screenWidth / 2,
                                  height: isTab
                                      ? getProportionateScreenWidth(250)
                                      : getProportionateScreenWidth(170),
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
                                              getProportionateScreenWidth(10)),
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
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Cleansing Oil",
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis,
                                        fontSize:
                                            getProportionateScreenWidth(12),
                                        color: Colors.black),
                                    maxLines: 1,
                                  ),
                                  Text(
                                    "16k+ sold",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(11),
                                        color: Colors.black.withOpacity(0.7),
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
                }),
          );
        }
      }),
    );
  }
}
