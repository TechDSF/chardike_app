import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';

class FeatureProduct extends StatelessWidget {
  FeatureProduct({Key? key}) : super(key: key);
  static const String routeName = "/feature_product";
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(() {
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
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isTab ? 3 : 2,
                    childAspectRatio: isTab
                        ? CommonData.aspactRatio(
                            height: getProportionateScreenHeight(350),
                            context: context,
                            crossAxisCount: 3,
                            crossAxisSpacing: 0)
                        : CommonData.aspactRatio(
                            height: getProportionateScreenHeight(260),
                            context: context,
                            crossAxisCount: 2,
                            crossAxisSpacing: 0)),
                itemCount: _homeController.popularProductList.length,
                itemBuilder: (context, index) {
                  var result = _homeController.popularProductList[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: result);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.15),
                            border:
                                Border.all(color: Colors.grey.withOpacity(0.1)),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(5))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: isTab
                                  ? getProportionateScreenHeight(230)
                                  : getProportionateScreenHeight(160),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                          getProportionateScreenWidth(5)),
                                      topRight: Radius.circular(
                                          getProportionateScreenWidth(5))),
                                  image: DecorationImage(
                                      image: NetworkImage(result.featureImage),
                                      fit: BoxFit.fill)),
                              child: Stack(
                                children: <Widget>[
                                  Positioned(
                                      right: 0,
                                      child: result.reviews.isEmpty
                                          ? SizedBox()
                                          : Container(
                                              height:
                                                  getProportionateScreenWidth(
                                                      20),
                                              width:
                                                  getProportionateScreenWidth(
                                                      45),
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(
                                                          getProportionateScreenWidth(
                                                              10)),
                                                      bottomLeft: Radius.circular(
                                                          getProportionateScreenWidth(
                                                              10)))),
                                              child: Center(
                                                  child: Text(
                                                "${CommonData.calculateRating(result.reviews)}",
                                                style: TextStyle(
                                                    fontSize:
                                                        getProportionateScreenWidth(
                                                            10),
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                            ))
                                ],
                              ),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(10),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    result.productName.toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenHeight(12)),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenHeight(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₺ " +
                                              result.variant[0].sellingPrice
                                                  .toString() +
                                              " ",
                                          style: TextStyle(
                                              color: AllColors.mainColor),
                                        ),
                                        Text(
                                          "₺" +
                                              result.variant[0].regularPrice
                                                  .toString(),
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              color: Colors.grey,
                                              fontSize:
                                                  getProportionateScreenHeight(
                                                      10)),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          }
        }),
      ),
    );
  }
}
