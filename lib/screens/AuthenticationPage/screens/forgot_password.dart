import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../size_config.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);
  static const String routeName = "/forgot_password";
  final LoginController _loginController = Get.put(LoginController());
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return LoaderOverlay(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
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
                          image: AssetImage(
                              "asset/icons/auth/forgot_password.png"),
                          fit: BoxFit.contain)),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Forgot",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Password?",
                  style: TextStyle(
                      fontSize: height * 0.025, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.020,
                ),
                Text(
                  "Don't worry! It happens. Please enter the address associated with your account.",
                  style: TextStyle(color: Colors.black.withOpacity(0.8)),
                ),
                SizedBox(
                  height: height * 0.070,
                ),
                Form(
                  key: formKey,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                          height: height * 0.050,
                          child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Icon(
                                Icons.phone,
                                color: Colors.grey,
                                size: height * 0.030,
                              ))),
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: phoneController,
                          validator: (value) {
                            bool emailValid = RegExp(
                                    r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                .hasMatch(value!);
                            if (value.isEmpty) {
                              return "Mobile is required";
                            } else if (value.length != 11) {
                              return "Please enter valid mobile number!";
                            }
                          },
                          decoration: InputDecoration(hintText: "Mobile no"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.070,
                ),
                InkWell(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.loaderOverlay.show();
                      _loginController.sendForgotPasswordOtp(
                          mobile: phoneController.text, context: context);
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
