import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                      hintText: "Phone/Email/Username",
                      prefixIcon: Icon(Icons.person_outline_sharp)
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10),),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Phone/Email/Username",
                        prefixIcon: Icon(Icons.person_outline_sharp)
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
