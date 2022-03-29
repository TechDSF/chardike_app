import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/model/cart_model.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  var isLoading = false.obs;
  var quantity = 1.obs;

  List<CartModel> cartList = List<CartModel>.empty(growable: true).obs;

  var shippingValue = 0.obs;
}