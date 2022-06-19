import 'dart:convert';

import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/AuthenticationPage/screens/change_password_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/otp_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/login_screen.dart';

class LoginController extends GetxController {
  var checkBoxValue = false.obs;
  var isSingUpLoading = false.obs;
  var isVerifyOtp = false.obs;
  TextEditingController userNameTextController = TextEditingController();
  TextEditingController registerEmailTextController = TextEditingController();
  TextEditingController registerMobileTextController = TextEditingController();
  TextEditingController registerPasswordTextController =
      TextEditingController();
  TextEditingController registerConfirmPasswordTextController =
      TextEditingController();

  ///login screen
  TextEditingController loginEmailTextController = TextEditingController();
  TextEditingController loginPasswordTextController = TextEditingController();

  ///forgot password
  TextEditingController forgotPasswordTextController = TextEditingController();

  ///reset password
  TextEditingController newPasswordTextController = TextEditingController();
  TextEditingController confirmNewPasswordTextController =
      TextEditingController();

  var isVisible = true.obs;
  late SharedPreferences prefs;
  final CommonController _commonController = Get.put(CommonController());
  final UserDataController _userDataController = Get.put(UserDataController());

  getSharedPreferenceData() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void onInit() {
    super.onInit();
    getSharedPreferenceData();
  }

  handleLogin(
      {required String email,
      required String password,
      required BuildContext context}) async {
    isSingUpLoading(true);
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({"username": email, "password": password});

    try {
      var response = await http.post(
          Uri.parse('https://shark-app-gc4oe.ondigitalocean.app/user/login/'),
          headers: headers,
          body: body);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print(jsonData);
        if (jsonData['Error'] == "Sorry Password mismatch") {
          Fluttertoast.showToast(
              msg: "${jsonData['Error']}", toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          context.loaderOverlay.hide();
        } else if (jsonData['Error'] != null) {
          Fluttertoast.showToast(
              msg: "${jsonData['Error']}", toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          context.loaderOverlay.hide();
        } else {
          loginPasswordTextController.clear();
          loginEmailTextController.clear();
          print("user name = ${jsonData['username']}");
          _userDataController.setData(
              fullNameData: jsonData['fullName'] ?? "",
              emailData: email,
              mobileData: "",
              userObjIdData: jsonData['user_obj_ID'].toString() ?? "",
              profileIdData: jsonData['profile_ID'].toString() ?? "",
              userNameData: jsonData['username'] ?? "");
          _commonController.isLogin.value = true;
          prefs.setBool("isLogin", true);
          context.loaderOverlay.hide();
          Navigator.pop(context);
        }
      } else {
        print(response.reasonPhrase);
        Fluttertoast.showToast(
            msg: "${response.reasonPhrase}", toastLength: Toast.LENGTH_LONG);
        isSingUpLoading(false);
        context.loaderOverlay.hide();
      }
    } on Exception catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "${e.toString()}", toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
      context.loaderOverlay.hide();
    }
  }

