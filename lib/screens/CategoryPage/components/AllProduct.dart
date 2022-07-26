import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/components/side_menu.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../ProductDetails/product_details.dart';

class AllProduct extends StatelessWidget {
  AllProduct({Key? key, required this.type}) : super(key: key);
  String type;
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
      endDrawer: Drawer(
        child: FilterMenu(),
      ),
      appBar: AppBar(
        leading: Center(
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: FaIcon(
                  FontAwesomeIcons.arrowLeft,
                  color: AllColors.mainColor,
                ))),
        title: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
              ),
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(5))),
          child: const TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search product..."),
          ),
        ),
        actions: [
          Builder(
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
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.0),
                border: Border(
                    bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.3), width: 0.8))),
            child: DefaultTabController(
                length: 4,
                child: TabBar(
                  indicatorColor: AllColors.mainColor,
                  labelColor: AllColors.mainColor,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(
                      text: "Popular",
                    ),
                    Tab(
                      text: "Lastest",
                    ),
                    Tab(
                      text: "Top Sales",
                    ),
                    Tab(
                      text: "Price",
                    )
                  ],
                )),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTab ? 3 : 2,
                  childAspectRatio: isTab
                      ? aspt(getProportionateScreenHeight(350))
                      : aspt(getProportionateScreenHeight(260)),
                ),
                itemCount: _homeController.popularProductList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var result = _homeController.popularProductList[
                      (_homeController.popularProductList.length - 1) - index];
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
                            : const BorderSide(color: Colors.grey, width: 0.5),
                        bottom: index ==
                                    _homeController.popularProductList.length -
                                        1 ||
                                index ==
                                    _homeController.popularProductList.length -
                                        2
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
                                    color:
                                        AllColors.mainColor.withOpacity(0.05)),
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
                                  "₺ " + result.sellingPrice.toString() + " ",
                                  style: TextStyle(color: AllColors.mainColor),
                                ),
                                Text(
                                  "₺" + result.regularPrice.toString(),
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
                                    fontSize: getProportionateScreenHeight(10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
