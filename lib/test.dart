import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  Test({Key? key}) : super(key: key);
  static const String routeName = "/test";
  HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(70),),
          Text("Hii")
        ],
      ),
    );
  }
}
