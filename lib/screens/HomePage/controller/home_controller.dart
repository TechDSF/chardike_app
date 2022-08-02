import 'dart:async';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/FlashSaleDetails/flash_model.dart';
import 'package:chardike/screens/FlashSaleDetails/flash_sale_model.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../size_config.dart';
import '../../CategoryPage/model/category_model.dart';

class HomeController extends GetxController {
  late SharedPreferences preferences;
  var perDayDiscountItem = 6.obs;

  var isSliderDataLoading = false.obs;
  List<SliderModel> sliderList = List<SliderModel>.empty(growable: true).obs;
  var dotIndex = 0.obs;
  final navigatorKey = GlobalKey<NavigatorState>();
  late Timer timer;

  ScrollController scrollController = ScrollController();

  ///for banners
  var isBannerLoading = false.obs;
  List<BannerModel> bannerList = List<BannerModel>.empty(growable: true).obs;

  var isFlashProductLoading = false.obs;
  List<FlashSaleModel> allFlashList =
      List<FlashSaleModel>.empty(growable: true).obs;

  List<FlashModel> flashProductList =
      List<FlashModel>.empty(growable: true).obs;

  var isPopularProductLoading = false.obs;
  List<ProductModel> popularProductList =
      List<ProductModel>.empty(growable: true).obs;

  var isLatestProductLoading = false.obs;
  List<ProductModel> latestProductList =
      List<ProductModel>.empty(growable: true).obs;

  var isQueryProductLoading = false.obs;
  List<ProductModel> queryProductList =
      List<ProductModel>.empty(growable: true).obs;

  var isCategoryDataLoading = false.obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;
  var firstCategoryName = "".obs;
  var firstCategoryId = "".obs;

  List<TopLinkModel> topLinkList = List<TopLinkModel>.empty(growable: true).obs;

  @override
  void onInit() {
    getTopLinkData();
    getSliderItem();
    getPopularProduct();
    getLatestProduct();
    getQueryProduct();
    getCategoryProduct();
    getFlashSaleProduct();
    getBannerProduct();
    super.onInit();
  }

  ///for banner product
  getBannerProduct() async {
    isBannerLoading(true);
    var result = await ApiService.fetchBanners();
    if (result.runtimeType == int) {
      isBannerLoading(false);
      print("Banner get error");
    } else {
      isBannerLoading(false);
      bannerList = result;
    }
  }

  getFlashSaleProduct() async {
    isFlashProductLoading(true);
    try {
      var result = await ApiService.getFlashProduct();
      if (result.runtimeType == int) {
        print("Flash get error");
        isFlashProductLoading(false);
      } else {
        List<FlashSaleModel> list = result;
        list.forEach((element) {
          if (element.startTime.isBefore(DateTime.now()) &&
              element.endTime.isAfter(DateTime.now())) {
            allFlashList.add(element);
            element.products.forEach((e) {
              flashProductList.add(FlashModel(
                  discount: element.discount.toInt(), productElement: e));
            });
          }
        });

        print("Flash Length = ${flashProductList.length}");
      }
    } on Exception catch (e) {
      print("Flash get error : ${e.toString()}");
      isFlashProductLoading(false);
    } finally {
      isFlashProductLoading(false);
    }
  }

  changeSearchTypeText() {
    int initIndex = 0;
    Timer.periodic(Duration(seconds: 5), (timer) {
      if (initIndex + 1 == categoryList.length) {
        initIndex = 0;
        firstCategoryName.value = categoryList[initIndex].categoryName;
        firstCategoryId.value = categoryList[initIndex].id.toString();
      } else {
        initIndex = initIndex + 1;
        if (categoryList.isNotEmpty) {
          firstCategoryName.value = categoryList[initIndex].categoryName;
          firstCategoryId.value = categoryList[initIndex].id.toString();
        }
      }
    });
  }

  getPopularProduct() async {
    isPopularProductLoading(true);
    var data = await ApiService.fetchPopularProducts();
    if (data.runtimeType == int) {
      isPopularProductLoading(false);
      Fluttertoast.showToast(msg: "Popular Product fetch error");
    } else {
      popularProductList = data;
      isPopularProductLoading(false);
    }
  }

  getLatestProduct() async {
    isLatestProductLoading(true);
    var data = await ApiService.fetchLatestProducts();
    if (data.runtimeType == int) {
      isLatestProductLoading(false);
      Fluttertoast.showToast(msg: "Latest Product fetch error");
    } else {
      latestProductList = data;
      print("latest product list ${latestProductList.length}");
      isLatestProductLoading(false);
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

  getTopLinkData() {
    var list = [
      TopLinkModel(
          title: "60% OFF Everything", color: Colors.teal.withOpacity(0.3)),
      TopLinkModel(
          title: "All Offers",
          color: Colors.orange.withOpacity(0.3),
          icon: Icon(
            Icons.account_balance,
            color: Colors.deepOrange,
            size: SizeConfig.screenWidth * 0.06,
          )),
      TopLinkModel(
          title: "Top Ranking",
          color: Colors.blue.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.blue,
            size: SizeConfig.screenWidth * 0.06,
          )),
      TopLinkModel(
          title: "Top Brands",
          color: Colors.purpleAccent.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.purpleAccent,
            size: SizeConfig.screenWidth * 0.06,
          )),
      TopLinkModel(
          title: "New Arrival",
          color: Colors.cyanAccent.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.cyanAccent,
            size: SizeConfig.screenWidth * 0.06,
          )),
    ];

    topLinkList = list;
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
      changeSearchTypeText();
      isCategoryDataLoading(false);
    }
  }
}

class TopLinkModel {
  String title;
  Color color;
  Icon? icon;

  TopLinkModel({required this.title, required this.color, this.icon});
}
