import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/screens/forgot_password.dart';
import 'package:chardike/screens/AuthenticationPage/screens/register_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "login_screen";
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
                  height: height / 3.7,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("asset/icons/auth/login_icon.png"),fit: BoxFit.contain
                    )
                  ),
                ),
                SizedBox(height: height * 0.020,),
                Text("Login",style: TextStyle(fontSize: height * 0.025,fontWeight: FontWeight.bold),),
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
                              child: Align(alignment: Alignment.bottomCenter,child: Icon(Icons.alternate_email,color: Colors.grey,size: height * 0.030,))),
                          SizedBox(width: getProportionateScreenWidth(20),),
                          Expanded(
                            child: TextFormField(
                              controller: _loginController.loginEmailTextController,
                              validator: (value){
                                bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);
                                if(value.isEmpty){
                                  return "Email is required!";
                                }else if(!emailValid){
                                  return "Please enter valid email!";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "Email ID"
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
                              controller: _loginController.loginPasswordTextController,
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
                SizedBox(height: height * 0.030,),
                Align(alignment: Alignment.centerRight,child: InkWell(onTap: (){
                  Navigator.pushNamed(context, ForgotPassword.routeName);
                },child: const Text("Forgot Password?",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w500),))),
                SizedBox(height: height * 0.040,),
                InkWell(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      context.loaderOverlay.show();
                      _loginController.handleLogin(email: _loginController.loginEmailTextController.text, password: _loginController.loginPasswordTextController.text, context: context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                    ),
                    padding: EdgeInsets.all(getProportionateScreenWidth(17)),
                    child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                  ),
                ),
                SizedBox(height: height * 0.030,),
                Row(
                  children: <Widget>[
                    Expanded(child: Divider()),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Text("OR",style: TextStyle(color: Colors.black.withOpacity(0.7)),),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: height * 0.020,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                        ),
                        child: Row(
                          children: [
                            Image.asset("asset/icons/auth/social icon-01.png",height: getProportionateScreenHeight(50),width: getProportionateScreenHeight(50),),
                            Expanded(child: Center(child: Text("Facebook",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),))),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                        ),
                        child: Row(
                          children: [
                            Image.asset("asset/icons/auth/social icon-14.png",height: getProportionateScreenHeight(50),width: getProportionateScreenHeight(50),),
                            Expanded(child: Center(child: Text("Google",style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold),))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.030,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("New to Logistic?",style: TextStyle(color: Colors.black.withOpacity(0.7))),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                    }, child: Text("Register",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
