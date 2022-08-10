import 'dart:async';
import 'dart:math';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/FlashSaleDetails/flash_sale_model.dart';
import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:chardike/screens/HomePage/model/discount_product_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  BannerModel? customOfferBanner;
  BannerModel? onlyForYouBanner;
  BannerModel? squreBanner;
  BannerModel? sideBanner1;
  BannerModel? sideBanner2;
  BannerModel? newArrivalsBanner;
  BannerModel? dontMissBanner;
  BannerModel? todayHotSaleBanner;

  var isFlashProductLoading = false.obs;
  List<FlashSaleModel> allFlashList =
      List<FlashSaleModel>.empty(growable: true).obs;
  List<FlashProduct> flashProductList =
      List<FlashProduct>.empty(growable: true).obs;

  var isTopProductLoading = false.obs;
  List<ProductModel> topProductList =
      List<ProductModel>.empty(growable: true).obs;

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

  var isDiscountDataLoading = false.obs;
  List<DiscountProductModel> discountProductList =
      List<DiscountProductModel>.empty(growable: true).obs;
  List<DiscountProductModel> sixtyDiscountProductList =
      List<DiscountProductModel>.empty(growable: true).obs;

  @override
  void onInit() {
    getTopLinkData();
    getSliderItem();
    getPopularProduct();
    getTopSaleProduct();
    getLatestProduct();
    getQueryProduct();
    getCategoryProduct();
    getFlashSaleProduct();
    getBannerProduct();
    super.onInit();
  }

  ///discount products
  getDiscountProducts() async {
    isDiscountDataLoading(true);
    try {
      var result = await ApiService.getDiscountProduct();
      if (result.runtimeType == int) {
        print("Error to get Discount Product");
        isDiscountDataLoading(false);
      } else {
        discountProductList = result;
        sixtyDiscountProductList.clear();
        discountProductList.forEach((element) {
          if (element.discount >= 60) {
            sixtyDiscountProductList.add(element);
          }
        });
      }
    } on Exception catch (e) {
      // TODO
      print("Error to get Discount Product");
      isDiscountDataLoading(false);
    } finally {
      isDiscountDataLoading(false);
    }
  }

  ///get top sale product
  getTopSaleProduct() async {
    isTopProductLoading(true);
    try {
      var result = await ApiService.fetchTopSaleProducts();
      if (result.runtimeType == int) {
        isTopProductLoading(false);
        print("Top Sale Product fetch Error");
      } else {
        topProductList = result;
        isTopProductLoading(false);
      }
    } on Exception catch (e) {
      isTopProductLoading(false);
      print("Error top sale = $e");
    }
  }

  ///for banner product
  getBannerProduct() async {
    isBannerLoading(true);
    try {
      var result = await ApiService.fetchBanners();
      if (result.runtimeType == int) {
        isBannerLoading(false);
        print("Banner get error");
      } else {
        bannerList = result;
        bannerList.forEach((element) {
          if (element.name.toLowerCase().trim() ==
              ("Summer sale").toLowerCase().trim()) {
            customOfferBanner = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Only for you").toLowerCase().trim()) {
            onlyForYouBanner = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Squre Banner").toLowerCase().trim()) {
            squreBanner = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Side Banner1").toLowerCase().trim()) {
            sideBanner1 = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Side Banner2").toLowerCase().trim()) {
            sideBanner2 = element;
          } else if (element.name.toLowerCase().trim() ==
              ("New Arrivals").toLowerCase().trim()) {
            newArrivalsBanner = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Today Hot Sale").toLowerCase().trim()) {
            todayHotSaleBanner = element;
          } else if (element.name.toLowerCase().trim() ==
              ("Do not Miss").toLowerCase().trim()) {
            dontMissBanner = element;
          }
        });
      }
    } on Exception catch (e) {
      // TODO
      isBannerLoading(false);
    } finally {
      isBannerLoading(false);
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
          }
        });
        allFlashList.forEach((e) {
          e.products.forEach((element) {
            flashProductList.add(element);
          });
        });
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

  ///get all feature product
  getPopularProduct() async {
    isPopularProductLoading(true);
    try {
      var data = await ApiService.fetchFeatureProducts();
      if (data.runtimeType == int) {
        isPopularProductLoading(false);
        Fluttertoast.showToast(msg: "Popular Product fetch error");
      } else {
        popularProductList = data;
        isPopularProductLoading(false);
      }
    } on Exception catch (e) {
      isPopularProductLoading(false);
      Fluttertoast.showToast(msg: "Popular Product fetch error");
      // TODO
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
      TopLinkModel(title: "60% OFF Everything", color: Color(0xFFA8E8C2)),
      TopLinkModel(
          title: "All Offers",
          color: Color(0xFFFDAE87),
          icon: "asset/icons/all-offer.png"),
      TopLinkModel(
          title: "Top Ranking",
          color: Color(0xFFF49BE8),
          icon: "asset/icons/top-ranking.png"),
      TopLinkModel(
          title: "Top Brands",
          color: Color(0xFFA4DEFB),
          icon: "asset/icons/top-brands.png"),
      TopLinkModel(
          title: "New Arrival",
          color: Color(0xFFBDD05C),
          icon: "asset/icons/new-arrival.png"),
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
  String? icon;

  TopLinkModel({
    required this.title,
    required this.color,
    this.icon,
  });
}
