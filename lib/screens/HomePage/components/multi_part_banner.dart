import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../BannerProducts/banner_products.dart';

class MultiPartBannerSection extends StatelessWidget {
  MultiPartBannerSection({Key? key}) : super(key: key);
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
        if (_homeController.squreBanner == null ||
            _homeController.sideBanner1 == null ||
            _homeController.sideBanner2 == null) {
          return SizedBox();
        } else {
          return Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
            child: Column(
              children: <Widget>[
                ///banner section
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => BannerProducts(
                                      bannerModel:
                                          _homeController.squreBanner!)));
                        },
                        child: Container(
                          height: SizeConfig.screenHeight * 0.24,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(10)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      _homeController.squreBanner!.bannerImage),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.005,
                    ),
                    Expanded(
                        child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BannerProducts(
                                        bannerModel:
                                            _homeController.sideBanner1!)));
                          },
                          child: Container(
                            height: SizeConfig.screenHeight * 0.12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(7)),
                                image: DecorationImage(
                                    image: NetworkImage(_homeController
                                        .sideBanner1!.bannerImage),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(2),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BannerProducts(
                                        bannerModel:
                                            _homeController.sideBanner2!)));
                          },
                          child: Container(
                            height: SizeConfig.screenHeight * 0.12,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(7)),
                                image: DecorationImage(
                                    image: NetworkImage(_homeController
                                        .sideBanner2!.bannerImage),
                                    fit: BoxFit.fill)),
                          ),
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
      }
    });
  }
}
