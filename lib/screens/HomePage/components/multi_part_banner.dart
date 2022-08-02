import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';

class MultiPartBannerSection extends StatelessWidget {
  MultiPartBannerSection(
      {Key? key,
      required this.bigImage,
      required this.smallImage1,
      required this.smallImage2,
      required this.onTap})
      : super(key: key);
  String bigImage, smallImage1, smallImage2;
  VoidCallback onTap;
  bool isTab = SizeConfig.screenWidth > 768;
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
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
          child: Column(
            children: <Widget>[
              ///banner section
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: SizeConfig.screenHeight * 0.24,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(10)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  _homeController.bannerList[0].bannerImage),
                              fit: BoxFit.fill)),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.005,
                  ),
                  Expanded(
                      child: Column(
                    children: <Widget>[
                      Container(
                        height: SizeConfig.screenHeight * 0.12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(7)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    _homeController.bannerList[0].bannerImage),
                                fit: BoxFit.fill)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(2),
                      ),
                      Container(
                        height: SizeConfig.screenHeight * 0.12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(7)),
                            image: DecorationImage(
                                image: NetworkImage(
                                    _homeController.bannerList[0].bannerImage),
                                fit: BoxFit.fill)),
                      ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
            ],
          ),
        );
      }
    });
  }
}
