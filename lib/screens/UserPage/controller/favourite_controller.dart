import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/UserPage/model/favourite_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {
  var isLoading = false.obs;
  var isFavouriteLoading = false.obs;
  var isFavourite = false.obs;

  List<FavouriteModel> favouriteList =
      List<FavouriteModel>.empty(growable: true).obs;

  @override
  void onInit() {
    getFavouriteProduct();
    super.onInit();
  }

  getFavouriteProduct() async {
    isFavouriteLoading(true);
    var db = DatabaseHelper();
    favouriteList = await db.getFavouriteProduct();
    print("Favourite length is ${favouriteList.length}");
    isFavouriteLoading(false);
  }

  bool checkDataExitOrNot({required String id}) {
    var contain = favouriteList.where((element) => element.id == id);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  addProduct({required FavouriteModel model}) async {
    var db = DatabaseHelper();
    var result = db.insertFavouriteProduct(model);
    if (result == 0) {
      Fluttertoast.showToast(
          msg: "Ooops! Data is not add!", toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(
          msg: "Successfully add to MyLike!", toastLength: Toast.LENGTH_LONG);
      getFavouriteProduct();
    }
  }

  deleteData({required String id}) async {
    var db = DatabaseHelper();
    var result = await db.deleteProduct(id);
    if (result == 0) {
      Fluttertoast.showToast(
          msg: "Ooops! Data is not delete!", toastLength: Toast.LENGTH_LONG);
    } else {
      Fluttertoast.showToast(
          msg: "Successfully remove from MyLike!",
          toastLength: Toast.LENGTH_LONG);
      getFavouriteProduct();
    }
  }
}
