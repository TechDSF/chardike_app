import 'package:flutter/material.dart';

import '../../../size_config.dart';

class LinkSocialMedia extends StatelessWidget {
  LinkSocialMedia({Key? key}) : super(key: key);
  static const String routeName = "/link_social_media";
  final TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        title: Text("Social Media Accounts"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(20),),
        ],
      ),
    );
  }
}
