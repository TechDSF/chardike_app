import 'dart:io';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';

class EditProfileController extends GetxController {
  var isLoading = false.obs;
  var inputBoxTextEditingController = TextEditingController().obs;
  var inputBoxBioTextEditingController = TextEditingController().obs;
  var birthDate = "".obs;
  final ImagePicker _picker = ImagePicker();
  var selectImage = "".obs;
  var fullName = "".obs;
  var bio = "".obs;
  var gender = "".obs;
  var isAssetImage = false.obs;
  final UserDataController _dataController = Get.put(UserDataController());

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime(2101));
    if (picked != null && picked != DateTime.now()) {
      birthDate.value = "${picked.year}-${picked.month}-${picked.day}";
    }
  }

  openGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      File img = File(image!.path);
      cropImage(imageFile: img);
    } on Exception catch (e) {
      print("Failed to pick image = $e");
      // TODO
    }
  }

  cropImage({required File imageFile}) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedFile == null) {
      isAssetImage.value = true;
      selectImage.value = croppedFile!.path;
      print("crop image null");
    } else {
      isAssetImage.value = true;
      selectImage.value = croppedFile.path;
      print("crop image ok");
    }
  }

  setData(
      {required String name,
      required String bioData,
      required String genderData,
      required String birthdayData}) {
    fullName.value = name;
    bio.value = bioData;
    gender.value = genderData;
    birthDate.value = birthdayData;
  }

  setProfileData(
      {required BuildContext context, required bool isImageSelect}) async {
    context.loaderOverlay.show();
    try {
      var tokenResult = await ApiService.getUserToken(
          userName: _dataController.userName.value,
          password: _dataController.password.value);
      print(tokenResult);
      if (tokenResult.runtimeType != int) {
        print("Work here");
        var result = await ApiService.setProfileData(
            fullName: fullName.value,
            dob: birthDate.value,
            gender: gender.value,
            image: isImageSelect,
            imageData: selectImage.value,
            address: "",
            bio: bio.value,
            token: tokenResult['access']);
        if (result.runtimeType != false) {
          print("Work here 2");
          print(_dataController.email);
          _dataController.setData(
              fullNameData: result['full_name'] ?? "",
              emailData: "",
              mobileData: result['phone'],
              userObjIdData: _dataController.userObjId.value,
              profileIdData: _dataController.profileId.value,
              userNameData: _dataController.userName.value,
              tokenData: _dataController.token.value,
              passwordData: _dataController.password.value,
              imageData: result['profile_picture'],
              dobData: result['dob'],
              bioData: "",
              genderData: result['gender'],
              addressData: result['address'],
              cityData: result['city'],
              zipcodeData: result['zipcode'],
              countryData: result['country']);

          isAssetImage.value = false;
          _dataController.image.value = result['profile_picture'];
          fullName.value = result['full_name'];
          bio.value = "Set Now";
          gender.value = result['gender'];
          birthDate.value = result['dob'];
          context.loaderOverlay.hide();
        } else {
          context.loaderOverlay.hide();
          Fluttertoast.showToast(msg: "Oops! Error to update data");
          print("Update profile Error");
        }
      } else {
        context.loaderOverlay.hide();
        Fluttertoast.showToast(msg: "Oops! Error to update data");
        print("Token get Error");
      }
    } on Exception catch (e) {
      context.loaderOverlay.hide();
      Fluttertoast.showToast(msg: "Oops! Error to update data");
      print("Token get Error");
    }
  }
}
