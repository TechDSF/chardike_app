import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/components/side_menu.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/common_data.dart';
import '../../ProductDetails/product_details.dart';

class AllProduct extends StatelessWidget {
  AllProduct({Key? key, required this.type}) : super(key: key);
  String type;
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    _homeController.filterBySubCategory(subCategoryName: type);
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
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(10),
                  horizontal: getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(getProportionateScreenWidth(17)),
                  border: Border.all(color: AllColors.mainColor)),
              child: Text(
                type,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: Colors.black.withOpacity(0.7)),
              ),
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
        body: Obx(() {
          if (_homeController.isAllProductLoading.value ||
              _homeController.isSubCategoryFilterLoading.value) {
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
            if (_homeController.subCategoryProductList.isEmpty) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: double.infinity,
                    ),
                    Container(
                      height: SizeConfig.screenWidth * 0.7,
                      width: SizeConfig.screenWidth * 0.7,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage("asset/images/empty_cart.png"))),
                    ),
                  ]);
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
                  itemCount: _homeController.subCategoryProductList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var result = _homeController.subCategoryProductList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetails.routeName,
                              arguments: {
                                "type": true,
                                "ds": "0",
                                "product": result
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: isTab
                                    ? getProportionateScreenHeight(240)
                                    : getProportionateScreenHeight(165),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            getProportionateScreenWidth(5)),
                                        topRight: Radius.circular(
                                            getProportionateScreenWidth(5))),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(result.featureImage),
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
                                          fontWeight: FontWeight.bold,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize:
                                              getProportionateScreenHeight(13)),
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
                                            CommonData.takaSign +
                                                " " +
                                                result.sellingPrice.toString() +
                                                " ",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        13),
                                                fontWeight: FontWeight.bold,
                                                color: AllColors.mainColor),
                                          ),
                                          Text(
                                            CommonData.takaSign +
                                                result.regularPrice.toString(),
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        11)),
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
          }
        }));
  }
}
