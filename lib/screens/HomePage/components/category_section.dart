import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../CategoryPage/category_page.dart';
import '../controller/home_controller.dart';

class CategorySection extends StatelessWidget {
  CategorySection({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());
  final CategoryController _categoryController = Get.put(CategoryController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;
    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ///category section
          SectionTitle(
              title: "Category",
              buttonText: "View All",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                              slug: _homeController.categoryList[0].slug,
                            )));
              }),

          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          Obx(() {
            if (_homeController.isCategoryDataLoading.value) {
              return Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(0.1),
                highlightColor: Colors.grey.withOpacity(0.5),
                child: Container(
                  height: getProportionateScreenHeight(170),
                  color: Colors.yellow,
                ),
              );
            } else {
              return SizedBox(
                height: SizeConfig.screenWidth * 0.5,
                child: GridView.builder(
                    itemCount: _homeController.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: SizeConfig.screenWidth * 0.015,
                        crossAxisSpacing: SizeConfig.screenWidth * 0.015),
                    itemBuilder: ((context, index) {
                      var result = _homeController.categoryList[index];
                      return Obx(() => InkWell(
                            onTap: () {
                              _categoryController.selectedCategoryItem.value =
                                  index;

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => CategoryScreen(
                                            slug: result.slug,
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: _categoryController
                                              .selectedCategoryItem.value ==
                                          index
                                      ? Color(0xFFFF3366)
                                      : Color(0xFFFF3366),
                                  //: Color(0xFFF3F5F8),
                                  borderRadius: BorderRadius.circular(
                                      SizeConfig.screenWidth * 0.015)),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    result.image != ""
                                        ? Expanded(
                                            flex: 2,
                                            child: Obx((() => Image.network(
                                                  result.image,
                                                  color: _categoryController
                                                              .selectedCategoryItem
                                                              .value ==
                                                          index
                                                      ? Colors.white
                                                      : Colors.white,
                                                  //: Colors.black,
                                                  height:
                                                      SizeConfig.screenWidth *
                                                          0.13,
                                                  width:
                                                      SizeConfig.screenWidth *
                                                          0.13,
                                                ))),
                                          )
                                        : SizedBox(),
                                    Expanded(
                                        flex: 1,
                                        child: result.image == ""
                                            ? Center(
                                                child: Obx(() => Text(
                                                      result.categoryName,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: _categoryController
                                                                      .selectedCategoryItem
                                                                      .value ==
                                                                  index
                                                              ? Colors.white
                                                              //: Colors.black,
                                                              : Colors.white,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: SizeConfig
                                                                  .screenWidth *
                                                              0.03),
                                                    )))
                                            : Obx(() => Text(
                                                  result.categoryName,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: _categoryController
                                                                  .selectedCategoryItem
                                                                  .value ==
                                                              index
                                                          ? Colors.white
                                                          : Colors.white,
                                                      //: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.03),
                                                )))
                                  ]),
                            ),
                          ));
                    })),
              );
            }
          }),
          SizedBox(
            height: getProportionateScreenHeight(5),
          ),
        ],
      ),
    );
  }
}
