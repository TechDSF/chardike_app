import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CheckOutPage/controller/check_out_controller.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/my_address.dart';
import 'package:chardike/size_config.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../CommonData/common_data.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({Key? key}) : super(key: key);

  static const String routeName = "/check_out_page";
  final CartController _cartController = Get.put(CartController());
  final CheckOutController _checkOutController = Get.put(CheckOutController());
  final UserDataController _userDataController = Get.put(UserDataController());
  final TextEditingController _couponTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _checkOutController.onInit();
    _checkOutController.isCouponApplied.value = false;
    _checkOutController.isCouponMatched.value = true;

    final args = ModalRoute.of(context)!.settings.arguments as Map;
    _checkOutController.deliverOptionIsHome.value = true;
    if (args['type'] == true) {
      _checkOutController.totalAmount.value =
          _cartController.subTotalAmount.value + 60;
    } else {
      _checkOutController.totalAmount.value = double.parse(args['amount']) + 60;
      _checkOutController.dataList.clear();
      _checkOutController.dataList.add(args['data']);
    }

    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Checkout"),
          centerTitle: false,
        ),
        bottomNavigationBar: Container(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          height: getProportionateScreenWidth(60),
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 50,
                offset: Offset(5, -2))
          ]),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "Total: ",
                        style: CommonData.customTextStyle(),
                      ),
                      Obx(() => Text(
                            CommonData.takaSign +
                                " " +
                                "${_checkOutController.totalAmount.value}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  Text(
                    "VAT included, where applicable",
                    style: CommonData.customTextStyle(),
                  )
                ],
              )),
              InkWell(
                onTap: () {
                  if (_checkOutController
                      .mobileTextEditingController.value.text.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please enter your mobile number!");
                  } else if (_checkOutController
                      .userShippingAddress.value.isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please enter your delivery address!");
                  } else {
                    if (_checkOutController
                            .mobileTextEditingController.value.text.length !=
                        11) {
                      Fluttertoast.showToast(
                          msg: "Please enter valid mobile number!");
                    } else {
                      _checkOutController.confirmOrder(
                          context: context,
                          orderType: args['type'],
                          refCode: "string",
                          address: _checkOutController.addressId.value,
                          billingAddress:
                              _checkOutController.firstBillingId.value == 0
                                  ? _checkOutController.addressId.value
                                  : _checkOutController.firstBillingId.value,
                          coupen: _checkOutController.isCouponMatched.value
                              ? _couponTextController.text
                              : null,
                          total: _checkOutController.totalAmount.value
                              .toInt()
                              .toString(),
                          orderStatus: "Order Processing",
                          isOrder: true,
                          mobile: _checkOutController
                              .mobileTextEditingController.value.text,
                          email: _checkOutController
                              .emailTextEditingController.value.text,
                          firstDeliverry:
                              _checkOutController.deliverOptionIsHome.value
                                  ? false
                                  : true);
                    }

                    // Navigator.pushNamed(context, PaymentScreen.routeName);
                  }
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: getProportionateScreenWidth(5)),
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      color: AllColors.mainColor,
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(10))),
                  height: getProportionateScreenWidth(40),
                  child: const Center(
                      child: Text(
                    "Place Order",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const Icon(
                          Icons.location_pin,
                          color: Colors.cyan,
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(5),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Obx(
                              () => Text(_userDataController.fullName.value),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                            Obx(() {
                              if (_checkOutController
                                  .firstAddressValue.value.isEmpty) {
                                return SizedBox();
                              } else {
                                return RichText(
                                    text: TextSpan(
                                        style: TextStyle(color: Colors.black),
                                        children: [
                                      WidgetSpan(
                                          child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                getProportionateScreenWidth(5),
                                            vertical:
                                                getProportionateScreenWidth(2)),
                                        margin: EdgeInsets.only(
                                            right:
                                                getProportionateScreenWidth(5)),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                getProportionateScreenWidth(
                                                    10)),
                                            color: AllColors.mainColor),
                                        child: Text(
                                          "HOME",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                      TextSpan(
                                        text: _checkOutController
                                            .firstAddressValue.value,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ]));
                              }
                            }),
                            SizedBox(
                              height: getProportionateScreenHeight(5),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyAddress.routeName,
                                arguments: 1);
                          },
                          child: Text(
                            "EDIT",
                            style: TextStyle(
                                color: AllColors.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(Icons.sticky_note_2_outlined, color: Colors.cyan),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(
                                _checkOutController.firstBillingId.value == 0
                                    ? "Bill to the same address"
                                    : "Bill Address")),
                            Obx(
                              () => Text(
                                "" +
                                    _checkOutController
                                        .firstBillingAddress.value,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, MyAddress.routeName,
                                arguments: 2);
                          },
                          child: Text(
                            "EDIT",
                            style: TextStyle(
                                color: AllColors.mainColor,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.phone, color: Colors.cyan),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(
                            child: Obx(() => TextField(
                                  controller: _checkOutController
                                      .mobileTextEditingController.value,
                                  decoration: InputDecoration(
                                    hintText: "Mobile Number",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                          getProportionateScreenWidth(5)),
                                      borderSide: const BorderSide(
                                          color: Colors.grey, width: 0.0),
                                    ),
                                  ),
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Row(
                      children: <Widget>[
                        const Icon(Icons.email_outlined, color: Colors.cyan),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(
                            child: TextField(
                          controller: _checkOutController
                              .emailTextEditingController.value,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(5)),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                          ),
                        )),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              DottedLine(
                dashLength: 30,
                dashGapLength: 30,
                dashGapRadius: getProportionateScreenWidth(5),
                lineThickness: getProportionateScreenHeight(5),
                dashColor: Colors.transparent,
                dashGapColor: AllColors.mainColor,
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Delivery Option",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(13)),
                    ),
                    SizedBox(
                      height: getProportionateScreenWidth(5),
                      width: double.infinity,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            if (_checkOutController.isFreeShipiing.value ==
                                false) {
                              _checkOutController.deliverOptionIsHome.value =
                                  true;
                              if (args['type']) {
                                _checkOutController.totalAmount.value =
                                    _cartController.subTotalAmount.value + 60;
                              } else {
                                _checkOutController.totalAmount.value =
                                    double.parse(args['amount']) + 60;
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "You got Free Shipping Coupon");
                            }
                          },
                          child: Obx(
                            () => Container(
                                padding: EdgeInsets.all(
                                    getProportionateScreenWidth(5)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _checkOutController
                                                .deliverOptionIsHome.value
                                            ? AllColors.mainColor
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(5))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(
                                      Icons.check_circle,
                                      color: _checkOutController
                                              .deliverOptionIsHome.value
                                          ? AllColors.mainColor
                                          : Colors.grey,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                    Expanded(
                                        child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          CommonData.takaSign + " 60",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      13)),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenWidth(5),
                                        ),
                                        Text(
                                          "Home Delivery",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      13)),
                                        ),
                                        SizedBox(
                                          height:
                                              getProportionateScreenWidth(5),
                                        ),
                                        Text(
                                          "Est. Arrival: 7 days",
                                          style: TextStyle(
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      13)),
                                        )
                                      ],
                                    ))
                                  ],
                                )),
                          ),
                        )),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(
                          child: InkWell(
                              onTap: () {
                                if (_checkOutController.isFreeShipiing.value ==
                                    false) {
                                  _checkOutController
                                      .deliverOptionIsHome.value = false;

                                  if (args['type']) {
                                    _checkOutController.totalAmount.value =
                                        _cartController.subTotalAmount.value +
                                            150;
                                  } else {
                                    _checkOutController.totalAmount.value =
                                        double.parse(args['amount']) + 150;
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "You got Free Shipping Coupon");
                                }
                              },
                              child: Obx(
                                () => Container(
                                    padding: EdgeInsets.all(
                                        getProportionateScreenWidth(5)),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: _checkOutController
                                                    .deliverOptionIsHome.value
                                                ? Colors.grey
                                                : AllColors.mainColor),
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(5))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.check_circle,
                                          color: _checkOutController
                                                  .deliverOptionIsHome.value
                                              ? Colors.grey
                                              : AllColors.mainColor,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              CommonData.takaSign + " 150",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          13)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenWidth(
                                                      5),
                                            ),
                                            Text(
                                              "Fast Home Delivery",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          13)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenWidth(
                                                      5),
                                            ),
                                            Text(
                                              "12 hours delivery",
                                              style: TextStyle(
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          13)),
                                            )
                                          ],
                                        ))
                                      ],
                                    )),
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Container(
                height: getProportionateScreenWidth(10),
                color: Colors.grey.withOpacity(0.1),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: ListTile(
                        onTap: () {
                          _checkOutController.isCashOn.value = true;
                        },
                        title: const Text("Cash On Delivery"),
                        horizontalTitleGap: 0,
                        leading: Obx(() => Container(
                              height: getProportionateScreenWidth(20),
                              width: getProportionateScreenWidth(20),
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(3)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: _checkOutController.isCashOn.value
                                        ? AllColors.mainColor
                                        : Colors.grey),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _checkOutController.isCashOn.value
                                      ? AllColors.mainColor
                                      : Colors.transparent,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ))),
                  ),
                  Flexible(
                    child: ListTile(
                        onTap: () {
                          _checkOutController.isCashOn.value = false;
                        },
                        title: const Text("SSLCOMMERZ"),
                        horizontalTitleGap: 0,
                        leading: Obx(() => Container(
                              height: getProportionateScreenWidth(20),
                              width: getProportionateScreenWidth(20),
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(3)),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: _checkOutController.isCashOn.value
                                        ? Colors.grey
                                        : AllColors.mainColor),
                                shape: BoxShape.circle,
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: _checkOutController.isCashOn.value
                                      ? Colors.transparent
                                      : AllColors.mainColor,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ))),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(getProportionateScreenWidth(15)),
                padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                      topRight:
                          Radius.circular(getProportionateScreenWidth(10)),
                      bottomLeft:
                          Radius.circular(getProportionateScreenWidth(10)),
                      bottomRight:
                          Radius.circular(getProportionateScreenWidth(10)),
                    )),
                child: Obx(() {
                  if (_checkOutController.isCashOn.value) {
                    return Text("Pay with cash upon delivery.");
                  } else {
                    return Text("Pay with SSLCOMMERZ.");
                  }
                }),
              ),
              SizedBox(
                height: getProportionateScreenWidth(20),
              ),
              Obx(
                () => Container(
                  height: getProportionateScreenHeight(50),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: _checkOutController.isCouponMatched.value
                              ? Colors.grey
                              : Colors.red),
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(10))),
                  padding:
                      EdgeInsets.only(left: getProportionateScreenWidth(5)),
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  child: Row(children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: _couponTextController,
                      decoration: InputDecoration(
                          hintText: "Coupon",
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    )),
                    InkWell(
                      onTap: () {
                        if (_checkOutController.isCouponApplied.value) {
                          _couponTextController.clear();
                          _checkOutController.clearCoupon();
                        } else {
                          _checkOutController.getCoupon(
                              context: context,
                              couponName: _couponTextController.text,
                              type: args['type'],
                              list:
                                  _cartController.subTotalAmount.value.toInt());
                          // _checkOutController.getCoupon(
                          //     couponName: _couponTextController.text);
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(
                                    getProportionateScreenWidth(10)),
                                bottomRight: Radius.circular(
                                    getProportionateScreenWidth(10)))),
                        child: Center(
                            child: Obx(() => Text(
                                  _checkOutController.isCouponApplied.value
                                      ? "Clear Coupon"
                                      : "Apply Coupen",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))),
                      ),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(30),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Subtotal",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w500),
                    ),
                    args['type']
                        ? Text(
                            CommonData.takaSign +
                                " " +
                                "${_cartController.subTotalAmount.value}",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.w600),
                          )
                        : Text(
                            CommonData.takaSign + " " + "${args['amount']}",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.w600),
                          )
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Obx(() {
                if (!_checkOutController.isCouponApplied.value) {
                  return SizedBox();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Coupon",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              fontWeight: FontWeight.w500),
                        ),
                        Obx(() => _checkOutController.isCouponApplied.value
                            ? Text(
                                "- " +
                                    CommonData.takaSign +
                                    " " +
                                    "${_checkOutController.discountPrice.value}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600),
                              )
                            : Text(
                                "- " +
                                    CommonData.takaSign +
                                    " " +
                                    "${_checkOutController.discountPrice.value}",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    fontWeight: FontWeight.w600),
                              ))
                      ],
                    ),
                  );
                }
              }),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
              Obx(() {
                if (!_checkOutController.isCouponApplied.value) {
                  return SizedBox();
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(
                          () => Text(
                            _checkOutController.isFreeShipiing.value
                                ? "You Got Free Shipping"
                                : "",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  );
                }
              }),
              SizedBox(
                height: getProportionateScreenWidth(10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
