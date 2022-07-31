import 'dart:io';

import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/AuthenticationPage/screens/otp_screen.dart';
import 'package:chardike/screens/UserPage/components/edit_phone_page.dart';
import 'package:chardike/screens/UserPage/components/link_social_media.dart';
import 'package:chardike/screens/UserPage/controller/edit_profile_controller.dart';
import 'package:chardike/screens/UserPage/screen/inputbox_page.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class EditProfile extends StatelessWidget {
  EditProfile({Key? key}) : super(key: key);
  static const String routeName = "/edit_profile";
  final EditProfileController _editProfileController =
      Get.put(EditProfileController());
  final UserDataController _userDataController = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    _editProfileController.isAssetImage.value = false;
    _editProfileController.setData(
        name: _userDataController.fullName.value,
        bioData: _userDataController.bio.value == ""
            ? "Set Now "
            : _userDataController.bio.value,
        genderData: _userDataController.gender.value == ""
            ? "Set Now "
            : _userDataController.gender.value,
        birthdayData: _userDataController.dob.value == ""
            ? "Set Now "
            : _userDataController.dob.value);

    void openEditUsernameDialog(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return AlertDialog(
            content: Text(
                "You can change your username only one time. Please think long and hard when choosing a new username."),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "CONTINUE",
                  style: TextStyle(color: AllColors.mainColor),
                ),
              ),
            ],
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
    }

    void openGenderDialog(BuildContext context) {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (_, __, ___) {
          return AlertDialog(
            title: const Text("Gender"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  onTap: () {
                    _editProfileController.gender.value = "Male";
                    Navigator.pop(context);
                  },
                  title: Text("Male"),
                ),
                ListTile(
                  onTap: () {
                    _editProfileController.gender.value = "Female";
                    Navigator.pop(context);
                  },
                  title: Text("Female"),
                ),
                ListTile(
                  onTap: () {
                    _editProfileController.gender.value = "Other";
                    Navigator.pop(context);
                  },
                  title: Text("Other"),
                ),
              ],
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim),
            child: child,
          );
        },
      );
    }

    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text("Edit Profile"),
          actions: <Widget>[
            InkWell(
                onTap: () {
                  if (_editProfileController.isAssetImage.value) {
                    _editProfileController.setProfileData(
                        context: context, isImageSelect: true);
                  } else {
                    _editProfileController.setProfileData(
                      context: context, isImageSelect: false);
                  }
                },
                child: const Center(child: FaIcon(FontAwesomeIcons.check))),
            SizedBox(
              width: getProportionateScreenWidth(15),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        _editProfileController.openGallery();
                      },
                      child: Container(
                          height: getProportionateScreenWidth(200),
                          width: getProportionateScreenWidth(200),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: AllColors.mainColor)),
                          child: Obx(() {
                            if (_editProfileController.isAssetImage.value) {
                              return Container(
                                height: getProportionateScreenWidth(200),
                                width: getProportionateScreenWidth(200),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: FileImage(File(
                                            _editProfileController
                                                .selectImage.value)),
                                        fit: BoxFit.cover)),
                              );
                            } else {
                              return Obx(() {
                                if (_userDataController.image.value != "") {
                                  return Container(
                                    height: getProportionateScreenWidth(200),
                                    width: getProportionateScreenWidth(200),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                _userDataController
                                                    .image.value),
                                            fit: BoxFit.cover)),
                                  );
                                } else {
                                  return Icon(
                                    Icons.person,
                                    size: getProportionateScreenWidth(100),
                                  );
                                }
                              });
                            }
                          })),
                    ),
                    Positioned(
                        bottom: getProportionateScreenWidth(10),
                        right: getProportionateScreenWidth(15),
                        child: Icon(
                          Icons.add_circle,
                          size: getProportionateScreenWidth(35),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, InputBoxPage.routeName,
                        arguments: {
                          "data": _userDataController.fullName.value,
                          "type": "name"
                        });
                  },
                  title: Text("Name"),
                  trailing: Obx(() => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "${_editProfileController.fullName.value} ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(13)),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.arrow_forward_ios,
                                  size: getProportionateScreenWidth(15)),
                            ),
                          ],
                        ),
                      ))),
              const Divider(),
              ListTile(
                onTap: () {},
                title: Text("Username"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "${_userDataController.userName.value} ",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios,
                            size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(),
              customListTile(
                  onTap: () {
                    Navigator.pushNamed(context, InputBoxPage.routeName,
                        arguments: {
                          "data": _editProfileController.bio.value,
                          "type": "bio"
                        });
                  },
                  title: "Bio",
                  trailing: Obx(
                    () => Text(
                      "${_editProfileController.bio.value} ",
                      textAlign: TextAlign.end,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.8),
                          overflow: TextOverflow.ellipsis,
                          fontSize: SizeConfig.screenWidth * 0.032),
                    ),
                  )),
              SizedBox(
                height: SizeConfig.screenHeight * 0.013,
              ),
              Container(
                height: getProportionateScreenHeight(20),
                width: double.infinity,
                color: Colors.grey.withOpacity(0.1),
              ),
              ListTile(
                  onTap: () {
                    openGenderDialog(context);
                  },
                  title: Text("Gender"),
                  trailing: Obx(() => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _editProfileController.gender.value,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: getProportionateScreenWidth(13)),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.arrow_forward_ios,
                                  size: getProportionateScreenWidth(15)),
                            ),
                          ],
                        ),
                      ))),
              const Divider(),
              ListTile(
                  onTap: () {
                    _editProfileController.selectDate(context);
                  },
                  title: Text("Birthday"),
                  trailing: Obx(() => RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: _editProfileController.birthDate.value,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.8),
                                  fontSize: getProportionateScreenWidth(13)),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.arrow_forward_ios,
                                  size: getProportionateScreenWidth(15)),
                            ),
                          ],
                        ),
                      ))),
              const Divider(),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, EditPhone.routeName);
                  },
                  title: const Text("Phone"),
                  trailing: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${_userDataController.phone.value} ",
                          style: TextStyle(
                              color: AllColors.mainColor,
                              fontSize: getProportionateScreenWidth(13)),
                        ),
                        WidgetSpan(
                          child: Icon(Icons.arrow_forward_ios,
                              size: getProportionateScreenWidth(15)),
                        ),
                      ],
                    ),
                  )),
              const Divider(),
              ListTile(
                  title: const Text("Email"),
                  trailing: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${_userDataController.email.value} ",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(13)),
                        ),
                        TextSpan(
                          text: "Verify Now ",
                          style: TextStyle(
                              color: AllColors.mainColor,
                              fontSize: getProportionateScreenWidth(13)),
                        ),
                        WidgetSpan(
                          child: Icon(Icons.arrow_forward_ios,
                              size: getProportionateScreenWidth(15)),
                        ),
                      ],
                    ),
                  )),
              const Divider(),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, LinkSocialMedia.routeName);
                  },
                  title: Text("Social Media Accounts"),
                  trailing: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.arrow_forward_ios,
                              size: getProportionateScreenWidth(15)),
                        ),
                      ],
                    ),
                  )),
              Container(
                height: getProportionateScreenHeight(20),
                width: double.infinity,
                color: Colors.grey.withOpacity(0.1),
              ),
              ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, OtpScreen.routeName);
                  },
                  title: Text("Set Password"),
                  trailing: RichText(
                    text: TextSpan(
                      children: [
                        WidgetSpan(
                          child: Icon(Icons.arrow_forward_ios,
                              size: getProportionateScreenWidth(15)),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  customListTile(
      {required VoidCallback onTap,
      required String title,
      required Widget trailing}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: SizeConfig.screenWidth * 0.04),
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.1,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: trailing,
                  ),
                  Icon(Icons.arrow_forward_ios,
                      size: getProportionateScreenWidth(15)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
