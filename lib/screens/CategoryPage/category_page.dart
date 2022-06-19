import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/components/AllProduct.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import 'model/sub_category_model.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  final CategoryController _categoryController = Get.put(CategoryController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;
    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = isTab ? 4 : 3;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
        ),
        body: Obx(() {
          if (_categoryController.isCategoryGetLoading.value ||
              _categoryController.isSubCategoryGetLoading.value) {
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
            return Row(
              children: <Widget>[
                SizedBox(
                  width: SizeConfig.screenWidth * 0.22,
                  child: Container(
                    padding:
                        EdgeInsets.only(top: getProportionateScreenHeight(10)),
                    color: Colors.grey.withOpacity(0.2),
                    child: Obx(() => ListView.builder(
                        itemCount: _categoryController.categoryList.length,
                        itemBuilder: ((context, index) {
                          var result = _categoryController.categoryList[index];
                          return InkWell(
                            onTap: () {
                              _categoryController.selectedTab.value = index;
                              _categoryController.getSubCategoryListById(
                                  id: _categoryController.categoryList[index].id
                                      .toString());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: getProportionateScreenHeight(20)),
                              child: Column(
                                children: <Widget>[
                                  Image.network(
                                    result.image.toString(),
                                    height: SizeConfig.screenWidth * 0.15,
                                    width: SizeConfig.screenWidth * 0.15,
                                    fit: BoxFit.fill,
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                  Obx(() => Text(
                                        result.categoryName.toString(),
                                        style: TextStyle(
                                            fontSize:
                                                SizeConfig.screenWidth * 0.03,
                                            color: _categoryController
                                                        .selectedTab.value ==
                                                    index
                                                ? Colors.red
                                                : Colors.black,
                                            fontWeight: _categoryController
                                                        .selectedTab.value ==
                                                    index
                                                ? FontWeight.bold
                                                : FontWeight.normal),
                                      ))
                                ],
                              ),
                            ),
                          );
                        }))),
                  ),
                ),
                Expanded(
                    child: Obx((() => gridView(
                        list: _categoryController.skinCareList.value,
                        aspt: isTab
                            ? aspt(getProportionateScreenHeight(200))
                            : aspt(getProportionateScreenHeight(120))))))
              ],
            );
          }
        }));
  }

  Widget gridView({required var list, required var aspt}) {
    return GridView.builder(
        itemCount: list.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTab ? 4 : 3, childAspectRatio: aspt),
        itemBuilder: (context, index) {
          SubCategoryModel result = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10)),
            child: ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AllProduct(
                              type: result.subCategoryName,
                            )));
              },
              title: Image.network(
                result.image.toString(),
                fit: BoxFit.fill,
                height: isTab
                    ? getProportionateScreenHeight(80)
                    : getProportionateScreenHeight(40),
                width: isTab
                    ? getProportionateScreenHeight(80)
                    : getProportionateScreenHeight(40),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: getProportionateScreenHeight(3)),
                child: Text(
                  result.subCategoryName.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: isTab
                          ? getProportionateScreenHeight(16)
                          : getProportionateScreenHeight(13)),
                ),
              ),
            ),
          );
        });
  }
}
