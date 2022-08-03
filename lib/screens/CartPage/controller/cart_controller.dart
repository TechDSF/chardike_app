import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/CartPage/model/cart_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var quantity = 1.obs;
  var subTotalAmount = (0.0).obs;
  var mainTotalAmount = 0.0.obs;
  var shippingPreviousPrice = 60.obs;

  Rx<List<CartModel>> cartList = Rx<List<CartModel>>([]);

  var shippingValue = 0.obs;

  @override
  void onInit() {
    getCartProduct();
    getTotalAmount();
    super.onInit();
  }

  addToCart({required CartModel cartModel}) async {
    var helper = DatabaseHelper();
    var restult = await helper.insertCartProduct(cartModel);
    if (restult != 0) {
      getCartProduct();
      Fluttertoast.showToast(
          msg: "Added Successfully", toastLength: Toast.LENGTH_LONG);
    }
  }

  getCartProduct() async {
    var helper = DatabaseHelper();
    var restult = await helper.getCartProduct();
    cartList.value.clear();
    cartList.value = restult;
    getTotalAmount();
  }

  getTotalAmount() {
    subTotalAmount.value = 0;
    mainTotalAmount.value = 0;
    print(cartList.value.length);
    cartList.value.forEach((element) {
      subTotalAmount.value += element.totalPrice;
    });
    mainTotalAmount.value = subTotalAmount.value + 60;
  }

  callDelete(String id) async {
    var helper = DatabaseHelper();
    var restult = await helper.deleteCart(id);
    if (restult != 0) {
      try {
        getCartProduct();
      } finally {
        // TODO
        //getTotalAmount();
      }
    }
    print("Sub total = ${subTotalAmount.value}");
  }

  var isHaveCart = false.obs;
  bool checkDataExitOrNot({required String id}) {
    var contain = cartList.value.where((element) => element.id == id);
    if (contain.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  updateCartItem(
      {required String id,
      required double quantity,
      required double price,
      required double totalPrice}) async {
    var helper = DatabaseHelper();
    var restult = await helper.updateCartItem(
        id: id,
        quantityData: quantity,
        priceData: price,
        totalPriceData: totalPrice);
    if (restult != 0) {
      try {
        getCartProduct();
      } finally {
        // TODO
        //getTotalAmount();
      }
    }
    print("Sub total = ${subTotalAmount.value}");
  }
}
