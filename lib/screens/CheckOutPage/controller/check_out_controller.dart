import 'dart:convert';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CheckOutPage/model/coupon_model.dart';
import 'package:chardike/screens/CheckOutPage/screens/order_confirm.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';

import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../CartPage/model/cart_item_model.dart';
import '../model/address_model.dart';

class CheckOutController extends GetxController {
  var isLaoding = false.obs;
  late SharedPreferences preferences;
  var uuid = Uuid();

  var mobileTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;

  var deliverOptionIsHome = true.obs;
  var totalAmount = 0.0.obs;
  var isCouponApplied = false.obs;
  var isCouponMatched = true.obs;
  var couponResult = "".obs;
  var freeShipiing = false.obs;
  List<CartItemModel> dataList = [];

  Rx<List<AddressModel>> userAddress = Rx<List<AddressModel>>([]);
  Rx<List<AddressModel>> userShippingAddress = Rx<List<AddressModel>>([]);
  Rx<List<CouponModel>> couponList = Rx<List<CouponModel>>([]);
  var firstAddressValue = "".obs;
  var firstBillingAddress = "".obs;
  var addressId = 0.obs;
  var firstBillingId = 0.obs;
  var isBillingSelected = false.obs;

  final UserDataController _userDataController = Get.put(UserDataController());
  final CartController _cartController = Get.put(CartController());

  var isCashOn = true.obs;

  @override
  void onInit() {
    getSharedPreferenceData();
    getUserAddress();
    getShippingAddress();
    super.onInit();
  }

  getSharedPreferenceData() async {
    preferences = await SharedPreferences.getInstance();
    mobileTextEditingController.value.text = _userDataController.email.value;
  }

  setBillingAddress(
      {required String name,
      required String phone,
      required String region,
      required String city,
      required String area,
      required String address,
      required String postCode,
      required bool isBilling,
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
          name: name,
          phone: phone,
          region: region,
          city: city,
          area: area,
          address: address,
          isBilling: isBilling,
          postCode: postCode);
      if (result) {
        if (isBilling) {
          await getUserAddress();
        } else {
          await getShippingAddress();
        }

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
        print("User address $res");
        if (res.isNotEmpty) {
          userAddress.value = res;
        }
      }
    }
  }

  getShippingAddress() async {
    var resultt = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (resultt.runtimeType == int) {
      // Fluttertoast.showToast(
      //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
      print("Error to get token");
    } else {
      Map d = resultt;
      var res = await ApiService.getShippingAddress(accessToken: d['access']);
      if (res.runtimeType == int) {
        // Fluttertoast.showToast(
        //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
        print("Error to get user shipping location");
      } else {
        print(res);
        if (res.isNotEmpty) {
          userShippingAddress.value = res;

          addressId.value = userShippingAddress.value[0].id;
          firstAddressValue.value =
              "${userShippingAddress.value[0].area},${userShippingAddress.value[0].city},${userShippingAddress.value[0].region}";
        }
      }
    }
  }

  getCoupon() async {
    var result = await ApiService.getAllCoupon();
    if (result.runtimeType == int) {
      print("Coupon Get Error");
    } else {
      couponList.value = result;
      print("Coupon length ${couponList.value.length}");
    }
  }

  checkCoupon({required String coupon}) {
    var value =
        couponList.value.where((element) => element.couponName == coupon);
    if (value.isEmpty) {
      isCouponMatched.value = false;
      isCouponApplied.value = false;
    } else {
      isCouponMatched.value = true;
      isCouponApplied.value = true;
      freeShipiing.value = value.first.freeShipping;
      couponResult.value = value.first.couponAmount.toInt == 0 &&
              value.first.freeShipping == true
          ? "Free Shipping"
          : value.first.couponAmount.toInt != 0 &&
                  value.first.freeShipping == true
              ? "${value.first.couponAmount} tk discount and Free Shipping"
              : value.first.couponAmount.toInt != 0 &&
                      value.first.freeShipping == false
                  ? "${value.first.couponAmount} tk discount"
                  : "";
      if (deliverOptionIsHome.value &&
          value.first.freeShipping &&
          value.first.couponAmount.toInt != 0) {
        totalAmount.value = totalAmount.value - (60 + value.first.couponAmount);
      } else if (deliverOptionIsHome.value == false &&
          value.first.freeShipping &&
          value.first.couponAmount.toInt != 0) {
        totalAmount.value =
            totalAmount.value - (150 + value.first.couponAmount);
      }
      print("${value.first.couponAmount}");
    }
  }

  confirmOrder(
      {required BuildContext context,
      required bool orderType,
      required String refCode,
      required int address,
      required int billingAddress,
      required dynamic coupen,
      required String total,
      required String orderStatus,
      required bool isOrder,
      required String mobile,
      required String email,
      required bool firstDeliverry}) async {
    context.loaderOverlay.show();
    List<CartItemModel> list = [];
    if (orderType) {
      _cartController.cartList.value.forEach((element) {
        list.add(CartItemModel(
            item: element.id,
            quantity: element.quantity.toString(),
            attr: "colors:red",
            amount_item: element.price.toInt().toString(),
            total_price: element.totalPrice.toInt().toString()));
      });
      print("product list length ${list.length}");

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
          print("email $email");
          var res = await ApiService.confirmOrder(
              refCode: uuid.v1(),
              accessToken: d['access'],
              address: address,
              billingAddress: billingAddress,
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

            Navigator.push(
                context, MaterialPageRoute(builder: (_) => OrderConfirm()));
          }
        }
      } else {
        context.loaderOverlay.hide();
      }
    } else {
      dataList.forEach((element) {
        list.add(CartItemModel(
            item: element.item,
            quantity: element.quantity.toString(),
            attr: "colors:red",
            amount_item: element.amount_item,
            total_price: element.total_price));
      });

      list = dataList;

      print("The data list " + dataList.length.toString());
      var data = convertToJson(list);
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
          print("email $email");
          var res = await ApiService.confirmOrder(
              refCode: uuid.v1(),
              accessToken: d['access'],
              address: address,
              billingAddress: billingAddress,
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

            Navigator.push(
                context, MaterialPageRoute(builder: (_) => OrderConfirm()));
          }
        }
      } else {
        context.loaderOverlay.hide();
      }
    }
  }
}
