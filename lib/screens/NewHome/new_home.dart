import 'package:chardike/screens/CategoryPage/components/AllProduct.dart';
import 'package:chardike/screens/FeatureProduct/screens/feature_products.dart';
import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/category_section.dart';
import 'package:chardike/screens/HomePage/components/flash_deal_section.dart';
import 'package:chardike/screens/HomePage/components/multi_part_banner.dart';
import 'package:chardike/screens/HomePage/components/slider_widget.dart';
import 'package:chardike/screens/NewHome/components/top_offers.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../HomePage/components/all_product_section.dart';
import '../HomePage/components/feature_product.dart';
import 'controller/new_home_controller.dart';

class NewHome extends StatelessWidget {
  NewHome({Key? key}) : super(key: key);
  final NewHomeController _newHomeController = Get.put(NewHomeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
    ));
    return Scaffold(
      body: SafeArea(
        child: Column(children: <Widget>[
          Column(children: <Widget>[
            Row(
              children: <Widget>[
                Builder(builder: ((context) {
                  return IconButton(
                      onPressed: () {},
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
            Container(
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
                Expanded(
                    child: Center(
                        child: Text(
                  "BodyCare",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(15),
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),
                ))),
                Icon(Icons.search)
              ]),
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
                BannerSection(image: "asset/custom/custom_1.png", onTap: () {}),
                FlashDealSection(),
                FeatureProductSection(),
                SizedBox(
                  height: getProportionateScreenHeight(15),
                ),
                CategorySection(),
                MultiPartBannerSection(
                    bigImage: "asset/custom/custom_2.png",
                    smallImage1: "asset/custom/custom_3.png",
                    smallImage2: "asset/custom/custom_4.png",
                    onTap: () {}),
                AllProductSection()
              ],
            ),
          ))
        ]),
      ),
    );
  }
}
