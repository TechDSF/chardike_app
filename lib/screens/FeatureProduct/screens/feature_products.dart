import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';

class FeatureProduct extends StatelessWidget {
  FeatureProduct({Key? key}) : super(key: key);
  static const String routeName = "/feature_product";
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

    return Scaffold(
      appBar: AppBar(
        title: Text("Feature Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Obx(() {
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
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTab ? 3 : 2,
                  childAspectRatio: isTab
                      ? aspt(getProportionateScreenWidth(500))
                      : aspt(getProportionateScreenWidth(300)),
                ),
                itemCount: _homeController.apiProductList.length,
                itemBuilder: (context, index) {
                  var result = _homeController.apiProductList[
                      (_homeController.apiProductList.length - 1) - index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetails.routeName,
                          arguments: result);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          // border: Border(
                          //   top: const BorderSide(color: Colors.grey,width: 0.5),
                          //   left: index%2==0?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                          //   right: index%2==0?const BorderSide(color: Colors.grey,width: 0):const BorderSide(color: Colors.grey,width: 0.5),
                          //   bottom: index == _homeController.apiProductList.length-1 || index == _homeController.apiProductList.length-2?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                          // )
                          ),
                      padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: isTab
                                ? getProportionateScreenWidth(220)
                                : getProportionateScreenWidth(180),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.2)),
                                image: DecorationImage(
                                    image: NetworkImage(result.featureImage),
                                    fit: BoxFit.fill)),
                            child: Stack(
                              children: <Widget>[
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
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(5)),
                            child: Row(
                              children: [
                                Text(
                                  "₺ " + result.newPrice.toString() + " ",
                                  style: TextStyle(color: AllColors.mainColor),
                                  maxLines: 1,
                                ),
                                Text(
                                  "₺" + result.regularPrice.toString(),
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey,
                                      fontSize:
                                          getProportionateScreenWidth(10)),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: 3,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: getProportionateScreenWidth(10),
                                direction: Axis.horizontal,
                              ),
                              Text(
                                "(5)",
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
      ),
    );
  }
}
