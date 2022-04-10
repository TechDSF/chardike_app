import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/CheckOutPage/screens/check_out_page.dart';
import 'package:chardike/screens/FlashSaleDetails/screens/flash_sale_details.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/PaymentMethodPage/screen/payment_screen.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/SearchPage/screen/search_screen.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:chardike/screens/UserPage/screen/account_setting.dart';
import 'package:chardike/screens/UserPage/screen/edit_profile.dart';
import 'package:chardike/screens/UserPage/screen/inputbox_page.dart';
import 'package:flutter/cupertino.dart';

var routes = <String, WidgetBuilder>{
  MainScreen.routeName: (context)=> MainScreen(),
  FlashSaleDetails.routeName: (context) => FlashSaleDetails(),
  ProductDetails.routeName: (context) => ProductDetails(),
  TopProductPage.routeName: (context) => TopProductPage(),
  CartScreen.routeName: (context) => CartScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  AccountSetting.routeName: (contetxt) => AccountSetting(),
  EditProfile.routeName: (context) => EditProfile(),
  InputBoxPage.routeName: (context) => InputBoxPage(),
  CheckOutPage.routeName: (context) => CheckOutPage(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
};