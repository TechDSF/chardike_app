import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/MainScreen/controller/main_controller.dart';
import 'package:chardike/screens/SearchPage/screen/main_search_screen.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/my_address.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../CommonData/all_colors.dart';
import '../FeedPage/screens/feed_page.dart';
import '../HomePage/screen/home_screen.dart';
import '../UserPage/screen/user_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static const String routeName = "/mainScreen";
  final MainController _mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    bool isTab = SizeConfig.screenWidth > 768;
    print("hello------");

    return Scaffold(
        body: Obx(() =>
            _mainController.list.elementAt(_mainController.tapIndex.value)),
        bottomNavigationBar: Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(getProportionateScreenWidth(10)),
                topRight: Radius.circular(getProportionateScreenWidth(10))),
            child: BottomNavigationBar(
              backgroundColor: Color(0xFFB6CAEF),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: CommonData.bottomIcon(
                      icon: "asset/icons/newspaper.png",
                      color: _mainController.tapIndex.value == 0
                          ? Colors.grey
                          : Colors.black.withOpacity(0.6),
                      isTab: isTab),
                  label: 'Feed',
                ),
                BottomNavigationBarItem(
                  icon: CommonData.bottomIcon(
                      icon: "asset/icons/search_icon.png",
                      color: _mainController.tapIndex.value == 1
                          ? Colors.grey
                          : Colors.black.withOpacity(0.6),
                      isTab: isTab),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: CommonData.bottomIcon(
                      icon: "asset/icons/home.png",
                      color: _mainController.tapIndex.value == 2
                          ? Colors.grey
                          : Colors.black.withOpacity(0.6),
                      isTab: isTab),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: CommonData.bottomIcon(
                      icon: "asset/icons/cart.png",
                      color: _mainController.tapIndex.value == 3
                          ? Colors.grey
                          : Colors.black.withOpacity(0.6),
                      isTab: isTab),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: CommonData.bottomIcon(
                      icon: "asset/icons/user.png",
                      color: _mainController.tapIndex.value == 4
                          ? Colors.grey
                          : Colors.black.withOpacity(0.6),
                      isTab: isTab),
                  label: 'User',
                ),
              ],
              unselectedItemColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              unselectedLabelStyle: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              selectedLabelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: getProportionateScreenWidth(13)),
              currentIndex: _mainController.tapIndex.value,
              selectedItemColor: Colors.grey,
              onTap: (value) {
                if (value == 3) {
                  Navigator.pushNamed(context, CartScreen.routeName);
                } else if (value == 1) {
                  Navigator.pushNamed(context, SearchScreen.routeName);
                } else {
                  _mainController.tapIndex.value = value;
                }
              },
            ),
          ),
        ));
  }
}
