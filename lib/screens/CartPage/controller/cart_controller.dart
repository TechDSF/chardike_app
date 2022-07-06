import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var quantity = 1.obs;
  var subTotalAmount = (0.0).obs;
  var mainTotalAmount = 0.0.obs;
  var shippingPreviousPrice = 60.obs;

  List<CartModel> cartList = List<CartModel>.empty(growable: true).obs;

  var shippingValue = 0.obs;

  @override
  void onInit() {
    getTotalAmount();
    super.onInit();
  }

  getTotalAmount() {
    subTotalAmount.value = 0;
    mainTotalAmount.value = 0;
    cartList.forEach((element) {
      subTotalAmount.value += element.totalPrice;
    });
    mainTotalAmount.value = subTotalAmount.value + 60;
  }
}
