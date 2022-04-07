import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static const String routeName = "/payment_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Payment Method"),
        centerTitle: false,
        elevation: 0.5,
      ),
      bottomNavigationBar:Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        height: getProportionateScreenWidth(80),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 50,
                  offset: Offset(5 , -2)
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Subtotal",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(11)),),
                Text(CommonData.takaSign+ " "+"225",style: CommonData.customTextStyle(),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total Ammount",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(11)),),
                Text(CommonData.takaSign+ " "+"225",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(15)),)
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenWidth(10),),
              Text("Recommended method(s)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(10)),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Row(
                children: <Widget>[
                  const FaIcon(FontAwesomeIcons.creditCard),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  const Text("Credit/Debit Card",style: TextStyle(fontWeight: FontWeight.w500),),
                  Expanded(child: RichText(
                    textAlign: TextAlign.end,
                    text: TextSpan(
                      children: [
                        WidgetSpan(child: Padding(
                          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                          child: const FaIcon(FontAwesomeIcons.ccVisa,color: Colors.purple,),
                        )),
                        WidgetSpan(child: Padding(
                          padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                          child: const FaIcon(FontAwesomeIcons.ccMastercard,color: Colors.red,),
                        )),
                        const WidgetSpan(child: Icon(Icons.arrow_forward_ios,color: Colors.black,)),
                      ]
                    ),
                  ))
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(10),),
              Divider(color: Colors.black.withOpacity(0.5),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Text("Other saved method(s)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(10)),),
              SizedBox(height: getProportionateScreenHeight(10),),
              Row(
                children: <Widget>[
                  Image.asset("asset/icons/bkash.png",height: getProportionateScreenWidth(30),width: getProportionateScreenWidth(30)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  const Expanded(child: Text("017*****905")),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Container(
                    height: getProportionateScreenWidth(20),
                    width: getProportionateScreenWidth(20),
                    padding: EdgeInsets.all(getProportionateScreenWidth(3)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey)
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.circle
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenWidth(10),),
              Divider(color: Colors.black.withOpacity(0.5),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Text("Payment methods",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(10)),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Row(
                children: <Widget>[
                  Image.asset("asset/icons/rocket.png",height: getProportionateScreenWidth(30),width: getProportionateScreenWidth(30)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Expanded(child: Text("Rocket",style: CommonData.customTextStyle(),)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              Divider(color: Colors.black.withOpacity(0.5),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Row(
                children: <Widget>[
                  Image.asset("asset/icons/dbble.png",height: getProportionateScreenWidth(30),width: getProportionateScreenWidth(30)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Expanded(child: Text("DBBL, Nexus Card",style: CommonData.customTextStyle(),)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              Divider(color: Colors.black.withOpacity(0.5),),
              SizedBox(height: getProportionateScreenWidth(10),),
              Row(
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.circleDollarToSlot),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Expanded(child: Text("Cash On Delivery",style: CommonData.customTextStyle(),)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
