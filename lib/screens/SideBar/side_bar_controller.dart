import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:get/get.dart';

import '../../Service/ApiService/api_service.dart';
import '../CategoryPage/model/sub_category_model.dart';

class SideBarController extends GetxController {
  var isCategoryClicked = false.obs;
  var selectedIndex = "non".obs;
  var isCategoryLoading = false.obs;
  final HomeController _homeController = Get.put(HomeController());
  List<SubCategoryModel> subCategoryList =
      List<SubCategoryModel>.empty(growable: true).obs;
  List<SubCategoryModel> filterSubCatList =
      List<SubCategoryModel>.empty(growable: true).obs;

  void initData() {
    isCategoryClicked.value = false;
    selectedIndex.value = "non";
  }

  filterSUbCat({required String catName}) {
    filterSubCatList.clear();
    filterSubCatList = subCategoryList
        .where((element) =>
            element.category.categoryName.toString().toLowerCase() ==
            catName.toLowerCase())
        .toList();
  }

  getAllSubCategoryListData() async {
    isCategoryLoading(true);
    try {
      var result = await ApiService.fetchSubCategories();
      if (result.runtimeType == int) {
        print("Side bar sub category not working $result");
        isCategoryLoading(false);
      } else {
        subCategoryList.clear();
        print("side bar sub category length = ${result.length}");
        subCategoryList = result;
      }
    } on Exception catch (e) {
      print("Side bar sub category not working ${e.toString()}");
      isCategoryLoading(false);
      // TODO
    } finally {
      isCategoryLoading(false);
    }
  }
}

class SidebarCategoryModel {
  String categoryName;
  String id;
  List<SidebarSubCatModel> subCatList;

  SidebarCategoryModel(
      {required this.id, required this.categoryName, required this.subCatList});
}

class SidebarSubCatModel {
  String subCatName;
  String id;

  SidebarSubCatModel({required this.id, required this.subCatName});
}
