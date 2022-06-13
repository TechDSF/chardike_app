import 'package:chardike/screens/MainScreen/main_screen.dart';
import 'package:chardike/screens/SplashScreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CommonData/common_data.dart';
import '../../size_config.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const String routeName = "/splash_screen";
  final SplashController _splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    _splashController.getSharedPreferenceData(context);
    return Scaffold(
      body: Center(
        child: InkWell(onTap: (){
          Navigator.pushNamed(context, MainScreen.routeName);
        },child: Image.asset("asset/images/chardike_logo.png",height: getProportionateScreenWidth(130),width: getProportionateScreenWidth(130),)),
      ),
    );
  }
}
