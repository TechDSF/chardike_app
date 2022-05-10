import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  static const String routeName = "register_screen";
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        elevation: 1,
        centerTitle: false,
        leading: Center(child: InkWell(onTap:(){Navigator.pop(context);},child: FaIcon(FontAwesomeIcons.arrowLeft))),
        title: Text("Register"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(50),),
              Center(child: FaIcon(FontAwesomeIcons.warehouse,size: getProportionateScreenWidth(50),color: AllColors.mainColor,)),
              SizedBox(height: getProportionateScreenHeight(30),),
              Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Phone number",
                        prefixIcon: Icon(Icons.person_outline_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.withOpacity(0.9), width: 0.0),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(40),),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(15)),
                      color: Colors.blue,
                      child: Center(child: Text("NEXT",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(16),
                          color: Colors.white
                      ),)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Row(
                children: <Widget>[
                  Expanded(child: Divider(color: Colors.grey,)),
                  Padding(child: Text("OR"),padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15))),
                  Expanded(child: Divider(color: Colors.grey,)),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: getProportionateScreenWidth(60),
                    width: getProportionateScreenWidth(60),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        shape: BoxShape.circle
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.facebook,size: getProportionateScreenWidth(40),)),
                  ),
                  Container(
                    height: getProportionateScreenWidth(60),
                    width: getProportionateScreenWidth(60),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        shape: BoxShape.circle
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.google,size: getProportionateScreenWidth(40),)),
                  ),
                  Container(
                    height: getProportionateScreenWidth(60),
                    width: getProportionateScreenWidth(60),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        shape: BoxShape.circle
                    ),
                    child: Center(child: FaIcon(FontAwesomeIcons.apple,size: getProportionateScreenWidth(40),)),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: "By signing up, you agree to Chardike's ",
                    style: TextStyle(
                      color: Colors.black
                    ),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Term of Service',
                          style: TextStyle(fontWeight: FontWeight.bold,color: AllColors.mainColor)),
                      TextSpan(text: ' & '),
                      TextSpan(text: "Privacy Policy",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AllColors.mainColor
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have a account?"),
                  InkWell(
                      onTap: (){

                      },
                      child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: AllColors.mainColor),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
