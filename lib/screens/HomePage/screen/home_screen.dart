import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/components/all_product_section.dart';
import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/category_section.dart';
import 'package:chardike/screens/HomePage/components/feature_product.dart';
import 'package:chardike/screens/HomePage/components/flash_deal_section.dart';
import 'package:chardike/screens/HomePage/components/product_type.dart';
import 'package:chardike/screens/HomePage/components/slider_widget.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/screen/sub_search_screen.dart';
import 'package:chardike/screens/WheelPage/screen/wheel_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/top_product.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final controller = PageController(viewportFraction: 0.8, keepPage: true);


  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;
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
                            fontSize: isTab?getProportionateScreenWidth(25):getProportionateScreenWidth(15),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  CommonData.icon(
                      icon: "asset/icons/notification.png", color: Colors.black , isTab: isTab),
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
                            MaterialPageRoute(builder: (_) => SubSearchScreen()));
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
                                  color: Colors.grey,isTab: isTab),
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SliderWidget(),
                  ProductType(),
                  BannerSection(image: "asset/images/banner_1.png", onTap: (){}),
                  FlashDealSection(),
                  TopProduct(),
                  CategorySection(),
                  BannerSection(image: "asset/images/banner2.jpg", onTap: (){}),
                  FeatureProductSection(),
                  AllProductSection()
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: Obx(() {
          if (_homeController.perDayDiscountItem.value > 10) {
            return const SizedBox();
          } else {
            return InkWell(
              onTap: () {
                //_homeController.setPerDayDiscount();
                Navigator.pushNamed(context, WheelScreen.routeName);
              },
              child: Container(
                height: getProportionateScreenHeight(50),
                width: getProportionateScreenHeight(50),
                decoration: const BoxDecoration(
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
