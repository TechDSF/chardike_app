import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../size_config.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  static const String routeName = "/otp_screen";
  final LoginController _loginController = Get.put(LoginController());

  ///send otp
  TextEditingController otpPasswordTextController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    String phone = args['phone'].toString();
    String profileId = args['profile_ID'].toString();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
                        image: AssetImage("asset/icons/auth/enter_opt.png"),
                        fit: BoxFit.contain)),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Text(
                "Enter OTP",
                style: TextStyle(
                    fontSize: height * 0.025, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.020,
              ),
              Text(
                "A 6 digit code has been sent to $phone",
                style: TextStyle(color: Colors.black.withOpacity(0.8)),
              ),
              SizedBox(
                height: height * 0.070,
              ),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please fill the otp box!";
                    }
                  },
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: getProportionateScreenWidth(50),
                      fieldWidth: getProportionateScreenWidth(40),
                      activeFillColor: Colors.white,
                      inactiveColor: Colors.grey.withOpacity(0.1),
                      inactiveFillColor: Colors.grey.withOpacity(0.5)),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: otpPasswordTextController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
              ),
              SizedBox(
                height: height * 0.070,
              ),
              InkWell(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    context.loaderOverlay.show();

                    _loginController.verifyOtp(
                        context: context,
                        otp: otpPasswordTextController.text,
                        profileId: profileId);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(10))),
                  padding: EdgeInsets.all(getProportionateScreenWidth(17)),
                  child: const Center(
                      child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text("End Time: "),
                  SlideCountdownSeparated(
                    height: getProportionateScreenHeight(20),
                    width: getProportionateScreenHeight(20),
                    onDone: () {
                      Navigator.pop(context);
                    },
                    textStyle: TextStyle(
                        fontSize: getProportionateScreenHeight(10),
                        color: AllColors.mainColor,
                        fontWeight: FontWeight.bold),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(3))),
                    duration: const Duration(minutes: 2),
                  ),
                  Text(
                    "sec",
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(11),
                        color: AllColors.mainColor),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.030,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
