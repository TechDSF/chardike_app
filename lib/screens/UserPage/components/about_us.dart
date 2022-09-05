

import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);
  static const String routeName = "/about_us";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        title: Text("About"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(10),),
              Image.asset("asset/icons/about_us.png",height: SizeConfig.screenHeight * 0.3,),
              SizedBox(height: getProportionateScreenHeight(20),),
              Text("With inspiration from K-beauty, chardike started its journey in SEOUL initially and later in Bangladesh on April 18, 2019. Chardike brought the success of a proven eCommerce platform in Bangladesh within a year. Chardike provides a wide range of quality products from premium brands of Korea including Innisfree, Cosrx, Missha, Some by me, Skinfood, etc. We are the exclusive distributor of SKINFOOD from 1st October, 2020.",style: TextStyle(fontSize: getProportionateScreenWidth(15)),),
              SizedBox(height: getProportionateScreenHeight(10),),
              Text("Chardike provides customers high quality beauty products with exciting beauty shopping experiences. Our commitment to quality and our ‘CUSTOMER FIRST’ policy has helped to become one of the fastest-growing eCommerce websites in Bangladesh. Chardike future business strategies are to continue striving for a perfect customer experience to maintain our competitive edge, to build strategic alliances with premium brands, and to grow and develop our talents to maintain our business success.",style: TextStyle(fontSize: getProportionateScreenWidth(14)),),
              SizedBox(height: getProportionateScreenHeight(10),),
              Text("Chardike’s mission is to be free of harmful chemicals and improve the skin and enhance our customer’s looks, as well as improve the overall lifestyles of our customers by helping them look beautiful and regain their confidence. And we ensure 100% authentic Korean products to our customers.",style: TextStyle(fontSize: getProportionateScreenWidth(14)),)
            ],
          ),
        ),
      ),
    );
  }
}
