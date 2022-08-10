import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LookAtGlance extends StatelessWidget {
  LookAtGlance({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_homeController.isBannerLoading.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.1),
          highlightColor: Colors.grey.withOpacity(0.5),
          child: Container(
            height: getProportionateScreenHeight(170),
            color: Colors.yellow,
          ),
        );
      } else {
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.01),
          child: Column(
            children: <Widget>[
              _homeController.newArrivalsBanner == null &&
                      _homeController.dontMissBanner == null &&
                      _homeController.todayHotSaleBanner == null
                  ? SizedBox()
                  : Text(
                      "Look at a Glance",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: SizeConfig.screenWidth * 0.05),
                    ),
              _homeController.newArrivalsBanner == null
                  ? SizedBox()
                  : SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
              _homeController.newArrivalsBanner == null
                  ? SizedBox()
                  : Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth * 0.01),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * 0.01),
                          child: BannerSection(
                            bannerModel: _homeController.newArrivalsBanner,
                          )),
                    ),
              _homeController.dontMissBanner == null
                  ? SizedBox()
                  : SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
              _homeController.dontMissBanner == null
                  ? SizedBox()
                  : Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth * 0.01),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * 0.01),
                          child: BannerSection(
                            bannerModel: _homeController.dontMissBanner,
                          )),
                    ),
              _homeController.todayHotSaleBanner == null
                  ? SizedBox()
                  : SizedBox(
                      height: SizeConfig.screenHeight * 0.01,
                    ),
              _homeController.todayHotSaleBanner == null
                  ? SizedBox()
                  : Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth * 0.01),
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                              SizeConfig.screenWidth * 0.01),
                          child: BannerSection(
                            bannerModel: _homeController.todayHotSaleBanner,
                          )),
                    ),
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
            ],
          ),
        );
      }
    });
  }
}
