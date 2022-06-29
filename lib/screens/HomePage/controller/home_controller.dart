import 'dart:async';

import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:chardike/screens/SearchPage/model/search_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../size_config.dart';
import '../../CategoryPage/controller/category_controller.dart';
import '../../CategoryPage/model/category_model.dart';

class HomeController extends GetxController {
  late SharedPreferences preferences;
  var perDayDiscountItem = 6.obs;

  var isSliderDataLoading = false.obs;
  List<SliderModel> sliderList = List<SliderModel>.empty(growable: true).obs;
  var dotIndex = 0.obs;
  final navigatorKey = GlobalKey<NavigatorState>();
  late Timer timer;

  var isProdctTypeDataLoading = false.obs;
  List<ProductType> productTypeList =
      List<ProductType>.empty(growable: true).obs;
  ScrollController scrollController = ScrollController();

  //
  // var isProductDataLoading =false.obs;
  // List<ProductModel> productList = List<ProductModel>.empty(growable:true).obs;

  var isApiProductLoading = false.obs;
  List<ProductModel> allProductList =
      List<ProductModel>.empty(growable: true).obs;

  var isQueryProductLoading = false.obs;
  List<QueryProductModel> queryProductList =
      List<QueryProductModel>.empty(growable: true).obs;

  var isCategoryDataLoading = false.obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getSliderItem();
    getProductType();
    getApiProduct();
    checkYourDiscount();
    //openDiscountBanner();
    getQueryProduct();
    getCategoryProduct();
    super.onInit();
  }

  checkYourDiscount() async {
    preferences = await SharedPreferences.getInstance();
    int date = preferences.getInt("discount") ?? 100;
    if (date == 100) {
      preferences.setInt("discount", DateTime.now().day);
      preferences.setInt("totalDiscount", 0);
      perDayDiscountItem.value = 0;
    } else if (date == DateTime.now().day) {
      perDayDiscountItem.value = preferences.getInt("totalDiscount")!;
    } else if (date != DateTime.now().day) {
      preferences.setInt("discount", DateTime.now().day);
      preferences.setInt("totalDiscount", 0);
      perDayDiscountItem.value = 0;
    }
  }

  setPerDayDiscount() async {
    preferences = await SharedPreferences.getInstance();
    perDayDiscountItem.value = perDayDiscountItem.value + 1;
    preferences.setInt("totalDiscount", perDayDiscountItem.value);
  }

  openDiscountBanner() async {
    Future.delayed(Duration(seconds: 5), () {
      showGeneralDialog(
        context: navigatorKey.currentContext!,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return Center(
            child: Container(
              height: SizeConfig.screenHeight / 2.5,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenHeight(40),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              Navigator.pop(navigatorKey.currentContext!);
                            },
                            child: Icon(
                              Icons.clear,
                              size: getProportionateScreenHeight(20),
                            )),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Expanded(
                      child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(10)),
                        image: DecorationImage(
                            image: AssetImage(
                                "asset/images/supar_sale_discount_image.png"))),
                  ))
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(40)),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: Offset(0, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: Offset(0, 0), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        },
      );
    });
  }

  getApiProduct() async {
    isApiProductLoading(true);
    var data = await ApiService.fetchProducts();
    if (data.runtimeType == int) {
      isApiProductLoading(false);
      Fluttertoast.showToast(msg: "Product fetch error");
    } else {
      allProductList = data;
      isApiProductLoading(false);
    }
  }

  getSliderItem() async {
    isSliderDataLoading(true);
    var result = await ApiService.fetchSliderData();
    if (result.runtimeType == int) {
      isSliderDataLoading(false);
      print("Slider data get error 0!");
    } else if (result.runtimeType == List<SliderModel>) {
      List<SliderModel> list = result;
      list.sort(((a, b) => a.position.compareTo(b.position)));
      sliderList = list;
      isSliderDataLoading(false);
    } else {
      isSliderDataLoading(false);
      print("Slider data get error!");
    }
    isSliderDataLoading(false);
  }

  getProductType() {
    isProdctTypeDataLoading(true);
    var list = [
      ProductType(type: "Moedas Shopee", image: "asset/images/dollar_beg.png"),
      ProductType(type: "Frete Gratis", image: "asset/images/shopping_beg.png"),
      ProductType(
          type: "Shopee Official", image: "asset/images/free_delivery.png"),
      ProductType(type: "Moedas Shopee", image: "asset/images/dollar_beg.png"),
      ProductType(
          type: "Frete Gratis", image: "asset/images/free_delivery.png"),
      ProductType(
          type: "Cupons Diarios", image: "asset/images/shopping_beg.png"),
      ProductType(type: "Cupons Diarios", image: "asset/images/dollar_beg.png"),
      ProductType(type: "Frete Gratis", image: "asset/images/shopping_beg.png"),
      ProductType(
          type: "Shopee Official", image: "asset/images/free_delivery.png"),
      ProductType(type: "Frete Gratis", image: "asset/images/dollar_beg.png"),
      ProductType(
          type: "Cupons Diarios", image: "asset/images/free_delivery.png"),
      ProductType(
          type: "Cupons Diarios", image: "asset/images/shopping_beg.png"),
      ProductType(type: "Cupons Diarios", image: "asset/images/dollar_beg.png"),
    ];

    productTypeList = list;
    isProdctTypeDataLoading(false);
  }

  getQueryProduct() async {
    isQueryProductLoading(true);
    var data = await ApiService.fetchQueryProducts();
    if (data.runtimeType == int) {
      isQueryProductLoading(false);
      Fluttertoast.showToast(msg: "Query Product fetch error");
    } else {
      queryProductList = data;
      isQueryProductLoading(false);
    }
  }

  getCategoryProduct() async {
    isCategoryDataLoading(true);
    var data = await ApiService.fetchCategories();
    if (data.runtimeType == int) {
      isCategoryDataLoading(false);
      Fluttertoast.showToast(msg: "Category fetch Error");
    } else {
      categoryList = data;
      isCategoryDataLoading(false);
    }
  }

  double calculateRating(List<Review> list) {
    double rating = 0;
    if (list.isEmpty) {
      return 0;
    } else {
      list.forEach((element) {
        rating = rating + element.starCount.toDouble();
      });
      return rating / list.length;
    }
  }
}

class ProductType {
  String type;
  String image;

  ProductType({required this.type, required this.image});
}
