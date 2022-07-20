import 'dart:io';

import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../CommonData/all_colors.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final UserDataController _userDataController = Get.put(UserDataController());
  final FeedController _feedController = Get.put(FeedController());
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Create Post"),
        actions: [
          TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  if (_feedController.selectImage.value.isNotEmpty) {
                    _feedController.postBlog(
                        context: context,
                        image: _feedController.selectImage.value,
                        title: _feedController.titleTextController.text,
                        description:
                            _feedController.descriptionTextController.text);
                  } else {
                    Fluttertoast.showToast(msg: "Please select image first");
                  }
                }
              },
              child: Text("POST")),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          ListTile(
            leading: Container(
              height: getProportionateScreenWidth(60),
              width: getProportionateScreenWidth(60),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: Icon(
                Icons.person,
                color: AllColors.mainColor,
                size: getProportionateScreenWidth(40),
              ),
            ),
            title: Text(_userDataController.fullName.value),
            subtitle: Text("Public"),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _feedController.titleTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your title";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "What's on your mind?",
                        hintStyle: TextStyle(
                            fontSize: getProportionateScreenWidth(18)),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  InkWell(
                    onTap: () {
                      _feedController.openImage();
                    },
                    child: Container(
                      height: SizeConfig.screenHeight * 0.4,
                      width: double.infinity,
                      child: Obx(() {
                        if (_feedController.selectImage.value.isEmpty) {
                          return Center(
                              child: Icon(
                            Icons.add,
                            size: SizeConfig.screenHeight * 0.05,
                            color: Colors.grey.withOpacity(0.6),
                          ));
                        } else {
                          return Image.file(
                            File(_feedController.selectImage.value),
                            fit: BoxFit.fill,
                          );
                        }
                      }),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(10)),
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.4))),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  TextFormField(
                    maxLines: 5,
                    controller: _feedController.descriptionTextController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your description";
                      }
                    },
                    decoration: InputDecoration(
                        hintText: "Your description...",
                        hintStyle: TextStyle(
                            fontSize: getProportionateScreenWidth(18)),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
