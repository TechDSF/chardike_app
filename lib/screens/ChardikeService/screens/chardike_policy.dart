import 'package:flutter/material.dart';

import '../../../CommonData/all_colors.dart';

class ChardikePolicy extends StatelessWidget {
  const ChardikePolicy({Key? key}) : super(key: key);
  static const String routeName = "chardike_policy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back,color: AllColors.mainColor,)),
        title: Text("Chardike Policies",style: TextStyle(color: Colors.black),),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Terms of Service"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("Privacy Policy"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("Prohibited and Restricted Items Policy"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
            ListTile(
              title: Text("Refund and Return Policy"),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
