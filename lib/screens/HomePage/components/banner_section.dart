import 'package:chardike/screens/HomePage/components/products_of_you_details.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../BannerProducts/banner_products.dart';

class BannerSection extends StatelessWidget {
  BannerSection({Key? key, required this.bannerModel, this.isProductForYou})
      : super(key: key);
  BannerModel? bannerModel;
  bool? isProductForYou;
  bool isTab = SizeConfig.screenWidth > 768;
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (_homeController.isBannerLoading.value) {
        return Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.07),
          highlightColor: Colors.grey.withOpacity(0.2),
          child: Container(
            height: getProportionateScreenHeight(170),
            color: Colors.yellow,
          ),
        );
      } else {
        if (bannerModel == null) {
          return SizedBox();
        } else {
          return InkWell(
            onTap: () {
              if (isProductForYou == true) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => ProductsYouDetails()));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            BannerProducts(bannerModel: bannerModel!)));
              }
            },
            child: Container(
              height: isTab
                  ? getProportionateScreenHeight(250)
                  : getProportionateScreenHeight(150),
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(bannerModel!.bannerImage),
                      fit: BoxFit.fill)),
            ),
          );
        }
      }
    });
  }
}
