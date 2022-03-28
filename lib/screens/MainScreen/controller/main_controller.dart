import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/HomePage/screen/home_screen.dart';
import 'package:chardike/screens/MenuPage/screen/menu_screen.dart';
import 'package:chardike/screens/SearchPage/screen/search_screen.dart';
import 'package:chardike/screens/UserPage/screen/user_screen.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  var isLoading = false.obs;
  var tapIndex = 2.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var pageList = [
    MenuScreen(),
    SearchScreen(),
    HomeScreen(),
    UserScreen(),
    CartScreen()
  ];
}