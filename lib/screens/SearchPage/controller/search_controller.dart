import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/CategoryPage/model/brand_model.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/CategoryPage/model/sub_category_model.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/SearchPage/model/category_product_model.dart';
import 'package:chardike/screens/SearchPage/model/country_model.dart';
import 'package:chardike/screens/SearchPage/model/search_history_model.dart';
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
  List<SearchHistoryModel> searchHistoryList =
      List<SearchHistoryModel>.empty(growable: true).obs;
  var showType = false.obs;
  var isTextEmpty = true.obs;
  var firstitemOfCategory = "".obs;

  var isCategoryLoading = false.obs;
  var isCountryLoading = false.obs;

  var mainSearchShowType = false.obs;
  final HomeController _homeController = Get.put(HomeController());
  final CategoryController _categoryController = Get.put(CategoryController());
  Rx<List<ProductModel>> filterProductList = Rx<List<ProductModel>>([]);

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
      if (categoryList.isNotEmpty) {
        firstitemOfCategory.value = categoryList[0].categoryName;
      }

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
    List<ProductModel> results = [];
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

  addToSearchHistory({required String value, required String id}) {
    if (searchHistoryList.contains(value)) {
    } else {
      searchHistoryList.add(SearchHistoryModel(id: id, name: value));
    }
  }

  bool checkDataExitOrNotInSearch({required String id}) {
    var contain = searchHistoryList.where((element) => element.name == id);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
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

  ///get single category , single brand, single country product
  var isSingleCategoryLoading = false.obs;
  getProductByCategory({required String type, required String id}) async {
    isSingleCategoryLoading(true);
  }

  ///all search product and we can filter
  var selectRating = 10.obs;
  var selectBrand = 100.obs;
  var brandName = "".obs;
  var ratingCount = 0.0.obs;
  var isFilterLoading = false.obs;
  Rx<List<ProductModel>> searchProductList = Rx<List<ProductModel>>([]);
  Rx<List<ProductModel>> searchProductList1 = Rx<List<ProductModel>>([]);
  setAllSearchProduct(
      {required List<ProductModel> list,
      required String searchType,
      required String id}) async {
    isFilterLoading(true);
    if (list.isEmpty) {
      searchProductList.value.clear();
      searchProductList1.value.clear();
      getCategoryProductById(id: id);
    } else {
      searchProductList.value = list;
      searchProductList1.value = list;
      isFilterLoading(false);
    }
  }

  getCategoryProductById({required String id}) async {
    var result = await ApiService.fetchCategoryProductById(id: id);
    if (result.runtimeType == int) {
      isFilterLoading(false);
      //Fluttertoast.showToast(msg: "Category id related product fetch error!");
    } else if (result.runtimeType == CategoryProductModel) {
      CategoryProductModel model = result;
      searchProductList.value = model.categoryProducts;
      isFilterLoading(false);
    } else {
      isFilterLoading(false);
      Fluttertoast.showToast(msg: "${result.runtimeType}");
    }
  }

  filterAllProduct() {
    List<ProductModel> results = [];
    if (selectRating.value == 10 && selectBrand.value == 100) {
      results = searchProductList1.value;
    } else {
      if (brandName.value == "" && ratingCount.value != 0.0) {
        results = searchProductList1.value
            .where((element) =>
                CommonData.calculateRating(element.reviews) < ratingCount.value)
            .toList();
      } else if (ratingCount.value == 0.0 && brandName.value != "") {
        results = searchProductList1.value
            .where((element) => element.brand.name
                .toLowerCase()
                .contains(brandName.toLowerCase()))
            .toList();
      } else {
        results = searchProductList1.value
            .where((element) => element.brand.name
                .toLowerCase()
                .contains(brandName.toLowerCase()))
            .where((element) =>
                CommonData.calculateRating(element.reviews) < ratingCount.value)
            .toList();
      }
    }
    searchProductList.value = results;
  }
}
