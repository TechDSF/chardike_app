import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/UserPage/components/about_us.dart';
import 'package:chardike/screens/UserPage/components/return_policy.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/MyAddress/my_address.dart';
import '../components/help_center.dart';
import 'edit_profile.dart';

class AccountSetting extends StatelessWidget {
  AccountSetting({Key? key}) : super(key: key);
  static const String routeName = "/account_setting";
  final CommonController _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: Text("Account Settings"),
      ),
      body: SingleChildScrollView(
        child: _commonController.isLogin.value
            ? Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenHeight(10)),
                    width: double.infinity,
                    child: const Text("My Account"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, EditProfile.routeName);
                    },
                    title: Text("My Profile"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),

                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, MyAddress.routeName,
                          arguments: {"data": 3, "type": false, "amount": 0.0});
                    },
                    title: Text("My Address"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  // const Divider(),
                  // const ListTile(
                  //   title: Text("Bank Accounts/Cards"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // Container(
                  //   color: Colors.grey.withOpacity(0.1),
                  //   padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenHeight(10)),
                  //   width: double.infinity,
                  //   child: const Text("Settings"),
                  // ),
                  // const ListTile(
                  //   title: Text("Chat Settings"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // const Divider(),
                  // const ListTile(
                  //   title: Text("Notification Settings"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // const Divider(),
                  // const ListTile(
                  //   title: Text("Privacy Settings"),
                  //   trailing: Icon(Icons.arrow_forward_ios),
                  // ),
                  // const Divider(),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenHeight(10)),
                    width: double.infinity,
                    child: const Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, HelpCenter.routeName);
                    },
                    title: Text("Help Centre"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ReturnPolicy.routeName);
                    },
                    title: Text("Return Policy"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ReturnPolicy.routeName);
                    },
                    title: Text("Term and Condition"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, AboutUs.routeName);
                    },
                    title: Text("About"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20),
                        vertical: getProportionateScreenHeight(10)),
                    child: Column(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            _commonController.logOutOperation(context: context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                                child: Padding(
                              padding: EdgeInsets.all(
                                  getProportionateScreenWidth(15)),
                              child: Text(
                                "Log Out",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15)),
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                        Text("Chardike v 1.0.0"),
                        SizedBox(
                          height: getProportionateScreenHeight(15),
                        ),
                      ],
                    ),
                  )
                ],
              )
            : Column(
                children: <Widget>[
                  Container(
                    color: Colors.grey.withOpacity(0.1),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(15),
                        vertical: getProportionateScreenHeight(10)),
                    width: double.infinity,
                    child: const Text("Support"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, HelpCenter.routeName);
                    },
                    title: Text("Help Center"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ReturnPolicy.routeName);
                    },
                    title: Text("Return Policy"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, ReturnPolicy.routeName);
                    },
                    title: Text("Term and Condition"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  const ListTile(
                    title: Text("Happy with Chardike? Rate us!"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, AboutUs.routeName);
                    },
                    title: Text("About"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  const Divider(),
                  Text("Chardike v 1.0.0"),
                ],
              ),
      ),
    );
  }
}
