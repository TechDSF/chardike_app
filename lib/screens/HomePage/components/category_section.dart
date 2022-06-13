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
      children: <Widget>[
        ///category section
        SectionTitle(title: "Category",
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => CategoryScreen()));
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
              height: isTab?getProportionateScreenHeight(200):getProportionateScreenHeight(250),
              child: GridView.builder(
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTab?1:2,
                      childAspectRatio:
                      isTab?aspt(getProportionateScreenHeight(370)):aspt(getProportionateScreenWidth(170)),
                      mainAxisSpacing:
                      getProportionateScreenWidth(10),
                      crossAxisSpacing:
                      getProportionateScreenHeight(10)),
                  scrollDirection: Axis.horizontal,
                  itemCount: _homeController.categoryList.length,
                  itemBuilder: (context, index) {
                    var result = _homeController.categoryList[index];
                    return Container(
                        padding: isTab?EdgeInsets.all(8.0):EdgeInsets.all(0.0),
                        color: Colors.grey.withOpacity(0.05),
                        child: Column(
                          children: <Widget>[
                            Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),child: Image.network(result.image.toString(),fit: BoxFit.fill,)),),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(result.categoryName.toString(),style: TextStyle(fontSize: getProportionateScreenWidth(14)),maxLines: 2,),
                            ),
                          ],
                        ));
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
