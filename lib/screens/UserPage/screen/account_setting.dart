import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);
  static const String routeName = "/account_setting";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: false,
        title: Text("Account Settings"),
        actions: <Widget>[
          CommonData.icon(icon: "asset/icons/messenger.png", color: AllColors.mainColor),
          SizedBox(width: getProportionateScreenWidth(10),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenHeight(10)),
              width: double.infinity,
              child: const Text("My Account"),
            ),
            const ListTile(
              title: Text("My Profile"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("My Address"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("Bank Accounts/Cards"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenHeight(10)),
              width: double.infinity,
              child: const Text("Settings"),
            ),
            const ListTile(
              title: Text("Chat Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("Notification Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("Privacy Settings"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15),vertical: getProportionateScreenHeight(10)),
              width: double.infinity,
              child: const Text("Support"),
            ),
            const ListTile(
              title: Text("Help Centre"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("Tips and Tricks"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("Community Rules"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            const Divider(),
            const ListTile(
              title: Text("About"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            Container(
              color: Colors.grey.withOpacity(0.1),
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenHeight(10)),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Center(child: Padding(
                      padding: EdgeInsets.all(getProportionateScreenWidth(15)),
                      child: Text("Log Out",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
                    )),
                  ),
                  SizedBox(height: getProportionateScreenHeight(15),),
                  Text("Chardike v 1.0.0"),
                  SizedBox(height: getProportionateScreenHeight(15),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
