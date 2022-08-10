import 'package:chardike/screens/AuthenticationPage/screens/change_password_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/forgot_password.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/otp_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/register_screen.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/CheckOutPage/screens/check_out_page.dart';
import 'package:chardike/screens/FlashSaleDetails/screens/flash_sale_details.dart';
import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/PaymentMethodPage/screen/payment_screen.dart';
import 'package:chardike/screens/PopularProduct/popular_product.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/screens/SearchPage/screen/main_search_screen.dart';
import 'package:chardike/screens/SplashScreen/splash_screen.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_main.dart';
import 'package:chardike/screens/TopProduct/screens/top_product_page.dart';
import 'package:chardike/screens/TopRankProduct/screens/top_rank_product.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/add_new_address.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/my_address.dart';
import 'package:chardike/screens/UserPage/components/MyLikes/my_likes.dart';
import 'package:chardike/screens/UserPage/components/WelcomePackage/free_deals.dart';
import 'package:chardike/screens/UserPage/components/WelcomePackage/free_gifts.dart';
import 'package:chardike/screens/UserPage/components/WelcomePackage/free_money.dart';
import 'package:chardike/screens/UserPage/components/WelcomePackage/free_vouchers.dart';
import 'package:chardike/screens/UserPage/components/about_us.dart';
import 'package:chardike/screens/UserPage/components/edit_phone_page.dart';
import 'package:chardike/screens/UserPage/components/link_social_media.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/my_purchases.dart';
import 'package:chardike/screens/UserPage/components/return_policy.dart';
import 'package:chardike/screens/UserPage/screen/account_setting.dart';
import 'package:chardike/screens/UserPage/screen/edit_profile.dart';
import 'package:chardike/screens/UserPage/screen/inputbox_page.dart';
import 'package:chardike/screens/WheelPage/screen/wheel_screen.dart';
import 'package:chardike/test.dart';
import 'package:flutter/cupertino.dart';

import 'screens/UserPage/components/help_center.dart';

var routes = <String, WidgetBuilder>{
  SplashScreen.routeName: (context) => SplashScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  FlashSaleDetails.routeName: (context) => FlashSaleDetails(),
  ProductDetails.routeName: (context) => ProductDetails(),
  TopProductPage.routeName: (context) => TopProductPage(),
  CartScreen.routeName: (context) => CartScreen(),
  SearchScreen.routeName: (context) => SearchScreen(),
  AccountSetting.routeName: (context) => AccountSetting(),
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
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
  HelpCenter.routeName: (context) => HelpCenter(),
  TopProductMain.routeName: (context) => TopProductMain(),
  TopRankProduct.routeName: (context) => TopRankProduct(),
  PopularProduct.routeName: (context) => PopularProduct(),
  MyLikes.routeName: (context) => MyLikes(),
  FreeVouchers.routeName: (context) => FreeVouchers(),
  FreeGifts.routeName: (context) => FreeGifts(),
  FreeMoney.routeName: (context) => FreeMoney(),
  FreeDeals.routeName: (context) => FreeDeals(),
  MyPurchases.routeName: (context) => MyPurchases(),
  MyAddress.routeName: (context) => MyAddress(),
  AddNewAddress.routeName: (context) => AddNewAddress(),
  AboutUs.routeName: (context) => AboutUs(),
  ReturnPolicy.routeName: (context) => ReturnPolicy(),
  Test.routeName: (context) => Test()
};
