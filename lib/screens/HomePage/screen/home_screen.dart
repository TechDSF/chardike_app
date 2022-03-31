import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CategoryPage/category_page.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/SearchPage/screen/single_search.dart';
import 'package:chardike/size_config.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
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

  Widget flashDealSectionTitle() {
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
        Text(
          "Shop More >",
          style: TextStyle(color: AllColors.mainColor),
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
          child: Text(
            "Shop More >",
            style: TextStyle(color: AllColors.mainColor),
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
        body: NestedScrollView(
          headerSliverBuilder:
              (BuildContext context, bool innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              toolbarHeight: getProportionateScreenHeight(100),
                title: Column(
              children: <Widget>[
                Row(
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
                    const FaIcon(FontAwesomeIcons.bell,color: Colors.black,),
                    SizedBox(width: getProportionateScreenWidth(5),)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10),),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>SingleSearchScreen()));
                  },
                  child: Container(
                    height: getProportionateScreenHeight(50),
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10),),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(7)),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.search,
                            color: Colors.grey,
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(
                            child: Text(
                              "Search your product",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: getProportionateScreenWidth(14)),
                              maxLines: 1,
                            ),
                          )
                        ],
                      )),
                ),
              ],
            ),
            ),
          ],
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
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
                              var result =
                                  _homeController.sliderList[itemIndex];
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(5)),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(result.image),
                                          fit: BoxFit.cover)),
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
                                                  getProportionateScreenWidth(
                                                      10),
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
                  flashDealSectionTitle(),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
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
                      return SizedBox(
                        height: getProportionateScreenHeight(170),
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1,
                                    childAspectRatio:
                                        getProportionateScreenWidth(3) /
                                            getProportionateScreenWidth(2),
                                    mainAxisSpacing:
                                        getProportionateScreenWidth(5),
                                    crossAxisSpacing:
                                        getProportionateScreenHeight(5)),
                            scrollDirection: Axis.horizontal,
                            itemCount: _homeController.flashSaleList.length,
                            itemBuilder: (context, index) {
                              var result = _homeController.flashSaleList[index];
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(productModel: result)));
                                },
                                child: Column(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(7)),
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset(
                                            result.image[0],
                                            height:
                                                getProportionateScreenWidth(110),
                                            width:
                                                getProportionateScreenWidth(110),
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
                                                  "-${result.discount}%",
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
                                      children: <Widget>[
                                        LinearPercentIndicator(
                                          lineHeight: 8.0,
                                          percent: double.parse(
                                              (result.totalSold / 100)
                                                  .toStringAsFixed(1)),
                                          progressColor: Colors.orange,
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenHeight(10),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  getProportionateScreenWidth(5)),
                                          child: Text(
                                            "₺ " + result.price.toString(),
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
                              );
                            }),
                      );
                    }
                  }),

                  ///category section
                  sectionTitle(title: "Category",onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>CategoryScreen()));
                  }),
                  SizedBox(height: getProportionateScreenHeight(10),),
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
                                childAspectRatio: aspt(getProportionateScreenWidth(170)) ,
                                mainAxisSpacing:
                                getProportionateScreenWidth(10),
                                crossAxisSpacing:
                                getProportionateScreenHeight(10)),
                            scrollDirection: Axis.horizontal,
                            itemCount:
                            _homeController.categoryList.length,
                            itemBuilder: (context, index) {
                              var result = _homeController.categoryList[index];
                              return Container(
                                color: Colors.grey.withOpacity(0.05),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(child: Image.asset(result.image)),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(result.type),
                                    ),
                                  ],
                                )
                              );
                            }),
                      );
                    }
                  }),
                  SizedBox(height: getProportionateScreenHeight(10),),

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

                  ///top product section
                  sectionTitle(title: "Top Product",onTap: (){}),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Obx(() {
                    if (_homeController.isProductDataLoading.value) {
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
                        child: GridView.builder(
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio:
                                getProportionateScreenWidth(3) /
                                    getProportionateScreenWidth(2),
                                mainAxisSpacing:
                                getProportionateScreenWidth(5),
                                crossAxisSpacing:
                                getProportionateScreenHeight(5)),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              var result = _homeController.productList[index];
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(productModel: result)));
                                },
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(7)),
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              result.image[0],
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
                                                        "-${result.discount}%",
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
                                    Text(result.title,maxLines: 2,textAlign: TextAlign.start,style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12)
                                    ),),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                          getProportionateScreenWidth(5),vertical: getProportionateScreenWidth(5)),
                                      child: Row(
                                        children: [
                                          Text(
                                            "₺ " + result.price.toString()+" ",
                                            style: TextStyle(
                                                color: AllColors.mainColor),
                                          ),
                                          Text(
                                            "₺" + result.price.toString(),
                                            style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,fontSize: getProportionateScreenWidth(10)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      );
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),

                  ///all product section
                  sectionTitle(title: "Daily Discover",onTap: (){

                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Obx(() {
                    if (_homeController.isProductDataLoading.value) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.1),
                        highlightColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          height: getProportionateScreenHeight(170),
                          color: Colors.yellow,
                        ),
                      );
                    }
                    else {
                      return GridView.builder(
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: aspt(300),
                              ),
                          itemCount: _homeController.productList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var result = _homeController.productList[(_homeController.productList.length-1) - index];
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(productModel: result)));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: const BorderSide(color: Colors.grey,width: 0.5),
                                    left: index%2==0?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                                    right: index%2==0?const BorderSide(color: Colors.grey,width: 0):const BorderSide(color: Colors.grey,width: 0.5),
                                    bottom: index == _homeController.productList.length-1 || index == _homeController.productList.length-2?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                                    )
                                ),
                                padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Stack(
                                        children: <Widget>[
                                          Image.asset(
                                            result.image[0],
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
                                                      "-${result.discount}%",
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
                                    Text(result.title,maxLines: 2,textAlign: TextAlign.start,style: TextStyle(
                                        fontSize: getProportionateScreenWidth(12)
                                    ),),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                          getProportionateScreenWidth(5)),
                                      child: Row(
                                        children: [
                                          Text(
                                            "₺ " + result.price.toString()+" ",
                                            style: TextStyle(
                                                color: AllColors.mainColor),
                                          ),
                                          Text(
                                            "₺" + result.price.toString(),
                                            style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                color: Colors.grey,fontSize: getProportionateScreenWidth(10)),
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
                                          rating: result.rating,
                                          itemBuilder: (context, index) => const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize: getProportionateScreenWidth(10),
                                          direction: Axis.horizontal,
                                        ),
                                        Text("(${result.totalRating})",style: TextStyle(
                                          fontSize: getProportionateScreenWidth(10)
                                        ),)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
