import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
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

    return Column(
      children: <Widget>[
        ///all product section
        SectionTitle(title: "Daily Discover", onTap: () {}),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
        Obx(() {
          if (_homeController.isApiProductLoading.value) {
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
                      : aspt(getProportionateScreenWidth(300)),
                ),
                itemCount: _homeController.apiProductList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  ProductModel result = _homeController.apiProductList[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetails.routeName,
                          arguments: result);
                    },
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.grey.withOpacity(0.05)),
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: isTab
                                ? getProportionateScreenWidth(110)
                                : getProportionateScreenWidth(90),
                            width: isTab
                                ? getProportionateScreenWidth(110)
                                : getProportionateScreenWidth(90),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.3))),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Image.network(
                                    result.featureImage,
                                    fit: BoxFit.cover,
                                    height: isTab
                                        ? getProportionateScreenWidth(105)
                                        : getProportionateScreenWidth(85),
                                    width: isTab
                                        ? getProportionateScreenWidth(105)
                                        : getProportionateScreenWidth(85),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
                                      height: getProportionateScreenWidth(20),
                                      width: getProportionateScreenWidth(45),
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
                                        "-10%",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(10),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )),
                                    ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(10),
                          ),
                          Text(
                            result.productName.toString(),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            "₺ " + result.newPrice.toString() + " ",
                            style: TextStyle(
                                color: AllColors.mainColor,
                                fontSize: getProportionateScreenWidth(13)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: 4.4,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: getProportionateScreenWidth(10),
                                direction: Axis.horizontal,
                              ),
                              Text(
                                "(34)",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }
        }),
        SizedBox(
          height: getProportionateScreenHeight(50),
        ),
      ],
    );
  }
}
