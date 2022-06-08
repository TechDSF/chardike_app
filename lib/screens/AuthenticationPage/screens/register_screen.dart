import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/widget/auth_widget.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = "register_screen";
  final LoginController _loginController = Get.put(LoginController());
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return LoaderOverlay(
      child: Scaffold(
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
                  height: height / 5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("asset/icons/auth/sign_up_icon.png"),fit: BoxFit.contain
                      )
                  ),
                ),
                SizedBox(height: height * 0.020,),
                Text("Sign Up",style: TextStyle(fontSize: height * 0.025,fontWeight: FontWeight.bold),),
                SizedBox(height: height * 0.030,),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: height * 0.050,
                              child: Align(alignment: Alignment.bottomCenter,child: Icon(Icons.person,color: Colors.grey,size: height * 0.030,))),
                          SizedBox(width: getProportionateScreenWidth(20),),
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.userNameTextController,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Name is required!";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Full Name"
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.030,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: height * 0.050,
                              child: Align(alignment: Alignment.bottomCenter,child: Icon(Icons.phone_android,color: Colors.grey,size: height * 0.030,))),
                          SizedBox(width: getProportionateScreenWidth(20),),
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.registerMobileTextController,
                              keyboardType: TextInputType.number,
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Mobile is required!";
                                }else if(value.length > 11 || value.length < 11){
                                  return "Please enter valid mobile number!";
                                }
                              },
                              decoration: const InputDecoration(
                                  hintText: "01********"
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.030,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: height * 0.050,
                              child: Align(alignment: Alignment.bottomCenter,child: Icon(Icons.alternate_email,color: Colors.grey,size: height * 0.030,))),
                          SizedBox(width: getProportionateScreenWidth(20),),
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.registerEmailTextController,
                              validator: (value){
                                bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);
                                if(value.isEmpty){
                                  return "Email is required!";
                                }else if(!emailValid){
                                  return "Please enter valid email!";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "demo@gmail.com"
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: height * 0.030,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                              height: height * 0.050,
                              child: Align(alignment: Alignment.bottomCenter,child: Icon(Icons.security,color: Colors.grey,size: height * 0.030,))),
                          SizedBox(width: getProportionateScreenWidth(20),),
                          Expanded(
                              child: Obx(()=>TextFormField(
                                controller: _loginController.registerPasswordTextController,
                                obscureText: _loginController.isVisible.value,
                                validator: (value){
                                  if(value!.isEmpty){
                                    return "Password is required!";
                                  }else if(value.length < 6){
                                    return "Password length at least 6 required!";
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: "Password",
                                    suffixIcon: !_loginController.isVisible.value?InkWell(onTap: (){_loginController.isVisible.value = !_loginController.isVisible.value;},child: Icon(Icons.visibility_off),):InkWell(onTap: (){_loginController.isVisible.value = !_loginController.isVisible.value;},child: Icon(Icons.visibility),)
                                ),
                              ),)
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.040,),
                RichText(text: TextSpan(
                    children: [
                      TextSpan(text: "By signing up, you're agree to our ",style: TextStyle(color: Colors.black.withOpacity(0.7))),
                      TextSpan(text: "Terms and Conditions ",style: TextStyle(color: Colors.blue)),
                      TextSpan(text: "and ",style: TextStyle(color: Colors.black.withOpacity(0.7))),
                      TextSpan(text: "Privacy Policy",style: TextStyle(color: Colors.blue)),
                    ]
                )),
                SizedBox(height: height * 0.040,),
                InkWell(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      context.loaderOverlay.show();
                      _loginController.handleRegister(context: context, fullName: _loginController.userNameTextController.text, mobile: _loginController.registerMobileTextController.text, email: _loginController.registerEmailTextController.text, password: _loginController.registerPasswordTextController.text);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                    ),
                    padding: EdgeInsets.all(getProportionateScreenWidth(17)),
                    child: Center(child: Text("Continue",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: height * 0.030,),
                Center(
                  child: RichText(textAlign: TextAlign.center,text: TextSpan(
                      children: [
                        TextSpan(text: "Joined us before? ",style: TextStyle(color: Colors.black.withOpacity(0.7))),
                        TextSpan(text: "Login ",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold)),
                      ]
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
