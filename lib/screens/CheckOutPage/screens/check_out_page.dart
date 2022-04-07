import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CheckOutPage/controller/check_out_controller.dart';
import 'package:chardike/screens/PaymentMethodPage/screen/payment_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../CommonData/common_data.dart';

class CheckOutPage extends StatelessWidget {
  CheckOutPage({Key? key}) : super(key: key);
  static const String routeName = "/check_out_page";
  final CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
        centerTitle: false,
      ),
      bottomNavigationBar:Container(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        height: getProportionateScreenWidth(60),
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
        child: Row(
          children: [
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: <Widget>[
                    Text("Total: ",style: CommonData.customTextStyle(),),
                    Text(CommonData.takaSign+ " "+ "3478",style: TextStyle(fontWeight: FontWeight.bold),)
                  ],
                ),
                Text("VAT included, where applicable",style: CommonData.customTextStyle(),)
              ],
            )),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, PaymentScreen.routeName);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                decoration: BoxDecoration(
                    color: AllColors.mainColor,
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                ),
                height: getProportionateScreenWidth(40),
                child: const Center(child: Text("Proceed to Pay",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const Icon(Icons.location_pin,color: Colors.cyan,),
                    SizedBox(width: getProportionateScreenWidth(5),),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Roben Baskey"),
                        SizedBox(height: getProportionateScreenHeight(5),),
                        RichText(text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            WidgetSpan(child: Container(
                              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5),vertical: getProportionateScreenWidth(2)),
                              margin: EdgeInsets.only(right: getProportionateScreenWidth(5)),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                color: AllColors.mainColor
                              ),
                              child: Text("HOME",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                            )),
                            TextSpan(text: "Hazipara, Thakurgaon Sadar, Thakurgaon",style: TextStyle(fontWeight: FontWeight.bold),)
                          ]
                        )),
                        SizedBox(height: getProportionateScreenHeight(5),),
                      ],
                    )),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Text("EDIT",style: TextStyle(color: AllColors.mainColor,fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(5),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.sticky_note_2_outlined,color: Colors.cyan),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(child: Text("Bill to the same address")),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(5),),
                Row(
                  children: <Widget>[
                    const Icon(Icons.phone,color: Colors.cyan),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(child: TextField(
                      controller: _checkOutController.mobileTextEditingController.value,
                      decoration: InputDecoration(
                        suffixIcon:TextButton(onPressed: (){},child: Text("SAVE"),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                    )),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(10),),
                Row(
                  children: <Widget>[
                    const Icon(Icons.email_outlined,color: Colors.cyan),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(child: TextField(
                      controller: _checkOutController.emailTextEditingController.value,
                      decoration: InputDecoration(
                        suffixIcon:TextButton(onPressed: (){},child: Text("SAVE"),),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                        ),
                      ),
                    )),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          DottedLine(
            dashLength: 30,
            dashGapLength: 30,
            dashGapRadius: getProportionateScreenWidth(5),
            lineThickness: getProportionateScreenHeight(5),
            dashColor: Colors.transparent,
            dashGapColor: AllColors.mainColor,
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Delivery Option",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(13)
                ),),
                SizedBox(height: getProportionateScreenWidth(5),width: double.infinity,),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.check_circle,color: Colors.grey,),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(CommonData.takaSign + " 60",style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
                                SizedBox(height: getProportionateScreenWidth(5),),
                                Text("Home Delivery",style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
                                SizedBox(height: getProportionateScreenWidth(5),),
                                Text("Est. Arrival: 7 days",style: TextStyle(fontSize: getProportionateScreenWidth(13)),)
                              ],
                            ))
                          ],
                        )
                      ),
                    ),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    Expanded(
                      child: Container(
                          padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Icon(Icons.check_circle,color: Colors.grey,),
                              SizedBox(width: getProportionateScreenWidth(10),),
                              Expanded(child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(CommonData.takaSign + " 150",style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
                                  SizedBox(height: getProportionateScreenWidth(5),),
                                  Text("Fast Home Delivery",style: TextStyle(fontSize: getProportionateScreenWidth(13)),),
                                  SizedBox(height: getProportionateScreenWidth(5),),
                                  Text("12 hours delivery",style: TextStyle(fontSize: getProportionateScreenWidth(13)),)
                                ],
                              ))
                            ],
                          )
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Container(
            height: getProportionateScreenWidth(10),
            color: Colors.grey.withOpacity(0.1),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Subtotal"),
                Text(CommonData.takaSign + " "+"434")
              ],
            ),
          ),
          SizedBox(height: getProportionateScreenWidth(10),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Shipping Fee"),
                Text(CommonData.takaSign + " "+"90")
              ],
            ),
          )
        ],
      ),
    );
  }
}
