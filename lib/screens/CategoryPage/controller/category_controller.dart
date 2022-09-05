import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:chardike/screens/CategoryPage/model/single_category_product_model.dart';
import 'package:chardike/screens/CategoryPage/model/sub_category_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
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
  List<CategoryModel> categoryList =
      List<CategoryModel>.empty(growable: true).obs;

  @override
  void onInit() {
    getAllListData();
    super.onInit();
  }

  getCategoryList() {
    isCategoryGetLoading(true);
    _homeController.categoryList.forEach((element) {
      categoryList.add(element);
    });
    categoryList = _homeController.categoryList;
    Future.delayed(Duration(seconds: 5), () {
      getSubCategoryListBySlug(
          slug: _homeController.categoryList[0].slug.toString());
      isCategoryGetLoading(false);
    });
  }

  getAllListData() async {
    isSubCategoryGetLoading(true);
    var result = await ApiService.fetchSubCategories();
    if (result.runtimeType == int) {
      print("sub category not working");
      isSubCategoryGetLoading(false);
    } else {
      print("sub category length = ${result.length}");
      subCategoryList = result;
      getCategoryList();
    }
    isSubCategoryGetLoading(false);
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
