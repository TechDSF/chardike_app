import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CheckOutController extends GetxController {
  var isLaoding = false.obs;
  late SharedPreferences preferences;

  var mobileTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;

  var deliverOptionIsHome = true.obs;
  var totalAmount = 0.0.obs;

  @override
  void onInit() {
    getSharedPreferenceData();
    super.onInit();
  }

  getSharedPreferenceData() async {
    preferences = await SharedPreferences.getInstance();
  }
}
