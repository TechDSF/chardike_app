import 'dart:async';

import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/Service/database_helper.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CheckOutPage/model/coupon_model.dart';
import 'package:chardike/screens/CheckOutPage/screens/order_confirm.dart';
import 'package:chardike/screens/CheckOutPage/screens/payment_page.dart';
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
  var isCouponValid = false.obs;
  var couponResult = "".obs;
  var isFreeShipiing = false.obs;
  var discountPrice = 0.obs;
  var orderFromValue = false.obs;
  var couponId = 0.obs;
  var isPointApplied = false.obs;
  var appliedPoint = 0.obs;
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

  var deliverySystem = "Dhaka".obs;
  var deliveryType = "Dhaka Fast Delivery".obs;
  var myCheckoutType = false.obs;
  var mySubtotalAmmount = 0.0.obs;

  late Timer timer;

  @override
  void onClose() {
    // TODO: implement onClose
    timer.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    getSharedPreferenceData();
    getUserAddress();
    loadingCheckoutPage();
    super.onInit();
  }

  getSharedPreferenceData() async {
    preferences = await SharedPreferences.getInstance();
    mobileTextEditingController.value.text = _userDataController.phone.value;
  }

  setBillingAddress(
      {required String name,
      required String phone,
      required String email,
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
          email: email,
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
          await getShippingAddress(type: false, amount: 0);
        }

        context.loaderOverlay.hide();
        Navigator.pop(context);
      } else {
        print("set location error");
        context.loaderOverlay.hide();
      }
    }
  }

  var isUserAddressLoading = false.obs;
  getUserAddress() async {
    isUserAddressLoading(true);
    var resultt = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (resultt.runtimeType == int) {
      isUserAddressLoading(false);
      // Fluttertoast.showToast(
      //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
      print("Error to get token");
    } else {
      Map d = resultt;
      var res = await ApiService.getBillingAddress(accessToken: d['access']);
      if (res.runtimeType == int) {
        isUserAddressLoading(false);
        // Fluttertoast.showToast(
        //     msg: "Error to get Location", toastLength: Toast.LENGTH_LONG);
        print("Error to get user location");
      } else {
        isUserAddressLoading(false);
        print("User address $res");
        if (res.isNotEmpty) {
          userAddress.value = res;
        }
      }
    }
  }

  loadingCheckoutPage() async {
    if (mySubtotalAmmount.value == 0.0) {
      timer = Timer(Duration(seconds: 3), () {
        if (mySubtotalAmmount.value == 0.0) {
          getShippingAddress(type: false, amount: 0);
        }
      });
    } else {
      getShippingAddress(type: false, amount: 0);
    }
  }

  var isUserShippingAddressLoading = false.obs;
  getShippingAddress({required bool type, required double amount}) async {
    isUserShippingAddressLoading(true);
    var resultt = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (resultt.runtimeType == int) {
      isUserShippingAddressLoading(false);
      print("Error to get token");
    } else {
      Map d = resultt;
      var res = await ApiService.getShippingAddress(accessToken: d['access']);
      if (res.runtimeType == int) {
        isUserShippingAddressLoading(false);
        print("Error to get user shipping location");
      } else {
        print(res);
        if (res.isNotEmpty) {
          userShippingAddress.value = res;
          addressId.value = userShippingAddress.value[0].id;
          firstAddressValue.value =
              "${userShippingAddress.value[0].area},${userShippingAddress.value[0].city},${userShippingAddress.value[0].region}";
          deliverySystem.value = userShippingAddress.value[0].city;
          if (myCheckoutType.value) {
            if (userShippingAddress.value[0].city == "Dhaka") {
              totalAmount.value = _cartController.subTotalAmount.value + 60;
            } else {
              totalAmount.value = _cartController.subTotalAmount.value + 150;
            }
          } else {
            if (userShippingAddress.value[0].city == "Dhaka") {
              totalAmount.value = mySubtotalAmmount.value + 60;
            } else {
              totalAmount.value = mySubtotalAmmount.value + 150;
            }
          }
        }
        isUserShippingAddressLoading(false);
      }
    }
  }

  var isEditAddressLoading = false.obs;
  editUserAddress(
      {required String nameData,
      required String emailData,
      required String phoneData,
      required String regionData,
      required String cityData,
      required String areaData,
      required String postCodeData,
      required String addressData,
      required bool type,
      required String id,
      required BuildContext context}) async {
    isEditAddressLoading(true);
    print("orjka");
    var result = await ApiService.updateUrseAddress(
        nameData: nameData,
        id: id,
        emailData: emailData,
        phoneData: phoneData,
        regionData: regionData,
        cityData: cityData,
        areaData: areaData,
        postCodeData: postCodeData,
        addressData: addressData,
        type: type);

    if (result) {
      getShippingAddress(type: false, amount: 0);
      getUserAddress();
      context.loaderOverlay.show();
      isEditAddressLoading(false);
      Navigator.pop(context);
    } else {
      isEditAddressLoading(false);
      context.loaderOverlay.show();
      Fluttertoast.showToast(msg: "Oops! Adress not updated!");
    }
  }

  applyPoint({required int points}) {
    isPointApplied.value = true;
    appliedPoint.value = points;
    totalAmount.value = totalAmount.value - points;
  }

  clearPoint({required int points}) {
    isPointApplied.value = false;
    totalAmount.value = totalAmount.value + appliedPoint.value;
    appliedPoint.value = 0;
  }

  getCoupon(
      {required String couponName,
      required BuildContext context,
      required bool type,
      required int subTotal,
      required int quantity,
      required bool productType}) async {
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
      checkCoupon(
          context: context,
          type: type,
          subTotal: subTotal,
          quantity: quantity,
          productType: productType);
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
      required int subTotal,
      required int quantity,
      required bool productType}) {
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
      couponResult.value = "Nothing";
      if (value.expireDate.isAfter(DateTime.now()) &&
          value.maximumUser != 0 &&
          value.minimumSale <= subTotal &&
          value.maximumSale >= subTotal) {
        couponId.value = value.id;
        isFreeShipiing.value = value.freeShipping;
        isCouponValid.value = true;
        print("Coupon is valid");
        if (value.couponType == "Fixed Cart Discount") {
          print("Coupon type is Fiexed Card");
          if (value.brand.isEmpty &&
              value.category.isEmpty &&
              value.product.isEmpty) {
            print("everything is empty");
            if (type) {
              myList.forEach((element) {
                if (element.type == 0) {
                  var newPrice = element.quantity * value.couponAmount.toInt();
                  discountPrice.value = discountPrice.value + newPrice;
                }
              });
            } else {
              if (productType) {
                discountPrice.value = quantity * value.couponAmount.toInt();
              }
            }
          } else {
            if (type) {
              myList.forEach((element) {
                if (element.type == 0) {
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
                    var newPrice =
                        value.couponAmount.toInt() * element.quantity;
                    discountPrice.value = newPrice + discountPrice.value;
                  }
                }
              });
            } else {
              if (productType) {
                discountPrice.value = quantity * value.couponAmount.toInt();
              }
            }
          }
        } else {
          if (value.brand.isEmpty &&
              value.category.isEmpty &&
              value.product.isEmpty) {
            if (type) {
              print("work type");
              myList.forEach((element) {
                if (element.type == 0) {
                  discountPrice.value = (((element.totalPrice.toInt() *
                                  value.couponAmount.toInt()) ~/
                              100)
                          .toInt()) *
                      element.quantity;
                  print("$discountPrice");
                }
              });
            } else {
              print("work type 2");
              if (productType) {
                discountPrice.value =
                    (value.couponAmount.toInt() / 100).toInt() * subTotal;
              }
            }
          } else {
            if (type) {
              myList.forEach((element) {
                print("Work again again");
                if (element.type == 0) {
                  print("${element.quantity}");
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
                      " ggBrand $isHaveBrand , CCategory $isHaveCategory, Product $isHaveProduct");
                  if (isHaveProduct || isHaveCategory || isHaveBrand) {
                    var tt = (element.price.toInt()) * element.quantity;

                    int newPrice = (tt ~/ 100) * value.couponAmount.toInt();
                    print(
                        "Product price ${element.totalPrice}  Quantity New ${element.quantity} tt $tt , new Price $newPrice");
                    discountPrice = discountPrice + newPrice;
                  }
                } else {
                  print("Work once ${element.quantity}");
                }
              });
            } else {
              print("work type 3 $subTotal");
              print("${(subTotal * 10) / 100}");
              if (productType) {
                discountPrice.value =
                    ((subTotal * value.couponAmount.toInt()) / 100).toInt();
              }
            }
          }
        }
        print("work indsdd jhj");
        if (deliverySystem.value == "Dhaka") {
          print("work ind dd");
          if (deliverOptionIsHome.value) {
            if (value.freeShipping) {
              totalAmount.value =
                  totalAmount.value - (60 + discountPrice.value);
            } else {
              totalAmount.value = totalAmount.value - discountPrice.value;
            }
          } else {
            if (value.freeShipping) {
              totalAmount.value =
                  totalAmount.value - (150 + discountPrice.value);
            } else {
              totalAmount.value = totalAmount.value - discountPrice.value;
            }
          }
        } else {
          print("work indsdd");
          if (deliverOptionIsHome.value) {
            if (value.freeShipping) {
              print("work ind");
              totalAmount.value =
                  totalAmount.value - (150 + discountPrice.value);
            } else {
              totalAmount.value = totalAmount.value - discountPrice.value;
            }
          } else {
            if (value.freeShipping) {
              totalAmount.value =
                  totalAmount.value - (120 + discountPrice.value);
            } else {
              totalAmount.value = totalAmount.value - discountPrice.value;
            }
          }
        }
        print("${value.couponAmount} and ${discountPrice}");
      } else {
        isCouponValid.value = false;
        Fluttertoast.showToast(msg: "Coupon is not valid");
        print("Coupon is not valid");
      }
    }
    context.loaderOverlay.hide();
  }

  clearCoupon({required double amount, required bool type}) {
    isCouponApplied.value = false;
    isFreeShipiing.value = false;
    discountPrice.value = 0;

    if (type) {
      if (deliverySystem.value == "Dhaka") {
        if (deliverOptionIsHome.value) {
          totalAmount.value = _cartController.subTotalAmount.value + 60;
        } else {
          totalAmount.value = _cartController.subTotalAmount.value + 150;
        }
      } else {
        if (deliverOptionIsHome.value) {
          totalAmount.value = _cartController.subTotalAmount.value + 150;
        } else {
          totalAmount.value = _cartController.subTotalAmount.value + 120;
        }
      }
    } else {
      if (deliverySystem.value == "Dhaka") {
        if (deliverOptionIsHome.value) {
          totalAmount.value = amount + 60;
        } else {
          totalAmount.value = amount + 150;
        }
      } else {
        if (deliverOptionIsHome.value) {
          totalAmount.value = amount + 150;
        } else {
          totalAmount.value = amount + 120;
        }
      }
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
      required int shippingFee,
      required int discountPrice,
      required int subTotal,
      required String orderFrom,
      required bool isOrder,
      required String mobile,
      required int points,
      required String email}) async {
    print("$shippingFee , $discountPrice , $subTotal");
    context.loaderOverlay.show();
    List<CartItemModel> list = [];
    if (orderType) {
      _cartController.cartList.value.forEach((element) {
        if (element.type != 0) {
          orderFromValue.value = true;
        }
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
              shippingFee: shippingFee,
              discountPrice: isPointApplied.value && points != 0
                  ? discountPrice + points
                  : discountPrice,
              subTotal: subTotal,
              orderFrom: orderFromValue.value ? "Discounted" : "General",
              orderStatus: orderStatus,
              isOrder: isOrder,
              mobile: mobile,
              email: email,
              deliverySystem: deliveryType.value);

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

            pointLossFn(context: context, points: points);
          }
        }
      } else {
        context.loaderOverlay.hide();
      }
    } else {
      if (orderFromValue.value == false) {
        orderFromValue.value = true;
      } else {
        orderFromValue.value = false;
      }
      dataList.forEach((element) {
        print(
            "Item add ${element.total_price} ${element.amount_item} ${int.parse(element.amount_item) * int.parse(element.quantity)}");
        list.add(CartItemModel(
            item: element.item,
            quantity: element.quantity.toString(),
            attr: "colors:red",
            amount_item: element.amount_item,
            total_price:
                (int.parse(element.amount_item) * int.parse(element.quantity))
                    .toString()));
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
              coupen: isCouponApplied.value ? couponId.value : null,
              total: total,
              items: result,
              shippingFee: shippingFee,
              discountPrice: isPointApplied.value && points != 0
                  ? discountPrice + points
                  : discountPrice,
              subTotal: subTotal,
              orderFrom: orderFromValue.value ? "Discounted" : "General",
              orderStatus: orderStatus,
              isOrder: isOrder,
              mobile: mobile,
              email: email,
              deliverySystem: deliveryType.value);

          if (res == false) {
            context.loaderOverlay.hide();
            Fluttertoast.showToast(
                msg: "Error to Complete Order", toastLength: Toast.LENGTH_LONG);
            print("Error to Complete Order");
          } else {
            print("result ok");
            pointLossFn(context: context, points: points);
          }
        }
      } else {
        context.loaderOverlay.hide();
      }
    }
  }

  pointLossFn({required int points, required BuildContext context}) async {
    if (isPointApplied.value == false || points == 0 || points < 11) {
      paymentProcessFn(context);
    } else {
      var result = await ApiService.lossUserPoints(
          profileId: int.parse(_userDataController.profileId.value),
          points: points);
      if (result) {
        int pt = _userDataController.points.value;
        preferences.setInt(CommonData.points, pt == 0 ? 0 : pt - points);
        _userDataController.points.value = pt == 0 ? 0 : pt - points;
        paymentProcessFn(context);
      } else {
        paymentProcessFn(context);
      }
    }
  }

  paymentProcessFn(BuildContext context) async {
    if (isCashOn.value) {
      if (totalAmount.value > 1000) {
        var pointValue = await ApiService.setUserPoints(
            profileId: int.parse(_userDataController.profileId.value),
            points: totalAmount.value ~/ 100);

        if (pointValue) {
          int pt = _userDataController.points.value;
          preferences.setInt(
              CommonData.points,
              pt == 0
                  ? totalAmount.value ~/ 100
                  : pt + (totalAmount.value ~/ 100));
          _userDataController.points.value = pt == 0
              ? totalAmount.value ~/ 100
              : pt + (totalAmount.value ~/ 100);
          context.loaderOverlay.hide();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => OrderConfirm()));
        } else {
          context.loaderOverlay.hide();
          print("Point add error");
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => OrderConfirm()));
        }
      } else {
        context.loaderOverlay.hide();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => OrderConfirm()));
      }
    } else {
      if (totalAmount.value > 1000) {
        var pointValue = await ApiService.setUserPoints(
            profileId: int.parse(_userDataController.profileId.value),
            points: totalAmount.value ~/ 100);
        if (pointValue) {
          int pt = _userDataController.points.value;
          preferences.setInt(
              CommonData.points,
              pt == 0
                  ? totalAmount.value ~/ 100
                  : pt + (totalAmount.value ~/ 100));
          _userDataController.points.value = pt == 0
              ? totalAmount.value ~/ 100
              : pt + (totalAmount.value ~/ 100);
          goToSSLPage(context);
        } else {
          goToSSLPage(context);
        }
      } else {
        goToSSLPage(context);
      }
    }
  }

  goToSSLPage(BuildContext context) async {
    var resultt = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    var result =
        await ApiService.paymentProcess(accessToken: resultt['access']);
    if (result.runtimeType == int) {
      context.loaderOverlay.hide();
      Fluttertoast.showToast(msg: "Error to pay with SSLCOMMERZ");
    } else if (result.runtimeType == false) {
      context.loaderOverlay.hide();
      Fluttertoast.showToast(msg: "Error to pay with SSLCOMMERZ");
    } else {
      context.loaderOverlay.hide();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => PaymentPage(
                    url: result.toString(),
                  )));
    }
  }
}