  handleRegister(
      {required BuildContext context,
      required String fullName,
      required String mobile,
      required String email,
      required String password}) async {
    isSingUpLoading(true);
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({
      "full_name": fullName,
      "phone": email,
      "password": password,
      "confirm_password": password
    });

    try {
      var response = await http.post(
          Uri.parse(
              'https://shark-app-gc4oe.ondigitalocean.app/user/register/'),
          headers: headers,
          body: body);

      print("response work");

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        var jsonData = json.decode(response.body);
        if (jsonData['Success'] != null) {
          print("response ok here");
          Fluttertoast.showToast(
              msg: "${jsonData['Success']}", toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          clearText();
          context.loaderOverlay.hide();
          Navigator.popAndPushNamed(context, OtpScreen.routeName, arguments: {
            "type": "register",
            "phone": email,
            "profile_ID": jsonData['profile_ID'].toString()
          });
          prefs.setString(CommonData.phone, mobile);
        } else if (jsonData['phone'] != null) {
          isSingUpLoading(false);
          context.loaderOverlay.hide();
          registerEmailTextController.clear();
          Fluttertoast.showToast(
              msg:
                  "This phone number already exit! Please use another phone number.",
              toastLength: Toast.LENGTH_LONG);
        } else if (jsonData['Error'] != null) {
          isSingUpLoading(false);
          context.loaderOverlay.hide();
          clearText();
          print("${jsonData['Error']}");
          Fluttertoast.showToast(
              msg: "${jsonData['Error']}", toastLength: Toast.LENGTH_LONG);
        } else {
          isSingUpLoading(false);
          context.loaderOverlay.hide();
          print("Oops! Account create is failed!");
          Fluttertoast.showToast(
              msg: "Oops! Account create is failed!",
              toastLength: Toast.LENGTH_LONG);
        }
      } else if (response.statusCode == 406) {
        var jsonData = json.decode(response.body);
        isSingUpLoading(false);
        context.loaderOverlay.hide();
        print("Data Error 406 ${jsonData['Error']}");
        Fluttertoast.showToast(
            msg: "${jsonData['Error']}", toastLength: Toast.LENGTH_LONG);
      } else {
        context.loaderOverlay.hide();
        print("Data Error reasonphase ${response.reasonPhrase!}");
        Fluttertoast.showToast(
            msg: "${response.reasonPhrase}", toastLength: Toast.LENGTH_LONG);
        isSingUpLoading(false);
      }
    } on Exception catch (e) {
      context.loaderOverlay.hide();
      print("Data Error ${e.toString()}");
      Fluttertoast.showToast(
          msg: "${e.toString()}", toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
    }
  }

  clearText() {
    userNameTextController.clear();
    registerEmailTextController.clear();
    registerPasswordTextController.clear();
    registerConfirmPasswordTextController.clear();
  }

  verifyOtp(
      {required BuildContext context,
      required String type,
      required String otp,
      required String profileId}) async {
    isVerifyOtp(true);
    var headers = {'Content-Type': 'application/json'};

    var body = json.encode({"otp": otp, "profile_ID": profileId});

    try {
      var response = await http.post(
          Uri.parse(
              'https://shark-app-gc4oe.ondigitalocean.app/user/verify/otp/'),
          headers: headers,
          body: body);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        if (jsonData["Success"] != null) {
          context.loaderOverlay.hide();
          isVerifyOtp(true);
          if (type == "change_password") {
            Navigator.popAndPushNamed(context, ChangePasswordScreen.routeName,
                arguments: profileId);
          } else {
            Navigator.pop(context);
          }
        } else {
          Fluttertoast.showToast(
              msg: "Please enter valid otp!", toastLength: Toast.LENGTH_LONG);
          isSingUpLoading(false);
          context.loaderOverlay.hide();
        }
      }
    } on Exception catch (e) {
      print(e.toString());
      Fluttertoast.showToast(
          msg: "${e.toString()}", toastLength: Toast.LENGTH_LONG);
      isSingUpLoading(false);
      context.loaderOverlay.hide();
    }
  }

  ///send forgot password otp
  sendForgotPasswordOtp(
      {required String mobile, required BuildContext context}) async {
    var result = await ApiService.forotPasswordMethod(number: mobile);
    if (result == 0) {
      context.loaderOverlay.hide();
    } else {
      context.loaderOverlay.hide();
      Navigator.popAndPushNamed(context, OtpScreen.routeName, arguments: {
        "type": "change_password",
        "phone": mobile,
        "profile_ID": result.toString()
      });
    }
  }

  ///update password
  updatePassword(
      {required String password,
      required String profileId,
      required BuildContext context}) async {
    bool result = await ApiService.updatePassword(
        password: password, profileId: profileId);
    if (result) {
      context.loaderOverlay.hide();
      Navigator.pop(context);
    } else {
      context.loaderOverlay.hide();
    }
  }
}
