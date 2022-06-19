import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../size_config.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  static const String routeName = "change_password_screen";
  final LoginController _loginController = Get.put(LoginController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final profileId = ModalRoute.of(context)!.settings.arguments as String;
    var height = MediaQuery.of(context).size.height;
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back)),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenWidth(8)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: height / 3,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("asset/icons/auth/reset_password.png"),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Reset",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.070,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: height * 0.050,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Icon(
                                      Icons.security,
                                      color: Colors.grey,
                                      size: height * 0.030,
                                    ))),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            Expanded(
                                child: Obx(
                              () => TextFormField(
                                obscureText: _loginController.isVisible.value,
                                controller:
                                    _loginController.newPasswordTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required!";
                                  } else if (value.length < 6) {
                                    return "Password must be higher then 6 characters!";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "New Password",
                                    suffixIcon: !_loginController
                                            .isVisible.value
                                        ? InkWell(
                                            onTap: () {
                                              _loginController.isVisible.value =
                                                  !_loginController
                                                      .isVisible.value;
                                            },
                                            child: Icon(Icons.visibility_off),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              _loginController.isVisible.value =
                                                  !_loginController
                                                      .isVisible.value;
                                            },
                                            child: Icon(Icons.visibility),
                                          )),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: height * 0.030,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                                height: height * 0.050,
                                child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Icon(
                                      Icons.security,
                                      color: Colors.grey,
                                      size: height * 0.030,
                                    ))),
                            SizedBox(
                              width: getProportionateScreenWidth(20),
                            ),
                            Expanded(
                                child: Obx(
                              () => TextFormField(
                                controller: _loginController
                                    .confirmNewPasswordTextController,
                                obscureText: _loginController.isVisible.value,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password is required!";
                                  } else if (value.length < 6) {
                                    return "Password must be higher then 6 characters!";
                                  } else if (value !=
                                      _loginController
                                          .newPasswordTextController.text) {
                                    return "Password not matched!";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "Confirm New Password",
                                    suffixIcon: !_loginController
                                            .isVisible.value
                                        ? InkWell(
                                            onTap: () {
                                              _loginController.isVisible.value =
                                                  !_loginController
                                                      .isVisible.value;
                                            },
                                            child: Icon(Icons.visibility_off),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              _loginController.isVisible.value =
                                                  !_loginController
                                                      .isVisible.value;
                                            },
                                            child: Icon(Icons.visibility),
                                          )),
                              ),
                            ))
                          ],
                        ),
                      ],
                    )),
                SizedBox(
                  height: height * 0.070,
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.loaderOverlay.show();
                      _loginController.updatePassword(
                          password:
                              _loginController.newPasswordTextController.text,
                          profileId: profileId,
                          context: context);
                      //Navigator.pop(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(10))),
                    padding: EdgeInsets.all(getProportionateScreenWidth(17)),
                    child: Center(
                        child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: height * 0.030,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
