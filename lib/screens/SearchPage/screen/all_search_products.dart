import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../CategoryPage/components/side_menu.dart';
import '../../HomePage/model/product_model.dart';
import '../../ProductDetails/product_details.dart';

class AllSearchProducts extends StatelessWidget {
  AllSearchProducts({Key? key, required this.searchType}) : super(key: key);
  String searchType;
  bool isTab = SizeConfig.screenWidth > 768;
  final HomeController _homeController = Get.put(HomeController());

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
      endDrawer: Drawer(
        child: FilterMenu(),
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AllColors.mainColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(10),
              horizontal: getProportionateScreenWidth(10)),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(17)),
              border: Border.all(color: AllColors.mainColor)),
          child: Text(
            searchType,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(12),
                color: Colors.black.withOpacity(0.7)),
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(
                left: getProportionateScreenWidth(10),
                right: getProportionateScreenWidth(10)),
            child: Builder(
              builder: (BuildContext context) {
                return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.filter,
                      color: AllColors.mainColor,
                    ));
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Obx(() {
            if (_homeController.isApiProductLoading.value) {
              return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTab ? 4 : 2,
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
                    crossAxisCount: isTab ? 3 : 2,
                    childAspectRatio: isTab
                        ? aspt(getProportionateScreenHeight(350))
                        : aspt(getProportionateScreenHeight(260)),
                  ),
                  itemCount: _homeController.allProductList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var result = _homeController.allProductList[
                        (_homeController.allProductList.length - 1) - index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: result);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                          top: const BorderSide(color: Colors.grey, width: 0.5),
                          left: index % 2 == 0
                              ? const BorderSide(color: Colors.grey, width: 0.5)
                              : const BorderSide(color: Colors.grey, width: 0),
                          right: index % 2 == 0
                              ? const BorderSide(color: Colors.grey, width: 0)
                              : const BorderSide(
                                  color: Colors.grey, width: 0.5),
                          bottom: index ==
                                      _homeController.allProductList.length -
                                          1 ||
                                  index ==
                                      _homeController.allProductList.length - 2
                              ? const BorderSide(color: Colors.grey, width: 0.5)
                              : const BorderSide(color: Colors.grey, width: 0),
                        )),
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              height: isTab
                                  ? getProportionateScreenHeight(240)
                                  : getProportionateScreenHeight(160),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AllColors.mainColor
                                          .withOpacity(0.05)),
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
                                                  getProportionateScreenWidth(
                                                      10),
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
                                  fontSize: getProportionateScreenHeight(12)),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenHeight(5)),
                              child: Row(
                                children: [
                                  Text(
                                    "₺ " +
                                        result.variant[0].sellingPrice
                                            .toString() +
                                        " ",
                                    style:
                                        TextStyle(color: AllColors.mainColor),
                                  ),
                                  Text(
                                    "₺" +
                                        result.variant[0].regularPrice
                                            .toString(),
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                        fontSize:
                                            getProportionateScreenHeight(10)),
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
                                  itemSize: getProportionateScreenHeight(10),
                                  direction: Axis.horizontal,
                                ),
                                Text(
                                  "(5)",
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenHeight(10)),
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
      )),
    );
  }
}
