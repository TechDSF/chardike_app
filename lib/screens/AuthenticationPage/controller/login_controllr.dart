import 'dart:convert';

import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';

class LoginController extends GetxController{
  var checkBoxValue = false.obs;
  var isSingUpLoading = false.obs;
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerMobileTextController = TextEditingController();
  TextEditingController registerPasswordTextController = TextEditingController();
  TextEditingController registerConfirmPasswordTextController = TextEditingController();
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
  final UserDataController _userDataController = Get.put(UserDataController());

  getSharedPreferenceData()async{
    prefs = await SharedPreferences.getInstance();
  }


  @override
  void onInit() {
    super.onInit();
    getSharedPreferenceData();
  }


  handleLogin({required String email, required String password , required BuildContext context})async{
    isSingUpLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = json.encode({
      "username": email,
      "password": password
    });

    try {
      var response = await http.post(Uri.parse('https://shark-app-gc4oe.ondigitalocean.app/user/login/'),headers: headers, body: body);


      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        if(jsonData['Error'] == "Sorry Password mismatch"){
          Fluttertoast.showToast(msg: "${jsonData['Error']}",toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          context.loaderOverlay.hide();
        }else if(jsonData['Error'] != null){
          Fluttertoast.showToast(msg: "${jsonData['Error']}",toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          context.loaderOverlay.hide();
        }
        else{
          loginPasswordTextController.clear();
          loginEmailTextController.clear();
          print("user name = ${jsonData['username']}");
          _userDataController.setData(
              fullNameData: jsonData['fullName']??"",
              emailData: email,
              mobileData: "",
              userObjIdData: jsonData['user_obj_ID'].toString()??"",
              profileIdData: jsonData['profile_ID'].toString()??"",
              userNameData: jsonData['username']??"");
          _commonController.isLogin.value = true;
          prefs.setBool("isLogin", true);
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
    } on Exception catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "${e.toString()}",toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
      context.loaderOverlay.hide();
    }

  }

  handleRegister({required BuildContext context, required String fullName, required String mobile, required String email , required String password})async{
    isSingUpLoading(true);
    var headers = {
      'Content-Type': 'application/json'
    };

    var body = json.encode({
      "full_name": fullName,
      "phone":email,
      "password":password,
      "confirm_password":password
    });

    try {
      var response = await http.post(Uri.parse('https://shark-app-gc4oe.ondigitalocean.app/user/register/'),headers: headers, body: body);


      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        if(jsonData['Success'] == "Profile is created"){
          Fluttertoast.showToast(msg: "${jsonData['Success']}",toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          userNameTextController.clear();
          registerMobileTextController.clear();
          registerEmailTextController.clear();
          registerPasswordTextController.clear();
          context.loaderOverlay.hide();
          prefs.setString(CommonData.phone, mobile);
          Navigator.popAndPushNamed(context, LoginScreen.routeName);
        }else if(jsonData['Error'] != null){
          isSingUpLoading(false);
          context.loaderOverlay.hide();
          Fluttertoast.showToast(msg: jsonData['Error'],toastLength: Toast.LENGTH_LONG);
        }else{
          isSingUpLoading(false);
          context.loaderOverlay.hide();
          Fluttertoast.showToast(msg: "Oops! Account create is failed!",toastLength: Toast.LENGTH_LONG);
        }
      }else if(response.statusCode == 406){
        var jsonData = json.decode(response.body);
        isSingUpLoading(false);
        context.loaderOverlay.hide();
        Fluttertoast.showToast(msg: jsonData['Error'],toastLength: Toast.LENGTH_LONG);
      }
      else {
        print(response.reasonPhrase);
        Fluttertoast.showToast(msg: "${response.reasonPhrase}",toastLength: Toast.LENGTH_LONG);
        isSingUpLoading(false);
        context.loaderOverlay.hide();
      }
    } on Exception catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "${e.toString()}",toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
      context.loaderOverlay.hide();
    }
  }

}