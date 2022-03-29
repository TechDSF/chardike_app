import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/MainScreen/controller/main_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../CommonData/all_colors.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final MainController _mainController = Get.put(MainController());


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Obx(()=> _mainController.pageList[_mainController.tapIndex.value]),
      bottomNavigationBar: Obx(()=>BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bars),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.user),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.cartShopping),
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
            Navigator.push(context, MaterialPageRoute(builder: (_)=>CartScreen()));
          }else{
            _mainController.tapIndex.value = value;
          }

        },
      ),)
    );
  }
}
