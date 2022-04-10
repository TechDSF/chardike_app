import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/MainScreen/controller/main_controller.dart';
import 'package:chardike/screens/SearchPage/screen/search_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../CommonData/all_colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  static const String routeName = "/mainScreen";
  final MainController _mainController = Get.put(MainController());


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(()=> _mainController.pageList[_mainController.tapIndex.value]),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CommonData.bottomIcon(icon: "asset/icons/newspaper.png", color: _mainController.tapIndex.value == 0?AllColors.mainColor:Colors.grey),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: CommonData.bottomIcon(icon: "asset/icons/search_icon.png", color: _mainController.tapIndex.value == 1?AllColors.mainColor:Colors.grey),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: CommonData.bottomIcon(icon: "asset/icons/home.png", color: _mainController.tapIndex.value == 2?AllColors.mainColor:Colors.grey),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CommonData.bottomIcon(icon: "asset/icons/user.png", color: _mainController.tapIndex.value == 3?AllColors.mainColor:Colors.grey),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: CommonData.bottomIcon(icon: "asset/icons/cart.png", color: _mainController.tapIndex.value == 4?AllColors.mainColor:Colors.grey),
            label: 'Cart',
          ),
        ],
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(
          color: Colors.black
        ),
        selectedLabelStyle: TextStyle(
          color: AllColors.mainColor
        ),
        currentIndex: _mainController.tapIndex.value,
        selectedItemColor: AllColors.mainColor,
        onTap: (value){
          if(value == 4){
            Navigator.pushNamed(context, CartScreen.routeName);
          }else if(value == 1){
            Navigator.pushNamed(context, SearchScreen.routeName);
          }
          else{
            _mainController.tapIndex.value = value;
          }

        },
      ),)
    );
  }
}
