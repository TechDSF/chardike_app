import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/CategoryPage/model/sub_category_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';
import '../../HomePage/controller/home_controller.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var selectedTab = 0.obs;
  final HomeController _homeController = Get.put(HomeController());
  Rx<List<SubCategoryModel>> skinCareList = Rx<List<SubCategoryModel>>([]);

  List<SubCategoryModel> subCategoryList =
      List<SubCategoryModel>.empty(growable: true).obs;

  var isCategoryGetLoading = false.obs;
  var isSubCategoryGetLoading = false.obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  var selectRating = 10.obs;
  var selectDiscount = 10.obs;
  var selectBrand = 100.obs;
  var isShowAllBrand = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllListData();
    super.onInit();
  }

  getCategoryList() {
    isCategoryGetLoading(true);
    _homeController.categoryList.forEach((element) {
      categoryList.add(element);
    });
    getSubCategoryListById(id: categoryList[0].id.toString());
    isCategoryGetLoading(false);
  }

  getAllListData() async {
    isSubCategoryGetLoading(true);
    var result = await ApiService.fetchSubCategories();
    if (result.runtimeType == int) {
      print("not working");
      isSubCategoryGetLoading(false);
    } else {
      print("sub category length = ${result.length}");
      subCategoryList = result;
      getCategoryList();
    }
    isSubCategoryGetLoading(false);
  }

  getSubCategoryListById({required String id}) {
    skinCareList.value = subCategoryList
        .where((element) => element.category.toString() == id)
        .toList();
  }
}
