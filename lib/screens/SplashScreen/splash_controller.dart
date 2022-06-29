import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../MainScreen/main_screen.dart';

class SplashController extends GetxController {
  getSharedPreferenceData(BuildContext context) async {
    Future.delayed(Duration(milliseconds: 10), () {
      Navigator.popAndPushNamed(context, MainScreen.routeName);
      dispose();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
