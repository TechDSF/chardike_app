import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/FeedPage/screens/feed_page.dart';
import 'package:chardike/screens/HomePage/screen/home_screen.dart';
import 'package:chardike/screens/NewHome/new_home.dart';
import 'package:chardike/screens/SearchPage/screen/main_search_screen.dart';
import 'package:chardike/screens/UserPage/screen/user_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var isLoading = false.obs;
  var tapIndex = 2.obs;
  var index = 2.obs;
  final CommonController _commonController = Get.put(CommonController());

  var list = [
    FeedPage(),
    SearchScreen(),
    NewHome(),
    //HomeScreen(),
    CartScreen(),
    UserScreen(),
  ];
}
