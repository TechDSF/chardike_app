import 'package:chardike/screens/BannerProducts/banner_products.dart';
import 'package:chardike/screens/HomePage/components/Look_galance.dart';
import 'package:chardike/screens/HomePage/components/all_product_section.dart';
import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/category_section.dart';
import 'package:chardike/screens/HomePage/components/feature_product.dart';
import 'package:chardike/screens/HomePage/components/flash_deal_section.dart';
import 'package:chardike/screens/HomePage/components/slider_widget.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/screen/sub_search_screen.dart';
import 'package:chardike/screens/SideBar/side_bar.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../components/multi_part_banner.dart';
import '../components/top_offers.dart';
import '../components/just_for_you.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      drawer: Container(
          width: SizeConfig.screenWidth * 0.7, child: Drawer(child: SideBar())),
      body: SafeArea(
        child: Column(children: <Widget>[
          Column(children: <Widget>[
            Row(
              children: <Widget>[
                Builder(builder: ((context) {
                  return IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(Icons.menu, color: Colors.black));
                })),
                Expanded(
                    child: Center(
                        child: Image.asset(
                  "asset/icons/appbar_logo.png",
                  height: SizeConfig.screenHeight * 0.035,
                ))),
                SizedBox(
                  width: SizeConfig.screenWidth * 0.1,
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.01,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => SubSearchScreen(
                            id: _homeController.firstCategoryId.value,
                            searchType:
                                _homeController.firstCategoryName.value)));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.screenWidth * 0.04),
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.screenWidth * 0.03,
                    horizontal: SizeConfig.screenWidth * 0.02),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(5))),
                child: Row(children: <Widget>[
                  Expanded(child: Center(child: Obx(() {
                    if (_homeController.firstCategoryName.isEmpty) {
                      return Text(
                        "Search Type",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      );
                    } else {
                      return Text(
                        _homeController.firstCategoryName.value,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15),
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      );
                    }
                  }))),
                  Icon(Icons.search)
                ]),
              ),
            ),
          ]),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SliderWidget(),
                TopOffer(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                BannerSection(
                    image: "",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BannerProducts(
                                  bannerModel: _homeController.bannerList[0])));
                    }),
                FlashDealSection(),
                FeatureProductSection(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                CategorySection(),
                JustForYouSection(),
                MultiPartBannerSection(
                    bigImage: "",
                    smallImage1: "",
                    smallImage2: "",
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BannerProducts(
                                  bannerModel: _homeController.bannerList[0])));
                    }),
                AllProductSection(),
                SizedBox(
                  height: getProportionateScreenHeight(10),
                ),
                LookAtGlance()
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
