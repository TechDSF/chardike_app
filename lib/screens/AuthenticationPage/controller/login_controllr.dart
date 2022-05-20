import 'dart:convert';

import 'package:chardike/CommonData/CommonController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  var checkBoxValue = false.obs;
  var isSingUpLoading = false.obs;
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerPasswordTextController = TextEditingController();
  ///login screen
  TextEditingController loginEmailTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();
  ///forgot password
  TextEditingController forgotPasswordTextController = TextEditingController();
  ///send otp
  TextEditingController otpPasswordTextController = TextEditingController();
  ///reset password
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmNewPasswordTextController = TextEditingController();

  var isVisible = true.obs;
  late SharedPreferences prefs;
  final CommonController _commonController = Get.put(CommonController());

  getSharedPreferenceData()async{
    prefs = await SharedPreferences.getInstance();
  }


  @override
  void onInit() {
    super.onInit();
    getSharedPreferenceData();
  }


  handleLogin({required String userName , required String email, required String password , required BuildContext context})async{
    isSingUpLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = json.encode({
      "email": email,
      "password": password,
      "username": userName
    });

    var response = await http.post(Uri.parse('https://charidik.herokuapp.com/user/register/'),headers: headers, body: body);


    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print(jsonData);
      if(jsonData['error'] == true){
        Fluttertoast.showToast(msg: "${jsonData['message']}",toastLength: Toast.LENGTH_LONG);
        isSingUpLoading(false);
        context.loaderOverlay.hide();
      }else{
        print("user name = ${jsonData['data']['email']}");
        prefs.setInt("id", jsonData['data']['id']!);
        prefs.setString("email", jsonData['data']['email']!);
        prefs.setString("username", jsonData['data']['username']!);
        prefs.setBool("isLogin", true);
        _commonController.isLogin.value = true;
        context.loaderOverlay.hide();
        Navigator.pop(context);
      }

    }
    else {
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: "${response.reasonPhrase}",toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
      context.loaderOverlay.hide();
    }

  }
}