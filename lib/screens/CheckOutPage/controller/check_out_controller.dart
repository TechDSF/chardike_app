import 'dart:convert';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';

import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../CartPage/model/cart_item_model.dart';
import '../model/address_model.dart';

class CheckOutController extends GetxController {
  var isLaoding = false.obs;
  late SharedPreferences preferences;

  var mobileTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;

  var deliverOptionIsHome = true.obs;
  var totalAmount = 0.0.obs;

  Rx<List<AddressModel>> userAddress = Rx<List<AddressModel>>([]);
  var firstAddressValue = "".obs;
  var addressId = 0.obs;

  final UserDataController _userDataController = Get.put(UserDataController());
  final CartController _cartController = Get.put(CartController());

  var isCashOn = true.obs;

  @override
  void onInit() {
    getSharedPreferenceData();
    getUserAddress();
    super.onInit();
  }

  getSharedPreferenceData() async {
    preferences = await SharedPreferences.getInstance();
    mobileTextEditingController.value.text = _userDataController.email.value;
  }

  setBillingAddress(
      {required String region,
      required String city,
      required String area,
      required String address,
      required String postCode,
      required BuildContext context}) async {
    context.loaderOverlay.show();
    var data = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);

    if (data.runtimeType == int) {
      context.loaderOverlay.hide();
      // Fluttertoast.showToast(
      //     msg: "Error to set Location", toastLength: Toast.LENGTH_LONG);
      print("Error to get token");
    } else {
      Map d = data;
      var result = await ApiService.setBillingAddress(
          accessToken: d['access'],
          region: region,
          city: city,
          area: area,
          address: address,
          postCode: postCode);
      if (result) {
        await getUserAddress();
        context.loaderOverlay.hide();
        Navigator.pop(context);
      } else {
        // Fluttertoast.showToast(
        //     msg: "Error to set Location", toastLength: Toast.LENGTH_LONG);
        print("set location error");
        context.loaderOverlay.hide();
      }
    }
  }

  getUserAddress() async {
    var resultt = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (resultt.runtimeType == int) {
      // Fluttertoast.showToast(
      //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
      print("Error to get token");
    } else {
      Map d = resultt;
      var res = await ApiService.getBillingAddress(accessToken: d['access']);
      if (res.runtimeType == int) {
        // Fluttertoast.showToast(
        //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
        print("Error to get user location");
      } else {
        print(res);
        if (res.isNotEmpty) {
          userAddress.value = res;

          addressId.value = userAddress.value[0].id;
          firstAddressValue.value =
              "${userAddress.value[0].area},${userAddress.value[0].city},${userAddress.value[0].region}";
        }
      }
    }
  }

  confirmOrder(
      {required BuildContext context,
      required String refCode,
      required int address,
      required dynamic coupen,
      required String total,
      required String orderStatus,
      required bool isOrder,
      required String mobile,
      required String email,
      required bool firstDeliverry}) async {
    context.loaderOverlay.show();
    List<CartItemModel> list = [];
    _cartController.cartList.value.forEach((element) {
      list.add(CartItemModel(
          item: element.id,
          quantity: element.quantity.toString(),
          attr: "colors:red",
          amount_item: element.price.toInt().toString(),
          total_price: element.totalPrice.toInt().toString()));
    });

    var data = convertToJson(list);
    print(data);
    var result = await ApiService.addCartItem(jsonData: data);
    if (result != false) {
      var resultt = await ApiService.getUserToken(
          userName: _userDataController.userName.value,
          password: _userDataController.password.value);
      if (resultt.runtimeType == int) {
        context.loaderOverlay.hide();
        Fluttertoast.showToast(
            msg: "Error to Place Order", toastLength: Toast.LENGTH_LONG);
        print("Error to get Order token");
      } else {
        Map d = resultt;
        var res = await ApiService.confirmOrder(
            refCode: refCode,
            accessToken: d['access'],
            address: address,
            coupen: coupen,
            total: total,
            items: result,
            orderStatus: orderStatus,
            isOrder: isOrder,
            mobile: mobile,
            email: email,
            firstDeliverry: firstDeliverry);

        if (res == false) {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(
              msg: "Error to Complete Order", toastLength: Toast.LENGTH_LONG);
          print("Error to Complete Order");
        } else {
          print("result ok");
          var db = DatabaseHelper();
          db.deleteAllCartData();
          _cartController.cartList.value.clear();
          context.loaderOverlay.hide();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => MainScreen()),
              (route) => false);
        }
      }
    } else {
      context.loaderOverlay.hide();
    }
  }
}
