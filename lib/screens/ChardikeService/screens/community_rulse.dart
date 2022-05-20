import 'package:flutter/material.dart';

import '../../../CommonData/all_colors.dart';

class CommunityRules extends StatelessWidget {
  const CommunityRules({Key? key}) : super(key: key);
  static const String routeName = "community_rules";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back,color: AllColors.mainColor,)),
        title: Text("Community Rules",style: TextStyle(color: Colors.black),),
        centerTitle: false,
      ),
    );
  }
}
