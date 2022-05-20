import 'package:chardike/screens/AuthenticationPage/screens/change_password_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/forgot_password.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/otp_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/register_screen.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/ChardikeService/screens/about_chardike.dart';
import 'package:chardike/screens/ChardikeService/screens/chardike_policy.dart';
import 'package:chardike/screens/ChardikeService/screens/community_rulse.dart';
import 'package:chardike/screens/ChardikeService/screens/help_center.dart';
import 'package:chardike/screens/ChardikeService/screens/tips_tricks_screen.dart';
import 'package:chardike/screens/CheckOutPage/screens/check_out_page.dart';
import 'package:chardike/screens/FlashSaleDetails/screens/flash_sale_details.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/PaymentMethodPage/screen/payment_screen.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/SearchPage/screen/search_screen.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:chardike/screens/UserPage/components/edit_phone_page.dart';
import 'package:chardike/screens/UserPage/components/link_social_media.dart';
import 'package:chardike/screens/UserPage/screen/account_setting.dart';
import 'package:chardike/screens/UserPage/screen/edit_profile.dart';
import 'package:chardike/screens/UserPage/screen/inputbox_page.dart';
import 'package:chardike/screens/WheelPage/screen/wheel_screen.dart';
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
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  EditPhone.routeName: (context) => EditPhone(),
  LinkSocialMedia.routeName: (context) => LinkSocialMedia(),
  WheelScreen.routeName: (context) => WheelScreen(),
  ForgotPassword.routeName: (context) => ForgotPassword(),
  OtpScreen.routeName: (context) => OtpScreen(),
  ChangePasswordScreen.routeName:(context) => ChangePasswordScreen(),
  HelpCenter.routeName: (context) => HelpCenter(),
  TipsTricksScreen.routeName: (context) => TipsTricksScreen(),
  CommunityRules.routeName: (context) => CommunityRules(),
  ChardikePolicy.routeName: (context) => ChardikePolicy(),
  AboutChardike.routeName: (context) => AboutChardike()
};
