import 'package:chardike/CommonData/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController{
  var isLoading = false.obs;
  late SharedPreferences preferences;
  var isLogin = false.obs;
  var email = "".obs;
  var userName = "".obs;
  final UserDataController _userDataController = Get.put(UserDataController());

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
    print("login data $data");
    if(data){
      _userDataController.getData();
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