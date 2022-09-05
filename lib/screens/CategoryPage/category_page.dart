import 'package:chardike/screens/CategoryPage/components/AllProduct.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../CommonData/common_data.dart';
import '../HomePage/model/product_model.dart';
import '../ProductDetails/product_details.dart';
import '../SearchPage/screen/all_search_products.dart';
import 'model/sub_category_model.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key, required this.slug, required this.id})
      : super(key: key);
  String slug;
  String id;
  final HomeController _homeController = Get.put(HomeController());
  final CategoryController _categoryController = Get.put(CategoryController());
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    print("Category id $id");
    _categoryController.getProductByCategory(categoryId: id);
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

    _categoryController.selectedTab.value = slug;
    _categoryController.getSubCategoryListBySlug(slug: slug);

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
                      padding: EdgeInsets.only(
                          top: getProportionateScreenHeight(10)),
                      color: Colors.grey.withOpacity(0.2),
                      child: ListView.builder(
                          itemCount: _homeController.categoryList.length,
                          itemBuilder: ((context, index) {
                            var result = _homeController.categoryList[index];
                            return InkWell(
                              onTap: () {
                                _categoryController.selectedTab.value =
                                    result.slug;
                                _categoryController.getSubCategoryListBySlug(
                                    slug: result.slug);
                                _categoryController.getProductByCategory(
                                    categoryId: result.id.toString());
                              },
                              child: Padding(
                                padding: EdgeInsets.only(
                                    bottom: getProportionateScreenHeight(20)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    result.image == ""
                                        ? SizedBox(
                                            height:
                                                SizeConfig.screenWidth * 0.07,
                                            width:
                                                SizeConfig.screenWidth * 0.07,
                                          )
                                        : Image.network(
                                            result.image.toString(),
                                            height:
                                                SizeConfig.screenWidth * 0.15,
                                            width:
                                                SizeConfig.screenWidth * 0.15,
                                            fit: BoxFit.fill,
                                          ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Obx(() => Text(
                                          result.categoryName.toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize:
                                                  SizeConfig.screenWidth * 0.03,
                                              color: _categoryController
                                                          .selectedTab.value ==
                                                      result.slug
                                                  ? Colors.red
                                                  : Colors.black,
                                              fontWeight: _categoryController
                                                          .selectedTab.value ==
                                                      result.slug
                                                  ? FontWeight.bold
                                                  : FontWeight.normal),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          }))),
                ),
                Expanded(
                    child: SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Obx((() => gridView(
                            list: _categoryController.skinCareList.value,
                            aspt: isTab
                                ? aspt(getProportionateScreenHeight(200))
                                : aspt(getProportionateScreenHeight(120))))),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.02),
                          child: Obx(() {
                            if (_categoryController
                                .isCategoryProductLoading.value) {
                              return GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: isTab ? 3 : 2,
                                          crossAxisSpacing:
                                              getProportionateScreenWidth(5),
                                          mainAxisSpacing:
                                              getProportionateScreenWidth(5)),
                                  itemBuilder: (context, index) {
                                    return Shimmer.fromColors(
                                      baseColor: Colors.grey.withOpacity(0.1),
                                      highlightColor:
                                          Colors.grey.withOpacity(0.5),
                                      child: Container(
                                        height:
                                            getProportionateScreenHeight(170),
                                        color: Colors.yellow,
                                      ),
                                    );
                                  });
                            } else {
                              if (_categoryController
                                  .categoryProductList.isEmpty) {
                                return SizedBox();
                              } else {
                                return GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing:
                                                getProportionateScreenWidth(5),
                                            mainAxisSpacing:
                                                getProportionateScreenWidth(5),
                                            childAspectRatio:
                                                CommonData.aspactRatio(
                                                    height: isTab
                                                        ? SizeConfig
                                                                .screenWidth *
                                                            0.7
                                                        : SizeConfig
                                                                .screenWidth *
                                                            0.8,
                                                    context: context,
                                                    crossAxisCount: 2,
                                                    crossAxisSpacing: 5)),
                                    itemCount: _categoryController
                                        .categoryProductList.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      ProductModel result = _categoryController
                                          .categoryProductList[index];
                                      var data = CommonData.calculateDiscount(
                                          regularPrice:
                                              double.parse(result.regularPrice),
                                          sellingPrice: double.parse(
                                              result.sellingPrice));

                                      return InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, ProductDetails.routeName,
                                              arguments: {
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
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      SizeConfig.screenWidth *
                                                          0.02),
                                            ),
                                            child: Column(children: <Widget>[
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(1.0),
                                                child: Container(
                                                  height: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.35
                                                      : SizeConfig.screenWidth *
                                                          0.37,
                                                  width: double.infinity,
                                                  padding: EdgeInsets.only(
                                                      top: SizeConfig
                                                              .screenWidth *
                                                          0.015),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(SizeConfig
                                                                .screenWidth *
                                                            0.02),
                                                      ),
                                                      image: DecorationImage(
                                                          image: NetworkImage(
                                                              result
                                                                  .featureImage),
                                                          fit: BoxFit.fill)),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Container(
                                                          padding: EdgeInsets
                                                              .all(SizeConfig
                                                                      .screenWidth *
                                                                  0.004),
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(
                                                                      SizeConfig
                                                                              .screenWidth *
                                                                          0.015),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          SizeConfig.screenWidth *
                                                                              0.015)),
                                                              color:
                                                                  Colors.green),
                                                          child: Text(
                                                            "${data}%",
                                                            //"${result.regularPrice}",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: SizeConfig
                                                                        .screenWidth *
                                                                    0.03),
                                                          ),
                                                        ),
                                                        Row(
                                                          children: [
                                                            Container(
                                                              height: SizeConfig
                                                                      .screenWidth *
                                                                  0.05,
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.05,
                                                              child: Icon(
                                                                Icons.favorite,
                                                                color: Colors
                                                                    .orange,
                                                                size: SizeConfig
                                                                        .screenWidth *
                                                                    0.03,
                                                              ),
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3)),
                                                            ),
                                                            SizedBox(
                                                              width: SizeConfig
                                                                      .screenWidth *
                                                                  0.008,
                                                            ),
                                                          ],
                                                        )
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                height: SizeConfig.screenWidth *
                                                    0.01,
                                              ),
                                              Expanded(
                                                  child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal:
                                                        SizeConfig.screenWidth *
                                                            0.003),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(SizeConfig
                                                                    .screenWidth *
                                                                0.02),
                                                        bottomRight: Radius
                                                            .circular(SizeConfig
                                                                    .screenWidth *
                                                                0.02))),
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: <Widget>[
                                                      Text(
                                                        result.productName,
                                                        maxLines: 2,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.black,
                                                            fontSize: isTab
                                                                ? SizeConfig
                                                                        .screenWidth *
                                                                    0.025
                                                                : SizeConfig
                                                                        .screenWidth *
                                                                    0.03,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis),
                                                      ),
                                                      RichText(
                                                          text: TextSpan(
                                                              children: [
                                                            TextSpan(
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontSize:
                                                                        SizeConfig.screenWidth *
                                                                            0.03),
                                                                text: CommonData
                                                                        .takaSign +
                                                                    result
                                                                        .sellingPrice
                                                                        .toString()),
                                                            TextSpan(
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontSize: SizeConfig
                                                                            .screenWidth *
                                                                        0.022),
                                                                text: " " +
                                                                    CommonData
                                                                        .takaSign +
                                                                    result
                                                                        .regularPrice
                                                                        .toString())
                                                          ])),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          RatingBarIndicator(
                                                            rating: CommonData
                                                                .calculateRating(
                                                                    result
                                                                        .reviews),
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    Icon(
                                                              Icons.star,
                                                              color:
                                                                  Colors.amber,
                                                            ),
                                                            itemCount: 5,
                                                            itemSize: SizeConfig
                                                                    .screenWidth *
                                                                0.03,
                                                            direction:
                                                                Axis.horizontal,
                                                          ),
                                                          Text(
                                                            "(${result.reviews.length})",
                                                            style: TextStyle(
                                                              fontSize: SizeConfig
                                                                      .screenWidth *
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
                            }
                          }),
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            );
          }
        }));
  }

  Widget gridView({required var list, required var aspt}) {
    return GridView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isTab ? 4 : 3, childAspectRatio: aspt),
        itemBuilder: (context, index) {
          SubCategoryModel result = list[index];
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(10)),
            child: ListTile(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (_) => AllSearchProducts(
                //               productList: [],
                //               id: result.id.toString(),
                //               searchType: result.subCategoryName,
                //             )));
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
