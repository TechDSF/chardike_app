import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);
  static const String routeName = "/edit_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Edit Profile"),
        actions: <Widget>[
          Center(child: FaIcon(FontAwesomeIcons.check)),
          SizedBox(width: getProportionateScreenWidth(15),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(10),),
            Center(
              child: Stack(
                children: [
                  Container(
                    height: getProportionateScreenWidth(200),
                    width: getProportionateScreenWidth(200),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AllColors.mainColor)
                    ),
                    child: Icon(Icons.person,size: getProportionateScreenWidth(100),),
                  ),
                  Positioned(
                    bottom: getProportionateScreenWidth(10),
                      right: getProportionateScreenWidth(15),
                      child: Icon(Icons.add_circle,size: getProportionateScreenWidth(35),))
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
            ListTile(
              title: Text("Name"),
              trailing: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Roben Baskey ",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(13)),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                    ),
                  ],
                ),
              )

            ),
            const Divider(),
            ListTile(
                title: Text("Username"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "robenbaskey017 ",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            const Divider(),
            ListTile(
                title: Text("Bio"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Set Now ",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            Container(
              height: getProportionateScreenHeight(20),
              width: double.infinity,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
                title: Text("Gender"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Set Now ",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            const Divider(),
            ListTile(
                title: Text("Birthday"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Set Now ",style: TextStyle(color: Colors.black.withOpacity(0.8),fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            const Divider(),
            ListTile(
                title: Text("Phone"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Set Now ",style: TextStyle(color: AllColors.mainColor,fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            const Divider(),
            ListTile(
                title: Text("Phone"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "baskeyjames10@gmail.com ",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(13)),
                      ),
                      TextSpan(
                        text: "Verify Now ",style: TextStyle(color: AllColors.mainColor,fontSize: getProportionateScreenWidth(13)),
                      ),
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            const Divider(),
            ListTile(
                title: Text("Social Media Accounts"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
            Container(
              height: getProportionateScreenHeight(20),
              width: double.infinity,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
                title: Text("Set Password"),
                trailing: RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.arrow_forward_ios, size: getProportionateScreenWidth(15)),
                      ),
                    ],
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }


}
