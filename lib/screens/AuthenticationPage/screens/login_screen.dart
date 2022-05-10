import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/AuthenticationPage/controller/login_controllr.dart';
import 'package:chardike/screens/AuthenticationPage/screens/register_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String routeName = "login_screen";
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
        title: Text("Log In"),
        actions: [
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.circleQuestion,color: AllColors.mainColor,))
        ],
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
                        hintText: "Phone/Email/Username",
                        prefixIcon: Icon(Icons.person_outline_sharp),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red.withOpacity(0.9), width: 0.0),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.security),
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
                      child: Center(child: Text("Login",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getProportionateScreenWidth(16),
                        color: Colors.white
                      ),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Obx(()=>Checkbox(value: _loginController.checkBoxValue.value, onChanged: (value){
                              _loginController.checkBoxValue.value = value!;
                            }),),
                            Text("Remember me")
                          ],
                        ),
                        Text("I forgot my password")
                      ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("New to Chardike?"),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>RegisterScreen()));
                    },
                      child: Text("Register",style: TextStyle(fontWeight: FontWeight.bold,color: AllColors.mainColor),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
