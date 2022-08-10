import 'dart:convert';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CheckOutPage/model/coupon_model.dart';
import 'package:chardike/screens/CheckOutPage/screens/order_confirm.dart';
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
  var isFreeShipiing = false.obs;
  var discountPrice = 0.obs;
  var couponId = 0.obs;
  List<CartItemModel> dataList = [];

  Rx<List<AddressModel>> userAddress = Rx<List<AddressModel>>([]);
  Rx<List<AddressModel>> userShippingAddress = Rx<List<AddressModel>>([]);
  CouponModel? couponModel;
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

  getCoupon(
      {required String couponName,
      required BuildContext context,
      required bool type,
      required int list}) async {
    context.loaderOverlay.show();
    var result = await ApiService.getAllCoupon(couponName: couponName);
    if (result.runtimeType == int) {
      isCouponMatched.value = false;
      isCouponApplied.value = false;
      context.loaderOverlay.hide();
      print("Coupon Get Error");
    } else if (result.runtimeType == CouponModel) {
      couponModel = result;
      print("Coupon data : ${result!.couponName}");
      checkCoupon(context: context, type: type, singleList: list);
    } else {
      isCouponMatched.value = false;
      isCouponApplied.value = false;
      print("Coupon Get Error d");
      context.loaderOverlay.hide();
    }
  }

  checkCoupon(
      {required BuildContext context,
      required bool type,
      required int singleList}) {
    var value = couponModel;
    discountPrice.value = 0;
    // var value = CouponModel(
    //     id: 3,
    //     couponName: "afg",
    //     couponType: "Fixed Cart Discountt",
    //     couponAmount: 34.0,
    //     freeShipping: false,
    //     expireDate: DateTime.parse("2022-08-23"),
    //     maximumUser: 34523,
    //     minimumSale: 14512341,
    //     maximumSale: 235234,
    //     category: [1, 2],
    //     brand: [2, 3],
    //     product: [1, 2],
    //     couponCount: 0);
    var myList = _cartController.cartList.value;
    print(myList.length);
    // var myList = [
    //   CartModel(
    //       id: "2",
    //       title: "Hei This is product!",
    //       image: "",
    //       quantity: 2,
    //       price: 120,
    //       totalPrice: 240,
    //       brandId: 2,
    //       categoryId: 2),
    //   CartModel(
    //       id: "5",
    //       title: "Hei This is product 2!",
    //       image: "",
    //       quantity: 2,
    //       price: 120,
    //       totalPrice: 240,
    //       brandId: 3,
    //       categoryId: 2),
    // ];
    if (value == null) {
      isCouponMatched.value = false;
      isCouponApplied.value = false;
    } else {
      isCouponMatched.value = true;
      isCouponApplied.value = true;
      couponId.value = value.id;
      isFreeShipiing.value = value.freeShipping;
      couponResult.value = "Nothing";
      if (value.expireDate.isAfter(DateTime.now()) &&
          value.maximumUser != 0 &&
          value.minimumSale <= 2000 &&
          value.maximumSale >= 10000) {
        print("Coupon is valid");
        if (value.couponType == "Fixed Cart Discount") {
          print("Coupon type is Fiexed Card");
          if (value.brand.isEmpty &&
              value.category.isEmpty &&
              value.product.isEmpty) {
            print("everything is empty");
            if (type) {
              discountPrice.value = myList.length * value.couponAmount.toInt();
            } else {
              discountPrice.value = value.couponAmount.toInt();
            }
          } else {
            if (type) {
              myList.forEach((element) {
                // print(
                //     "${element.brandId} , ${element.categoryId}, brand list ${value.brand[0]}");
                // bool haveValue =
                //     value.brand.where((elt) => elt == element.brandId);

                bool isHaveBrand = value.brand.isEmpty
                    ? false
                    : value.brand.contains(element.brandId);

                bool isHaveCategory = value.category.isEmpty
                    ? false
                    : value.category.contains(element.categoryId);
                bool isHaveProduct = value.product.isEmpty
                    ? false
                    : value.product.contains(int.parse(element.id));
                print(
                    "Brand $isHaveBrand , Category $isHaveCategory, Product $isHaveProduct");
                if (isHaveProduct || isHaveCategory || isHaveBrand) {
                  discountPrice.value =
                      value.couponAmount.toInt() + discountPrice.value;
                }
              });
            } else {
              discountPrice.value = value.couponAmount.toInt();
            }
          }
        } else {
          if (value.brand.isEmpty &&
              value.category.isEmpty &&
              value.product.isEmpty) {
            if (type) {
              myList.forEach((element) {
                discountPrice.value =
                    element.totalPrice.toInt() % value.couponAmount.toInt();
                print("$discountPrice");
              });
            } else {
              discountPrice.value =
                  singleList % value.couponAmount.toInt();
            }
          } else {
            if (type) {
              myList.forEach((element) {
                bool isHaveBrand = value.brand.isEmpty
                    ? false
                    : value.brand.contains(element.brandId);

                bool isHaveCategory = value.category.isEmpty
                    ? false
                    : value.category.contains(element.categoryId);

                bool isHaveProduct = value.product.isEmpty
                    ? false
                    : value.product.contains(int.parse(element.id));
                print(
                    " ggBrand $isHaveBrand , Category $isHaveCategory, Product $isHaveProduct");
                if (isHaveProduct || isHaveCategory || isHaveBrand) {
                  var tt =
                      (element.totalPrice.toInt()) * value.couponAmount.toInt();
                  int newPrice = tt ~/ 100;
                  discountPrice = discountPrice + newPrice;
                }
              });
            } else {
              discountPrice.value =
                  singleList % value.couponAmount.toInt();
            }
          }
        }
        if (deliverOptionIsHome.value &&
            value.freeShipping &&
            value.couponAmount.toInt != 0) {
          totalAmount.value = totalAmount.value - (60 + discountPrice.value);
        } else if (deliverOptionIsHome.value == false &&
            value.freeShipping &&
            value.couponAmount.toInt != 0) {
          totalAmount.value = totalAmount.value - (150 + discountPrice.value);
        }
        print("${value.couponAmount} and ${discountPrice}");
      } else {
        print("Coupon is not valid");
      }
    }
    context.loaderOverlay.hide();
  }

  clearCoupon() {
    isCouponApplied.value = false;
    isFreeShipiing.value = false;
    if (deliverOptionIsHome.value) {
      totalAmount.value = totalAmount.value + (60 + discountPrice.value);
    } else {
      totalAmount.value = totalAmount.value + (150 + discountPrice.value);
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
              coupen: isCouponApplied.value ? couponId.value : null,
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
