import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController{
  var isLaoding = false.obs;

  var mobileTextEditingController = TextEditingController().obs;
  var emailTextEditingController = TextEditingController().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    mobileTextEditingController.value.text = "01717601905";
    emailTextEditingController.value.text = "baskeyjames10@gmail.com";
    super.onInit();
  }
}