import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/products_of_you_details.dart';
import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';
import '../../BannerProducts/banner_products.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/home_controller.dart';
import '../model/product_model.dart';

class JustForYouSection extends StatelessWidget {
  JustForYouSection({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///all product section
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
          child: Column(
            children: [
              SectionTitle(
                  title: "Products For You",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => ProductsYouDetails()));
                  }),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Obx(() {
                if (_homeController.isBannerLoading.value) {
                  return SizedBox();
                } else {
                  if (_homeController.bannerList.length < 2) {
                    return SizedBox();
                  } else {
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getProportionateScreenWidth(5)),
                      child: BannerSection(
                          image: "",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => BannerProducts(
                                        bannerModel: _homeController.banner2)));
                          }),
                    );
                  }
                }
              }),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Obx(() {
                if (_homeController.isLatestProductLoading.value) {
                  return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: isTab ? 4 : 3,
                          crossAxisSpacing: getProportionateScreenWidth(5),
                          mainAxisSpacing: getProportionateScreenWidth(5)),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Container(
                            height: getProportionateScreenHeight(170),
                            color: Colors.yellow,
                          ),
                        );
                      });
                } else {
                  return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: getProportionateScreenWidth(5),
                          mainAxisSpacing: getProportionateScreenWidth(5),
                          childAspectRatio: CommonData.aspactRatio(
                              height: isTab
                                  ? SizeConfig.screenWidth * 0.6
                                  : SizeConfig.screenWidth * 0.7,
                              context: context,
                              crossAxisCount: 2,
                              crossAxisSpacing: 5)),
                      itemCount: _homeController.latestProductList.length > 4
                          ? 4
                          : _homeController.latestProductList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        ProductModel result =
                            _homeController.latestProductList[index];
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, ProductDetails.routeName, arguments: {
                              "type": true,
                              "ds": "0",
                              "product": result
                            });
                          },
                          child: SizedBox(
                            height: SizeConfig.screenWidth * 0.5,
                            width: SizeConfig.screenWidth * 0.32,
                            child: Card(
                              color: Color(0xFFF3F5F8),
                              shadowColor: Colors.grey,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    SizeConfig.screenWidth * 0.02),
                              ),
                              child: Column(children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Container(
                                    height: isTab
                                        ? SizeConfig.screenWidth * 0.4
                                        : SizeConfig.screenWidth * 0.43,
                                    width: double.infinity,
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.screenWidth * 0.015),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                              SizeConfig.screenWidth * 0.02),
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                result.featureImage),
                                            fit: BoxFit.fill)),
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            padding: EdgeInsets.all(
                                                SizeConfig.screenWidth * 0.004),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(
                                                        SizeConfig.screenWidth *
                                                            0.015),
                                                    bottomRight: Radius
                                                        .circular(SizeConfig
                                                                .screenWidth *
                                                            0.015)),
                                                color: Colors.green),
                                            child: Text(
                                              "${CommonData.calculateDiscount(regularPrice: double.parse(result.regularPrice), sellingPrice: double.parse(result.sellingPrice))}%",
                                              //"${result.regularPrice}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.023),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: SizeConfig.screenWidth *
                                                    0.05,
                                                width: SizeConfig.screenWidth *
                                                    0.05,
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: Colors.orange,
                                                  size: SizeConfig.screenWidth *
                                                      0.03,
                                                ),
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.grey
                                                        .withOpacity(0.3)),
                                              ),
                                              SizedBox(
                                                width: SizeConfig.screenWidth *
                                                    0.008,
                                              ),
                                            ],
                                          )
                                        ]),
                                  ),
                                ),
                                SizedBox(
                                  height: SizeConfig.screenWidth * 0.01,
                                ),
                                Expanded(
                                    child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.003),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              SizeConfig.screenWidth * 0.02),
                                          bottomRight: Radius.circular(
                                              SizeConfig.screenWidth * 0.02))),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Text(
                                          result.productName,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: isTab
                                                  ? SizeConfig.screenWidth *
                                                      0.025
                                                  : SizeConfig.screenWidth *
                                                      0.03,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                        RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.03),
                                              text: "₺" +
                                                  result.sellingPrice
                                                      .toString()),
                                          TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600,
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontSize:
                                                      SizeConfig.screenWidth *
                                                          0.022),
                                              text: " ₺" +
                                                  result.regularPrice
                                                      .toString())
                                        ])),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            RatingBar.builder(
                                              initialRating:
                                                  CommonData.calculateRating(
                                                      result.reviews),
                                              minRating: 1,
                                              direction: Axis.horizontal,
                                              allowHalfRating: true,
                                              itemCount: 5,
                                              itemSize:
                                                  SizeConfig.screenWidth * 0.03,
                                              itemPadding: EdgeInsets.symmetric(
                                                  horizontal: 1.0),
                                              itemBuilder: (context, _) => Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              onRatingUpdate: (rating) {
                                                print(rating);
                                              },
                                            ),
                                            Text(
                                              "(${result.reviews.length})",
                                              style: TextStyle(
                                                fontSize:
                                                    SizeConfig.screenWidth *
                                                        0.03,
                                              ),
                                            )
                                          ],
                                        ),
                                      ]),
                                ))
                              ]),
                            ),
                          ),
                        );
                      });
                }
              }),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
