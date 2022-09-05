import 'package:chardike/screens/UserPage/controller/edit_profile_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputBoxPage extends StatelessWidget {
  InputBoxPage({Key? key}) : super(key: key);
  static const String routeName = "/input_box_page";
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    final type = ModalRoute.of(context)!.settings.arguments as Map;
    _editProfileController.inputBoxTextEditingController.value.text =
        type['data'];
    _editProfileController.inputBoxBioTextEditingController.value.text =
        type['data'];

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        centerTitle: false,
        title: Text("Edit ${type["type"]}"),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                if (type["type"] == "name") {
                  _editProfileController.fullName.value = _editProfileController
                      .inputBoxTextEditingController.value.text;
                  Navigator.pop(context);
                } else {
                  _editProfileController.bio.value = _editProfileController
                      .inputBoxBioTextEditingController.value.text;
                  Navigator.pop(context);
                }
              },
              child: Text("SAVE"))
        ],
      ),
      body: type["type"] == "name"
          ? SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenHeight(20),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                        vertical: getProportionateScreenWidth(10)),
                    child: TextField(
                      controller: _editProfileController
                          .inputBoxTextEditingController.value,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          hintText: type["type"],
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenHeight(20),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    child: TextField(
                      controller: _editProfileController
                          .inputBoxBioTextEditingController.value,
                      autofocus: true,
                      maxLines: 10,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
