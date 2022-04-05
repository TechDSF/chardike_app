import 'package:chardike/screens/FlashSaleDetails/screens/flash_sale_details.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:flutter/cupertino.dart';

var routes = <String, WidgetBuilder>{
  MainScreen.routeName: (context)=> MainScreen(),
  FlashSaleDetails.routeName: (context) => FlashSaleDetails(),
  ProductDetails.routeName: (context) => ProductDetails(),
  TopProductPage.routeName: (context) => TopProductPage()
};
