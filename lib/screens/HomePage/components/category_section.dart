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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ///category section
        SectionTitle(
            title: "Category",
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CategoryScreen()));
            }),
        Divider(),
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
              height: getProportionateScreenHeight(120),
              child: ListView.builder(
                  itemCount: _homeController.categoryList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var result = _homeController.categoryList[index];
                    return InkWell(
                      onTap: () {
                        _categoryController.selectedTab.value = index;
                        _categoryController.getSubCategoryListById(
                            id: result.id.toString());
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => CategoryScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: getProportionateScreenWidth(70),
                              width: getProportionateScreenWidth(70),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenHeight(5)),
                                  image: DecorationImage(
                                      image: NetworkImage(result.image),
                                      fit: BoxFit.fill)),
                            ),
                            Expanded(
                                child: Center(
                                    child: Text(
                              result.categoryName,
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12)),
                            )))
                          ],
                        ),
                      ),
                    );
                  }),
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
