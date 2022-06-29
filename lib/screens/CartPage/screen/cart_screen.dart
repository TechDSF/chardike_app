import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CartPage/screen/cart_item.dart';
import 'package:chardike/screens/CheckOutPage/screens/check_out_page.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:shimmer/shimmer.dart';

import '../../ProductDetails/product_details.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.put(CartController());
  static const String routeName = "/cart_screen";
  int counter = 0;
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    _cartController.getTotalAmount();

    var _aspectRatio;

    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("SHOPPING CART"),
        ),
        bottomNavigationBar: _cartController.cartList.isEmpty
            ? SizedBox()
            : Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20)),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 50,
                      offset: Offset(5, -2))
                ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: <Widget>[
                        Text("Total: "),
                        Obx(() => Text(
                              CommonData.takaSign +
                                  " " +
                                  _cartController.subTotalAmount.value
                                      .toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))
                      ],
                    )),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CheckOutPage.routeName);
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
                          "CHECKOUT",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
        body: _cartController.cartList.isEmpty
            ? Column(
                children: <Widget>[
                  Expanded(
                      flex: 4,
                      child: Image.asset("asset/images/empty_cart.png")),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.screenWidth * 0.2),
                        child: Column(
                          children: <Widget>[
                            Text(
                              "Your Cart is Empty",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(15)),
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(7),
                            ),
                            Text(
                              "Look's like you haven't added anything in your cart yet ",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(13),
                                  color: Colors.black54),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: getProportionateScreenHeight(20),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(25),
                                  vertical: getProportionateScreenWidth(10)),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(25)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ]),
                              child: Text("Start Shopping"),
                            ),
                          ],
                        ),
                      ))
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        children: [
                          ListView.builder(
                              itemCount: _cartController.cartList.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var result = _cartController.cartList[index];
                                //return Container(color: Colors.blue,height: 100,margin: EdgeInsets.all(10),);
                                return CartItem(
                                  cartModel: _cartController.cartList[index],
                                  itemCount: result.quantity,
                                );
                              }),
                          SizedBox(
                            height: getProportionateScreenHeight(15),
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(5)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(
                                    getProportionateScreenWidth(5))),
                            child: Row(
                              children: <Widget>[
                                const Expanded(
                                    flex: 3,
                                    child: TextField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          hintText: "Coupen code"),
                                    )),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      height: kToolbarHeight - 5,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              getProportionateScreenWidth(5)),
                                          color: Colors.black),
                                      child: const Center(
                                          child: Text(
                                        "Apply Coupen ->",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Container(
                      height: getProportionateScreenHeight(20),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          "asset/icons/three_line_icon.png",
                          height: getProportionateScreenWidth(25),
                          width: getProportionateScreenWidth(25),
                        ),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Text("Just For You"),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Image.asset(
                          "asset/icons/three_line_icon.png",
                          height: getProportionateScreenWidth(25),
                          width: getProportionateScreenWidth(25),
                        )
                      ],
                    ),
                    Obx(() {
                      if (_homeController.isApiProductLoading.value) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.withOpacity(0.1),
                          highlightColor: Colors.grey.withOpacity(0.5),
                          child: Container(
                            height: getProportionateScreenHeight(170),
                            color: Colors.yellow,
                          ),
                        );
                      } else {
                        return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: aspt(300),
                            ),
                            itemCount: _homeController.allProductList.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var result = _homeController.allProductList[
                                  (_homeController.allProductList.length - 1) -
                                      index];
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, ProductDetails.routeName,
                                      arguments: result);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                    top: const BorderSide(
                                        color: Colors.grey, width: 0.5),
                                    left: index % 2 == 0
                                        ? const BorderSide(
                                            color: Colors.grey, width: 0.5)
                                        : const BorderSide(
                                            color: Colors.grey, width: 0),
                                    right: index % 2 == 0
                                        ? const BorderSide(
                                            color: Colors.grey, width: 0)
                                        : const BorderSide(
                                            color: Colors.grey, width: 0.5),
                                    bottom: index ==
                                                _homeController
                                                        .allProductList.length -
                                                    1 ||
                                            index ==
                                                _homeController
                                                        .allProductList.length -
                                                    2
                                        ? const BorderSide(
                                            color: Colors.grey, width: 0.5)
                                        : const BorderSide(
                                            color: Colors.grey, width: 0),
                                  )),
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(8)),
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Stack(
                                          children: <Widget>[
                                            Image.asset(
                                              result.featureImage,
                                              fit: BoxFit.fill,
                                            ),
                                            Positioned(
                                                right: 0,
                                                child: Container(
                                                  height:
                                                      getProportionateScreenWidth(
                                                          20),
                                                  width:
                                                      getProportionateScreenWidth(
                                                          45),
                                                  decoration: BoxDecoration(
                                                      color: Colors.orange,
                                                      borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(
                                                              getProportionateScreenWidth(
                                                                  10)),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  getProportionateScreenWidth(
                                                                      10)))),
                                                  child: Center(
                                                      child: Text(
                                                    "-10%",
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                10),
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                ))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      Text(
                                        result.productName.toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(
                                                    12)),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal:
                                                getProportionateScreenWidth(5)),
                                        child: Row(
                                          children: [
                                            Text(
                                              "₺ " +
                                                  result.variant[0].sellingPrice
                                                      .toString() +
                                                  " ",
                                              style: TextStyle(
                                                  color: AllColors.mainColor),
                                            ),
                                            Text(
                                              "₺" +
                                                  result.variant[0].regularPrice
                                                      .toString(),
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          10)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      Row(
                                        children: [
                                          RatingBarIndicator(
                                            rating: 3,
                                            itemBuilder: (context, index) =>
                                                const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            itemCount: 5,
                                            itemSize:
                                                getProportionateScreenWidth(10),
                                            direction: Axis.horizontal,
                                          ),
                                          Text(
                                            "(5)",
                                            style: TextStyle(
                                                fontSize:
                                                    getProportionateScreenWidth(
                                                        10)),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }),
                  ],
                ),
              ));
  }
}
