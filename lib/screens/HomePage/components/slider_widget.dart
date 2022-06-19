import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../SliderDetails/screen/slider_details.dart';
import '../controller/home_controller.dart';

class SliderWidget extends StatelessWidget {
  SliderWidget({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Obx(() {
          if (_homeController.isSliderDataLoading.value) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.5),
              child: Container(
                height: getProportionateScreenHeight(170),
                color: Colors.yellow,
              ),
            );
          } else {
            return Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: _homeController.sliderList.length,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    var result = _homeController.sliderList[itemIndex];
                    return ClipRRect(
                      borderRadius:
                          BorderRadius.circular(getProportionateScreenWidth(5)),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => SliderDetails()));
                        },
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(result.sliderImage),
                                  fit: BoxFit.fill)),
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    onPageChanged: (value, reason) {
                      _homeController.dotIndex.value = value;
                    },
                    height: isTab
                        ? getProportionateScreenHeight(280)
                        : getProportionateScreenHeight(200),
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 5),
                    autoPlayAnimationDuration: Duration(milliseconds: 1000),
                    autoPlayCurve: Curves.ease,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: SizeConfig.screenWidth,
                    child: Center(
                      child: Obx(() => DotsIndicator(
                            dotsCount: _homeController.sliderList.length,
                            position: _homeController.dotIndex.value.toDouble(),
                          )),
                    ),
                  ),
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
