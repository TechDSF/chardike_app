import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/model/brand_model.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/model/country_model.dart';
import 'package:chardike/screens/SearchPage/model/search_product_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum Status { showBrand, showProduct }

class SearchController extends GetxController {
  var isLoading = false.obs;
  var subSearchTextController = TextEditingController().obs;
  var mainSearchTextController = TextEditingController().obs;
  Rx<List<String>> suggestionList = Rx<List<String>>([]);
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;
  List<BrandModel> brandList = List<BrandModel>.empty(growable: true).obs;
  List<CountryModel> countryList = List<CountryModel>.empty(growable: true).obs;
  var showType = false.obs;
  var isTextEmpty = true.obs;
  var firstitemOfCategory = "".obs;

  var isCategoryLoading = false.obs;
  var isCountryLoading = false.obs;

  var mainSearchShowType = false.obs;
  final HomeController _homeController = Get.put(HomeController());
  Rx<List<QueryProductModel>> filterProductList =
      Rx<List<QueryProductModel>>([]);

  @override
  void onInit() {
    // TODO: implement onInit
    getCategoryList();
    getBrandList();
    getCountryList();
    super.onInit();
  }

  getCategoryList() async {
    isCategoryLoading(true);
    var data = await ApiService.fetchCategories();
    if (data.runtimeType == int) {
      isCategoryLoading(false);
      Fluttertoast.showToast(msg: "Category fetch Error");
    } else {
      categoryList = data;
      firstitemOfCategory.value = categoryList[0].categoryName;
      isCategoryLoading(false);
    }
  }

  getBrandList() async {
    isCategoryLoading(true);
    print("work here");
    var data = await ApiService.fetchBrands();
    if (data.runtimeType == int) {
      isCategoryLoading(false);
      print("Brand fetch Error");
      Fluttertoast.showToast(msg: "Brand fetch Error");
    } else {
      brandList = data;
      isCategoryLoading(false);
    }
  }

  getCountryList() async {
    isCountryLoading(true);
    var data = await ApiService.fetchCountry();
    if (data.runtimeType == int) {
      isCountryLoading(false);
      print("Country fetch Error");
      Fluttertoast.showToast(msg: "Country fetch Error");
    } else {
      countryList = data;
      isCountryLoading(false);
    }
  }

  filterProduct(String value) {
    List<QueryProductModel> results = [];
    if (value.isEmpty) {
      results = _homeController.queryProductList;
    } else {
      results = _homeController.queryProductList
          .where((element) =>
              element.productName.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    filterProductList.value = results;
  }

  List<String> searchCategoryList = [
    "Acne Patch",
    "All Products",
    "Ampoule",
    "BB Cream",
    "Blush",
    "Body Care",
    "Body Lotion",
    "Body Lotion",
    "Body Wash",
    "Clay Mask",
    "Cleansing Bar",
    "Cleansing Foam",
    "Cleansing Oil",
    "Cleansing Tissue",
    "Cream",
    "Essence",
    "Exfoliator",
    "Eye Cream",
    "Eye Look",
    "Foot Care",
    "Foot Peeling Pack",
    "Foundation",
    "Hair Care",
    "Hair Serum",
    "Hair Treatment",
    "Hand Cream",
    "Kit",
    "Lip Balm",
    "Lip Scrub",
    "Lip Sleeping Mask",
    "Lip Tint",
    "Loose Powder",
    "Make Up",
    "Moisturizer",
    "Peeling Gel",
    "Serum",
    "Shampoo",
    "Sheet Mask",
    "Skin Care",
    "Skincare Set",
    "Sleeping Mask",
    "Soothing Gel",
    "Suncreen",
    "Toner",
    "Wash of Mask"
  ];

  List<String> searchBrandList = [
    "THE FACE SHOP",
    "Beaute",
    "SKINFOOD",
    "Nella",
    "RIRE",
    "purito",
    "HTS"
  ];

  getSearchSuggestionList(String suggestion) {
    var list = [
      "Acne Patch",
      "All Products",
      "Ampoule",
      "BB Cream",
      "Blush",
      "Body Care",
      "Body Lotion",
      "Body Lotion",
      "Body Wash",
      "Clay Mask",
      "Cleansing Bar",
      "Cleansing Foam",
      "Cleansing Oil",
      "Cleansing Tissue",
      "Cream",
      "Essence",
      "Exfoliator",
      "Eye Cream",
      "Eye Look",
      "Foot Care",
      "Foot Peeling Pack",
      "Foundation",
      "Hair Care",
      "Hair Serum",
      "Hair Treatment",
      "Hand Cream",
      "Kit",
      "Lip Balm",
      "Lip Scrub",
      "Lip Sleeping Mask",
      "Lip Tint",
      "Loose Powder",
      "Make Up",
      "Moisturizer",
      "Peeling Gel",
      "Serum",
      "Shampoo",
      "Sheet Mask",
      "Skin Care",
      "Skincare Set",
      "Sleeping Mask",
      "Soothing Gel",
      "Suncreen",
      "Toner",
      "Wash of Mask",
    ];

    List<String> results = [];
    if (suggestion.isEmpty) {
      results = list;
    } else {
      results = list
          .where((element) =>
              element.toLowerCase().contains(suggestion.toLowerCase()))
          .toList();
    }
    suggestionList.value = results;
  }
}
