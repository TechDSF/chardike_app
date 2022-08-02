import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';

class BannerSection extends StatelessWidget {
  BannerSection({Key? key, required this.image, required this.onTap})
      : super(key: key);
  String image;
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
        return InkWell(
          onTap: onTap,
          child: Container(
            height: isTab
                ? getProportionateScreenHeight(250)
                : getProportionateScreenHeight(150),
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        NetworkImage(_homeController.bannerList[0].bannerImage),
                    fit: BoxFit.fill)),
          ),
        );
      }
    });
  }
}
