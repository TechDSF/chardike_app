import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommonController extends GetxController {
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

  getLoginData() async {
    preferences = await SharedPreferences.getInstance();
    bool data = preferences.getBool("isLogin") ?? false;
    isLogin.value = data;
    print("login data $data");
    if (data) {
      _userDataController.getData();
      email.value = preferences.getString(CommonData.email) ?? "";
      userName.value = preferences.getString(CommonData.userName) ?? "";
      print("hfjdh" + preferences.getString(CommonData.userName).toString());
      var password = preferences.getString(CommonData.password) ?? "";

      var tokenResult = await ApiService.getUserToken(
          userName: userName.value, password: password);
      if (tokenResult.runtimeType == int) {
        print("erro");
      } else {
        var userDataResult =
            await ApiService.getProfileData(accessToken: tokenResult['access']);
        print(userDataResult);
        _userDataController.setData(
            fullNameData: userDataResult['full_name'] ?? "",
            emailData: "",
            mobileData: userDataResult["phone"],
            userObjIdData: preferences.getString(CommonData.userObjId) ?? "",
            profileIdData:
                preferences.getString(CommonData.userProfileId) ?? "",
            userNameData: preferences.getString(CommonData.userName) ?? "",
            tokenData: preferences.getString(CommonData.token) ?? "",
            passwordData: password,
            imageData: userDataResult['profile_picture'],
            dobData: userDataResult['dob'],
            bioData: "",
            genderData: userDataResult['gender'],
            addressData: userDataResult['address'],
            cityData: userDataResult['city'],
            zipcodeData: userDataResult['zipcode'],
            countryData: userDataResult['country']);
      }
    }
  }

  logOutOperation({required BuildContext context}) {
    preferences.setBool("isLogin", false);
    isLogin.value = false;
    Navigator.pop(context);
  }
}
