import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController{
  var isLoading = false.obs;
  late SharedPreferences preferences;
  var isLogin = false.obs;
  var email = "".obs;
  var userName = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getLoginData();
    super.onInit();
  }

  getLoginData()async{
    preferences = await SharedPreferences.getInstance();
    var data = preferences.getBool("isLogin");
    isLogin.value = data!;
    if(data){
      email.value = preferences.getString("email")!;
      userName.value = preferences.getString("username")!;
    }
  }

  logOutOperation({required BuildContext context}){
    preferences.setBool("isLogin", false);
    isLogin.value = false;
    Navigator.pop(context);
  }


}