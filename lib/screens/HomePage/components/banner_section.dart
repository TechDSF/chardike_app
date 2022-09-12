import 'package:chardike/screens/HomePage/components/all_offers.dart';
import 'package:chardike/screens/HomePage/components/hot_sale_product.dart';
import 'package:chardike/screens/HomePage/components/products_of_you_details.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../BannerProducts/banner_products.dart';
import 'only_you_products_new.dart';

class BannerSection extends StatelessWidget {
  BannerSection({Key? key, required this.bannerModel, this.type})
      : super(key: key);
  BannerModel? bannerModel;
  String? type;
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
              if (type == "ProductForYou") {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => OnlyYouDetails()));
              } else if (type == "NewArrival") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ProductsYouDetails(
                              type: false,
                            )));
              } else if (type == "DontMiss") {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AllOfferProducts(
                              type: "50",
                              bannerModel: bannerModel!,
                            )));
              } else if (type == "TodayHotSale") {
                print("work hot sale");
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => HotSaleProduct()));
              } else {
                print("");
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
