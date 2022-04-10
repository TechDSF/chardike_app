import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController{
  var isLoading = false.obs;
  var inputBoxTextEditingController = TextEditingController().obs;
  var birthDate = "".obs;
  final ImagePicker _picker = ImagePicker();
  var selectImage = "".obs;


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
      birthDate.value = "${picked.year}/${picked.month}/${picked.day}";
    }
  }

  openGallery()async{
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    selectImage.value = image!.path;
  }

}