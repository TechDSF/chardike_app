import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CategoryPage/category_page.dart';
import 'package:chardike/screens/FlashSaleDetails/screens/flash_sale_details.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/SearchPage/screen/single_search.dart';
import 'package:chardike/screens/SliderDetails/screen/slider_details.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:chardike/screens/WheelPage/screen/wheel_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:slide_countdown/slide_countdown.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  Widget flashDealSectionTitle({required VoidCallback onTap}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Text(
                "Flash Sale",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SlideCountdownSeparated(
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                textStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(10),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(3))),
                duration: Duration(hours: 2, minutes: 29),
              )
            ],
          ),
        ),
        InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: getProportionateScreenWidth(12)),
                children: [
                  TextSpan(text: "See More"),
                  WidgetSpan(
                      child: Center(
                          child: Icon(
                    Icons.arrow_forward_ios,
                    size: getProportionateScreenWidth(14),
                    color: Colors.black.withOpacity(0.5),
                  )))
                ]),
          ),
        )
      ],
    );
  }

  Widget sectionTitle({required String title, required VoidCallback onTap}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: getProportionateScreenWidth(12)),
                children: [
                  TextSpan(text: "See More"),
                  WidgetSpan(
                      child: Center(
                          child: Icon(
                    Icons.arrow_forward_ios,
                    size: getProportionateScreenWidth(14),
                    color: Colors.black.withOpacity(0.5),
                  )))
                ]),
          ),
        )
      ],
    );
  }

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

    return SafeArea(
      child: Scaffold(
        key: _homeController.navigatorKey,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
              [
            SliverAppBar(
              floating: true,
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                        "CHARDIKE",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  CommonData.icon(
                      icon: "asset/icons/notification.png", color: Colors.black),
                  SizedBox(
                    width: getProportionateScreenWidth(10),
                  )
                ],
              ),
            ),
                SliverAppBar(
                  floating: true,
                  pinned: true,
                  title: Padding(
                    padding: EdgeInsets.all(getProportionateScreenHeight(7)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => SingleSearchScreen()));
                      },
                      child: Container(
                          height: getProportionateScreenWidth(45),
                          margin: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10)),
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenHeight(2)
                          ),
                          decoration: BoxDecoration(
                            borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(7)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: <Widget>[
                              CommonData.bottomIcon(
                                  icon: "asset/icons/search_icon.png",
                                  color: Colors.grey),
                              SizedBox(
                                width: getProportionateScreenWidth(10),
                              ),
                              Expanded(
                                child: Text(
                                  "Search your product",
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: getProportionateScreenWidth(13)),
                                  maxLines: 1,
                                ),
                              )
                            ],
                          )),
                    ),
                  ),
                ),
          ],
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ///slider section
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Obx(() {
                    if (_homeController.isSliderDataLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.1),
                        highlightColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          height: getProportionateScreenHeight(170),
                          color: Colors.yellow,
                        ),
                      );
                    } else {
                      return Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: _homeController.sliderList.length,
                            itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) {
                              var result = _homeController.sliderList[itemIndex];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(5)),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => SliderDetails()));
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(result.image),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              onPageChanged: (value, reason) {
                                _homeController.dotIndex.value = value;
                              },
                              height: getProportionateScreenHeight(170),
                              aspectRatio: 16 / 9,
                              viewportFraction: 1.0,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 5),
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.ease,
                              enlargeCenterPage: true,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              width: SizeConfig.screenWidth,
                              child: Center(
                                child: Obx(() => DotsIndicator(
                                      dotsCount:
                                          _homeController.sliderList.length,
                                      position: _homeController.dotIndex.value
                                          .toDouble(),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  ///product type section
                  Obx(() {
                    if (_homeController.isProdctTypeDataLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.1),
                        highlightColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          height: getProportionateScreenHeight(170),
                          color: Colors.yellow,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(150),
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 6 / 7,
                                        mainAxisSpacing:
                                            getProportionateScreenWidth(10),
                                        crossAxisSpacing:
                                            getProportionateScreenHeight(10)),
                                controller: _homeController.scrollController,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    _homeController.productTypeList.length + 1,
                                itemBuilder: (context, index) {
                                  return index ==
                                          _homeController.productTypeList.length
                                      ? const Center(
                                          child: Icon(Icons.more_horiz),
                                        )
                                      : ListTile(
                                          title: Image.asset(
                                            _homeController
                                                .productTypeList[index].image,
                                            height:
                                                getProportionateScreenWidth(35),
                                            width:
                                                getProportionateScreenWidth(30),
                                            fit: BoxFit.contain,
                                          ),
                                          subtitle: Text(
                                            _homeController
                                                .productTypeList[index].type,
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize:
                                                  getProportionateScreenWidth(10),
                                            ),
                                          ),
                                        );
                                }),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          ScrollIndicator(
                            scrollController: _homeController.scrollController,
                            width: 50,
                            height: 5,
                            indicatorWidth: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[300]),
                            indicatorDecoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      );
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  ///banner section
                  Container(
                    height: getProportionateScreenHeight(100),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(10)),
                        image: const DecorationImage(
                            image: AssetImage("asset/images/banner_1.png"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  ///flash deal product
                  flashDealSectionTitle(onTap: () {
                    Navigator.pushNamed(context, FlashSaleDetails.routeName);
                  }),
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
                          height: getProportionateScreenHeight(170),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _homeController.apiProductList.length,
                              itemBuilder: (context, index) {
                                var result =
                                    _homeController.apiProductList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetails.routeName,
                                        arguments:
                                            _homeController.apiProductList[index]);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: getProportionateScreenWidth(5)),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(110),
                                          width: getProportionateScreenWidth(110),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.2)),
                                              borderRadius: BorderRadius.circular(
                                                  getProportionateScreenWidth(7)),
                                            ),
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  getProportionateScreenWidth(7)),
                                              child: Stack(
                                                children: <Widget>[
                                                  Image.network(
                                                    result.featureImage,
                                                    height:
                                                        getProportionateScreenWidth(
                                                            110),
                                                    width:
                                                        getProportionateScreenWidth(
                                                            110),
                                                    fit: BoxFit.fill,
                                                  ),
                                                  Positioned(
                                                      right: 0,
                                                      child: Container(
                                                        height:
                                                            getProportionateScreenWidth(
                                                                20),
                                                        width:
                                                            getProportionateScreenWidth(
                                                                45),
                                                        decoration: BoxDecoration(
                                                            color: Colors.orange,
                                                            borderRadius: BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        getProportionateScreenWidth(
                                                                            10)),
                                                                bottomLeft: Radius
                                                                    .circular(
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
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )),
                                                      ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Expanded(
                                            child: Column(
                                          children: <Widget>[
                                            SizedBox(
                                              width: getProportionateScreenHeight(
                                                  110),
                                              child: LinearPercentIndicator(
                                                lineHeight: 8.0,
                                                percent: double.parse((50 / 100)
                                                    .toStringAsFixed(1)),
                                                progressColor: Colors.orange,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      10),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      getProportionateScreenWidth(
                                                          5)),
                                              child: Text(
                                                "₺ " + result.newPrice.toString(),
                                                style: TextStyle(
                                                    color: AllColors.mainColor),
                                              ),
                                            ),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ))
                                      ],
                                    ),
                                  ),
                                );
                              }));
                    }
                  }),

                  ///related product
                  sectionTitle(title: "Top Product", onTap: () {}),
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
                              itemCount:
                                  _homeController.apiProductList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var result =
                                    _homeController.apiProductList[index];
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
                                              color:
                                                  Colors.grey.withOpacity(0.2))),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Stack(
                                            children: <Widget>[
                                              Image.network(
                                                result.featureImage,
                                                width:
                                                    getProportionateScreenHeight(
                                                        150),
                                                height:
                                                    getProportionateScreenHeight(
                                                        150),
                                                fit: BoxFit.fill,
                                              ),
                                              Positioned(
                                                  child: Container(
                                                height:
                                                    getProportionateScreenWidth(
                                                        30),
                                                width:
                                                    getProportionateScreenWidth(
                                                        25),
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
                                                          getProportionateScreenWidth(
                                                              8),
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              12),
                                                      color: Colors.black),
                                                  maxLines: 2,
                                                ),
                                                Text(
                                                  "16k+ sold",
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              11),
                                                      color: Colors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis),
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

                  ///category section
                  sectionTitle(
                      title: "Category",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => CategoryScreen()));
                      }),
                  Divider(),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Obx(() {
                    if (_homeController.isCategoryDataLoading.value) {
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
                        height: getProportionateScreenHeight(250),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                        aspt(getProportionateScreenWidth(170)),
                                    mainAxisSpacing:
                                        getProportionateScreenWidth(10),
                                    crossAxisSpacing:
                                        getProportionateScreenHeight(10)),
                            scrollDirection: Axis.horizontal,
                            itemCount: _homeController.apiProductList.length,
                            itemBuilder: (context, index) {
                              var result = _homeController.apiProductList[index];
                              return Container(
                                  color: Colors.grey.withOpacity(0.05),
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(child: Image.network(result.featureImage)),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Demo"),
                                      ),
                                    ],
                                  ));
                            }),
                      );
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  ///banner section
                  Container(
                    height: getProportionateScreenHeight(100),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(10)),
                        image: const DecorationImage(
                            image: AssetImage("asset/images/banner2.jpg"),
                            fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),

                  ///Feature product section
                  sectionTitle(title: "Feature Product", onTap: () {}),
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
                          height: getProportionateScreenHeight(170),
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: _homeController.apiProductList.length,
                              itemBuilder: (context, index) {
                                var result =
                                    _homeController.apiProductList[index];
                                return InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, ProductDetails.routeName,
                                        arguments:
                                            _homeController.apiProductList[index]);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        right: getProportionateScreenWidth(7)),
                                    child: SizedBox(
                                      height: getProportionateScreenHeight(170),
                                      width: getProportionateScreenWidth(110),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                      getProportionateScreenWidth(
                                                          7)),
                                                  border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.3))),
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(
                                                    getProportionateScreenWidth(
                                                        7)),
                                                child: Stack(
                                                  children: <Widget>[
                                                    Image.network(
                                                      result.featureImage,
                                                      fit: BoxFit.contain,
                                                    ),
                                                    Positioned(
                                                        height:
                                                            getProportionateScreenWidth(
                                                                20),
                                                        width:
                                                            getProportionateScreenWidth(
                                                                45),
                                                        right: 0,
                                                        child: Container(
                                                          height:
                                                              getProportionateScreenWidth(
                                                                  20),
                                                          width:
                                                              getProportionateScreenWidth(
                                                                  45),
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.orange,
                                                              borderRadius: BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          getProportionateScreenWidth(
                                                                              10)),
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          getProportionateScreenWidth(
                                                                              10)))),
                                                          child: Center(
                                                              child: Text(
                                                            "-10%",
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getProportionateScreenWidth(
                                                                        10),
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height:
                                                getProportionateScreenHeight(10),
                                          ),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(110),
                                            child: Text(
                                              result.name,
                                              maxLines: 2,
                                              textAlign: TextAlign.start,
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          12),
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "₺" + result.newPrice,
                                                  style: TextStyle(
                                                      color: AllColors.mainColor,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              12)),
                                                ),
                                                TextSpan(
                                                  text: " ",
                                                ),
                                                TextSpan(
                                                  text: "₺" + result.oldPrice,
                                                  style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey,
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              10)),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }));
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  ///all product section
                  sectionTitle(title: "Daily Discover", onTap: () {}),
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
                      return GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: getProportionateScreenWidth(5),
                            mainAxisSpacing: getProportionateScreenWidth(5),
                            childAspectRatio: aspt(300),
                          ),
                          itemCount: _homeController.apiProductList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var result = _homeController.apiProductList[
                                (_homeController.apiProductList.length - 1) -
                                    index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetails.routeName,
                                    arguments:
                                        _homeController.apiProductList[index]);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.05)),
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(8)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey
                                                    .withOpacity(0.3))),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.network(
                                              result.featureImage,
                                              fit: BoxFit.fill,
                                            ),
                                            Positioned(
                                                right: 0,
                                                child: Container(
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
                                                    "-10%",
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
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(10),
                                    ),
                                    Text(
                                      result.name,
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenWidth(12)),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Text(
                                      "₺ " + result.newPrice.toString() + " ",
                                      style: TextStyle(
                                          color: AllColors.mainColor,
                                          fontSize:
                                              getProportionateScreenWidth(13)),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Row(
                                      children: [
                                        RatingBarIndicator(
                                          rating: 4.4,
                                          itemBuilder: (context, index) =>
                                              const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize:
                                              getProportionateScreenWidth(10),
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          "(34)",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      10)),
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
              ),
            ),
          ),
        ),
        floatingActionButton: Obx(() {
          if (_homeController.perDayDiscountItem.value > 10) {
            return SizedBox();
          } else {
            return InkWell(
              onTap: () {
                //_homeController.setPerDayDiscount();
                Navigator.pushNamed(context, WheelScreen.routeName);
              },
              child: Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenHeight(50),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("asset/icons/wheel_icon.gif"))),
              ),
            );
          }
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      ),
    );
  }
}
