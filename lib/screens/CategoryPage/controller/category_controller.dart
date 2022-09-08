import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/CategoryPage/model/single_category_product_model.dart';
import 'package:chardike/screens/CategoryPage/model/sub_category_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../HomePage/controller/home_controller.dart';

class CategoryController extends GetxController {
  var isLoading = false.obs;
  var selectedTab = "dfjkjdfk".obs;
  var selectedCategoryItem = 1000000.obs;
  final HomeController _homeController = Get.put(HomeController());
  Rx<List<SubCategoryModel>> skinCareList = Rx<List<SubCategoryModel>>([]);

  List<SubCategoryModel> subCategoryList =
      List<SubCategoryModel>.empty(growable: true).obs;

  var isCategoryProductLoading = false.obs;
  List<ProductModel> categoryProductList =
      List<ProductModel>.empty(growable: true).obs;

  var isCategoryGetLoading = false.obs;
  var isSubCategoryGetLoading = false.obs;
  List<CategoryModel> demoCategoryList =
      List<CategoryModel>.empty(growable: true).obs;
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  @override
  void onInit() {
    getAllListData();
    super.onInit();
  }

  getAllListData() async {
    isSubCategoryGetLoading(true);
    try {
      var result = await ApiService.fetchSubCategories();
      if (result.runtimeType == int) {
        print("sub category not working");
        isSubCategoryGetLoading(false);
      } else {
        print("sub category length = ${result.length}");
        subCategoryList = result;
      }
    } on Exception catch (e) {
      isSubCategoryGetLoading(false);
      // TODO
    } finally {
      getCategoryProduct();
      isSubCategoryGetLoading(false);
    }
  }

  var isCategoryDataLoading = false.obs;
  getCategoryProduct() async {
    isCategoryDataLoading(true);
    try {
      var data = await ApiService.fetchCategories();
      if (data.runtimeType == int) {
        isCategoryDataLoading(false);
        print("Category controller category fetch Error");
        //Fluttertoast.showToast(msg: "Category controller category fetch Error");
      } else {
        demoCategoryList = data;
        isCategoryDataLoading(false);
      }
    } on Exception catch (e) {
      print("Category controller category fetch Error");
      // TODO
    } finally {
      getCategoryList();
    }
  }

  getCategoryList() {
    isCategoryGetLoading(true);
    try {
      demoCategoryList.forEach((element) {
        categoryList.add(element);
      });
      categoryList = demoCategoryList;
    } on Exception catch (e) {
      // TODO
      isCategoryGetLoading(false);
    } finally {
      getSubCategoryListBySlug(slug: demoCategoryList[0].slug.toString());
      isCategoryGetLoading(false);
    }
  }

  getSubCategoryListBySlug({required String slug}) {
    skinCareList.value = subCategoryList
        .where((element) => element.category.slug == slug)
        .toList();
  }

  getProductByCategory({required String categoryId}) async {
    isCategoryProductLoading(true);
    try {
      var result =
          await ApiService.getSingleCategoryProduct(categoryId: categoryId);
      if (result.runtimeType == int) {
        print("Single category product fetch error! $result");
      } else {
        categoryProductList.clear();
        //List<SingleCategoryProductModel> list = result;
        categoryProductList = result.categoryProducts;
      }
    } on Exception catch (e) {
      print("Single category product fetch error! ${e.toString()}");
      isCategoryProductLoading(false);
      // TODO
    } finally {
      isCategoryProductLoading(false);
      print(categoryProductList.length);
    }
  }
}
