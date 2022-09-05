import 'dart:io';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/FeedPage/model/feed_model.dart';
import 'package:chardike/screens/ProductDetails/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedController extends GetxController {
  var isLoading = false.obs;
  var isBlogLoading = false.obs;
  var isAdminBlogLoading = false.obs;
  var isReviewBlogLoading = false.obs;
  Rx<List<FeedModel>> timeLineList = Rx<List<FeedModel>>([]);
  Rx<List<FeedModel>> adminBlogList = Rx<List<FeedModel>>([]);
  Rx<List<ReviewModel>> reviewList = Rx<List<ReviewModel>>([]);
  final ImagePicker _picker = ImagePicker();
  var selectImage = "".obs;
  TextEditingController titleTextController = TextEditingController();
  TextEditingController descriptionTextController = TextEditingController();
  final UserDataController _userDataController = Get.put(UserDataController());

  Future<void> getTimeLineFeed() async {
    isBlogLoading(true);
    var result = await ApiService.getAllBlogs();
    if (result.runtimeType == int) {
      isBlogLoading(false);
      print("Blog fetch error");
    } else {
      timeLineList.value.clear();
      timeLineList.value = result;
      isBlogLoading(false);
    }
  }

  Future<void> getAdminFeed() async {
    isAdminBlogLoading(true);
    var result = await ApiService.getAdminBlogs();
    if (result.runtimeType == int) {
      isAdminBlogLoading(false);
      print("Blog fetch error");
    } else {
      adminBlogList.value.clear();
      adminBlogList.value = result;
      print(adminBlogList.value.length);
      isAdminBlogLoading(false);
    }
  }

  Future<void> getReviewList() async {
    isReviewBlogLoading(true);
    var result = await ApiService.getALlReview();
    if (result.runtimeType == int) {
      print("Blog review fetch Error");
      isReviewBlogLoading(false);
    } else {
      List<ReviewModel> list = result;
      reviewList.value.clear();
      list.forEach((element) {
        if (element.isActive) {
          reviewList.value.add(element);
        }
      });

      isReviewBlogLoading(false);
    }
  }

  postBlog(
      {required String image,
      required String title,
      required String description,
      required BuildContext context}) async {
    print("work");
    context.loaderOverlay.show();
    var tokenResult = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);

    if (tokenResult.runtimeType == int) {
      context.loaderOverlay.hide();
    } else {
      Map d = tokenResult;
      var result = await ApiService.blogCreate(
          filePath: image,
          title: title,
          description: description,
          token: d['access']);
      if (result == false) {
        context.loaderOverlay.hide();
      } else {
        context.loaderOverlay.hide();
        getTimeLineFeed();
        Navigator.pop(context);
      }
      print(result);
    }
  }

  openImage() async {
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
      selectImage.value = croppedFile!.path;
      print("crop image null");
    } else {
      selectImage.value = croppedFile.path;
      print("crop image ok");
    }
  }

  Future<void> launchInstagramUrl({required Uri url}) async {
    if (await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
    } else {
      throw 'Could not launch $url';
    }
  }
}
