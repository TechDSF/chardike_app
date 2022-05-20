import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/screens/change_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../size_config.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  static const String routeName = "/otp_screen";
  final LoginController _loginController = Get.put(LoginController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){Navigator.pop(context);},child: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical:getProportionateScreenWidth(8)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("asset/icons/auth/enter_opt.png"),fit: BoxFit.contain
                    )
                ),
              ),
              SizedBox(height: height * 0.020,),
              Text("Enter OTP",style: TextStyle(fontSize: height * 0.025,fontWeight: FontWeight.bold),),
              SizedBox(height: height * 0.020,),
              Text("A 6 digit code has been sent to james@gmail.com",style: TextStyle(color: Colors.black.withOpacity(0.8)),),
              SizedBox(height: height * 0.070,),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  validator: (value){
                    if(value!.isEmpty){
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
                    inactiveFillColor: Colors.grey.withOpacity(0.5)
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: _loginController.otpPasswordTextController,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  onChanged: (value) {

                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  }, appContext: context,
                ),
              ),
              SizedBox(height: height * 0.070,),
              InkWell(
                onTap: (){
                  // if(formKey.currentState!.validate()){
                  //
                  // }
                  Navigator.popAndPushNamed(context, ChangePasswordScreen.routeName);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                  ),
                  padding: EdgeInsets.all(getProportionateScreenWidth(17)),
                  child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                ),
              ),
              SizedBox(height: height * 0.030,),
            ],
          ),
        ),
      ),
    );
  }
}
