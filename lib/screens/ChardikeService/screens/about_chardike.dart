import 'package:chardike/CommonData/all_colors.dart';
import 'package:flutter/material.dart';

class AboutChardike extends StatelessWidget {
  const AboutChardike({Key? key}) : super(key: key);
  static const String routeName = "about_chardike";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back,color: AllColors.mainColor,)),
        title: Text("About",style: TextStyle(color: Colors.black),),
        centerTitle: false,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.info_outline,color: AllColors.mainColor,))
        ],
      ),
      body: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
