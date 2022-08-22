import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CartPage/screen/cart_item.dart';
import 'package:chardike/screens/CheckOutPage/screens/check_out_page.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../HomePage/components/all_product_details.dart';
import '../../HomePage/model/product_model.dart';
import '../../ProductDetails/product_details.dart';
import '../model/cart_item_model.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.put(CartController());
  static const String routeName = "/cart_screen";
  int counter = 0;
  bool isTab = SizeConfig.screenWidth > 768;
  final HomeController _homeController = Get.put(HomeController());
  final CommonController _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    _cartController.getCartProduct();
    // _cartController.getTotalAmount();

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
        bottomNavigationBar: Obx(() {
          if (_cartController.cartList.value.isEmpty) {
            return SizedBox();
          } else {
            return Container(
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
                                _cartController.subTotalAmount.value.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  )),
                  InkWell(
                    onTap: () {
                      if (_commonController.isLogin.value) {
                        Navigator.pushNamed(context, CheckOutPage.routeName,
                            arguments: {
                              "type": true,
                              "productType": true,
                              "quantity": 0,
                              "data": CartItemModel(
                                  item: "",
                                  attr: "",
                                  amount_item: "",
                                  total_price: "",
                                  quantity: ""),
                              "amount": "10"
                            });
                      } else {
                        Navigator.pushNamed(context, LoginScreen.routeName);
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
                        "CHECKOUT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            );
          }
        }),
        body: Obx(() {
          if (_cartController.cartList.value.isEmpty) {
            return Column(
              children: <Widget>[
                Expanded(
                    flex: 4, child: Image.asset("asset/images/empty_cart.png")),
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
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AllProductDetails()));
                            },
                            child: Container(
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
                          ),
                        ],
                      ),
                    ))
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: Column(
                      children: [
                        Obx(
                          () => ListView.builder(
                              itemCount: _cartController.cartList.value.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var result =
                                    _cartController.cartList.value[index];
                                //return Container(color: Colors.blue,height: 100,margin: EdgeInsets.all(10),);
                                return Slidable(
                                  startActionPane: ActionPane(
                                    motion: const ScrollMotion(),
                                    children: [
                                      SlidableAction(
                                        onPressed: ((context) {
                                          _cartController.callDelete(result.id);
                                        }),
                                        backgroundColor: AllColors.mainColor,
                                        foregroundColor: Colors.white,
                                        icon: Icons.delete,
                                        label: 'Delete',
                                      ),
                                    ],
                                  ),
                                  child: CartItem(
                                    cartModel:
                                        _cartController.cartList.value[index],
                                    itemCount: result.quantity,
                                    itemPrice: _cartController
                                        .cartList.value[index].price,
                                  ),
                                );
                              }),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
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
                    if (_homeController.isPopularProductLoading.value) {
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
                                  crossAxisCount: isTab ? 3 : 2,
                                  crossAxisSpacing:
                                      getProportionateScreenWidth(5),
                                  mainAxisSpacing:
                                      getProportionateScreenWidth(5),
                                  childAspectRatio: CommonData.aspactRatio(
                                      height: isTab
                                          ? SizeConfig.screenWidth * 0.7
                                          : SizeConfig.screenWidth * 0.7,
                                      context: context,
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5)),
                          itemCount: _homeController.popularProductList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            ProductModel result =
                                _homeController.popularProductList[index];
                            return InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ProductDetails.routeName,
                                    arguments: {
                                      "type": true,
                                      "ds": "0",
                                      "product": result
                                    });
                              },
                              child: SizedBox(
                                height: isTab
                                    ? SizeConfig.screenWidth * 0.7
                                    : SizeConfig.screenWidth * 0.5,
                                width: SizeConfig.screenWidth * 0.32,
                                child: Card(
                                  color: Color(0xFFF3F5F8),
                                  shadowColor: Colors.grey,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        SizeConfig.screenWidth * 0.02),
                                  ),
                                  child: Column(children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: Container(
                                        height: isTab
                                            ? SizeConfig.screenWidth * 0.3
                                            : SizeConfig.screenWidth * 0.43,
                                        width: double.infinity,
                                        padding: EdgeInsets.only(
                                            top:
                                                SizeConfig.screenWidth * 0.015),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                  SizeConfig.screenWidth *
                                                      0.02),
                                            ),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    result.featureImage),
                                                fit: BoxFit.fill)),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                padding: EdgeInsets.all(
                                                    SizeConfig.screenWidth *
                                                        0.004),
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topRight: Radius
                                                            .circular(SizeConfig
                                                                    .screenWidth *
                                                                0.015),
                                                        bottomRight: Radius
                                                            .circular(SizeConfig
                                                                    .screenWidth *
                                                                0.015)),
                                                    color: Colors.green),
                                                child: Text(
                                                  "${CommonData.calculateDiscount(regularPrice: double.parse(result.regularPrice), sellingPrice: double.parse(result.sellingPrice))}%",
                                                  //"${result.regularPrice}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: SizeConfig
                                                              .screenWidth *
                                                          0.023),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    height:
                                                        SizeConfig.screenWidth *
                                                            0.05,
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.05,
                                                    child: Icon(
                                                      Icons.favorite,
                                                      color: Colors.orange,
                                                      size: SizeConfig
                                                              .screenWidth *
                                                          0.03,
                                                    ),
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Colors.grey
                                                            .withOpacity(0.3)),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        SizeConfig.screenWidth *
                                                            0.008,
                                                  ),
                                                ],
                                              )
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.screenWidth * 0.01,
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.screenWidth * 0.003),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(
                                                  SizeConfig.screenWidth *
                                                      0.02),
                                              bottomRight: Radius.circular(
                                                  SizeConfig.screenWidth *
                                                      0.02))),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Text(
                                              result.productName,
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.02
                                                      : SizeConfig.screenWidth *
                                                          0.03,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            RichText(
                                                text: TextSpan(children: [
                                              TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: isTab
                                                          ? SizeConfig
                                                                  .screenWidth *
                                                              0.025
                                                          : SizeConfig
                                                                  .screenWidth *
                                                              0.03),
                                                  text: "₺" +
                                                      result.sellingPrice
                                                          .toString()),
                                              TextSpan(
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontSize: isTab
                                                          ? SizeConfig
                                                                  .screenWidth *
                                                              0.018
                                                          : SizeConfig
                                                                  .screenWidth *
                                                              0.022),
                                                  text: " ₺" +
                                                      result.regularPrice
                                                          .toString())
                                            ])),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                RatingBar.builder(
                                                  initialRating: CommonData
                                                      .calculateRating(
                                                          result.reviews),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: isTab
                                                      ? SizeConfig.screenWidth *
                                                          0.02
                                                      : SizeConfig.screenWidth *
                                                          0.03,
                                                  itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 1.0),
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                                Text(
                                                  "(${result.reviews.length})",
                                                  style: TextStyle(
                                                    fontSize: isTab
                                                        ? SizeConfig
                                                                .screenWidth *
                                                            0.02
                                                        : SizeConfig
                                                                .screenWidth *
                                                            0.03,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ]),
                                    ))
                                  ]),
                                ),
                              ),
                            );
                          });
                    }
                  }),
                ],
              ),
            );
          }
        }));
  }
}
