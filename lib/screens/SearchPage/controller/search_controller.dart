import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/CategoryPage/model/brand_model.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/CategoryPage/model/sub_category_model.dart';
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
  Rx<List<SubCategoryModel>> suggestionList = Rx<List<SubCategoryModel>>([]);
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;
  List<BrandModel> brandList = List<BrandModel>.empty(growable: true).obs;
  List<CountryModel> countryList = List<CountryModel>.empty(growable: true).obs;
  List<String> searchHistoryList = List<String>.empty(growable: true).obs;
  var showType = false.obs;
  var isTextEmpty = true.obs;
  var firstitemOfCategory = "".obs;

  var isCategoryLoading = false.obs;
  var isCountryLoading = false.obs;

  var mainSearchShowType = false.obs;
  final HomeController _homeController = Get.put(HomeController());
  final CategoryController _categoryController = Get.put(CategoryController());
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

  addToSearchHistory({required String value}) {
    if (searchHistoryList.contains(value)) {
    } else {
      searchHistoryList.add(value);
    }
  }

  getSearchSuggestionList(String suggestion) {
    var list = _categoryController.subCategoryList;
    List<SubCategoryModel> results = [];
    if (suggestion.isEmpty) {
      results = list;
    } else {
      results = list
          .where((element) => element.subCategoryName
              .toLowerCase()
              .contains(suggestion.toLowerCase()))
          .toList();
    }
    suggestionList.value = results;
  }
}
