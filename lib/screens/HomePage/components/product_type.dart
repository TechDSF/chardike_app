import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../controller/home_controller.dart';

class ProductType extends StatelessWidget {
  ProductType({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ///product type section
        Obx(() {
          if (_homeController.isProdctTypeDataLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: isTab?getProportionateScreenHeight(200):getProportionateScreenHeight(150),
                  child: GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 6 / 7,
                          mainAxisSpacing:
                          getProportionateScreenWidth(10),
                          crossAxisSpacing:
                          getProportionateScreenHeight(10)),
                      controller: _homeController.scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount:
                      _homeController.productTypeList.length + 1,
                      itemBuilder: (context, index) {
                        return index ==
                            _homeController.productTypeList.length
                            ? const Center(
                          child: Icon(Icons.more_horiz),
                        )
                            : ListTile(
                          title: Image.asset(
                            _homeController
                                .productTypeList[index].image,
                            height: isTab?getProportionateScreenWidth(50):getProportionateScreenWidth(35),
                            width:
                            isTab?getProportionateScreenWidth(40):getProportionateScreenWidth(30),
                            fit: BoxFit.contain,
                          ),
                          subtitle: Text(
                            _homeController
                                .productTypeList[index].type,
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize:
                              isTab?getProportionateScreenWidth(13):getProportionateScreenWidth(10),
                            ),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(5),
                ),
                ScrollIndicator(
                  scrollController: _homeController.scrollController,
                  width: 50,
                  height: 5,
                  indicatorWidth: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300]),
                  indicatorDecoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                ),
              ],
            );
          }
        }),
        SizedBox(
          height: getProportionateScreenHeight(10),
        ),
      ],
    );
  }
}
