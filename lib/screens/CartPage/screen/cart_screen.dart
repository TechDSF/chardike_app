import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:group_radio_button/group_radio_button.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SHOPPING CART"),
      ),
      bottomNavigationBar: Container(
        color: AllColors.mainColor,
        height: kToolbarHeight+10,
        child: Center(child: Text("PROCEED TO CHECKOUT",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),)),
      ),
      body: _cartController.cartList.isNotEmpty?Column(
        children: <Widget>[
          Expanded(
            flex: 4,
              child: Image.asset("asset/images/empty_cart.png")),
          Expanded(
            flex: 2,
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.2),
            child: Column(
              children: <Widget>[
                Text("Your Cart is Empty",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(15)
                ),),
                SizedBox(height: getProportionateScreenHeight(7),),
                Text("Look's like you haven't added anything in your cart yet ",style: TextStyle(
                  fontSize: getProportionateScreenWidth(13),
                  color: Colors.black54
                ),textAlign: TextAlign.center,),
                SizedBox(height: getProportionateScreenHeight(20),),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25),vertical: getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(25)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]
                  ),
                  child: Text("Start Shopping"),
                ),
              ],
            ),
          ))
        ],
      ):Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListView.builder(
                itemCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index){
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
                  child: Row(
                    children: [
                      Container(
                        height: getProportionateScreenHeight(100),
                        width: getProportionateScreenHeight(100),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: [
                              Expanded(child: Text("Demo Text ",
                                style:TextStyle(color: Colors.black,fontWeight: FontWeight.w500),maxLines: 2,)),
                              SizedBox(width: getProportionateScreenWidth(10),),
                              Text("${CommonData.takaSign} 990",style: TextStyle(fontWeight: FontWeight.bold),)
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(15),),
                          Row(
                            children: <Widget>[
                              Expanded(child: Obx(()=>RichText(
                                text: TextSpan(
                                  text: '',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '${CommonData.takaSign} 990',
                                        style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text:" x ${_cartController.quantity.value}")
                                  ],
                                ),
                              ),)
                              ),
                              Row(
                                children: <Widget>[
                                  InkWell(
                                    onTap: (){
                                      if(_cartController.quantity.value > 1){
                                        _cartController.quantity.value--;
                                      }
                                    },
                                    child: Container(height: getProportionateScreenWidth(20),
                                      width: getProportionateScreenWidth(25),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(getProportionateScreenWidth(5)),
                                              bottomLeft: Radius.circular(getProportionateScreenWidth(5))
                                          )
                                      ),
                                      child: Center(child: Text("-")),
                                    ),
                                  ),
                                  Container(height: getProportionateScreenWidth(20),
                                    width: getProportionateScreenWidth(45),
                                    decoration: const BoxDecoration(
                                        border: Border.symmetric(horizontal:BorderSide(
                                          color: Colors.grey,
                                        ))
                                    ),
                                    child: Center(child: Obx(()=>Text(_cartController.quantity.value.toString()))),
                                  ),
                                  InkWell(
                                    onTap: (){
                                      if(_cartController.quantity.value < 5){
                                        _cartController.quantity.value++;
                                      }
                                    },
                                    child: Container(height: getProportionateScreenWidth(20),
                                      width: getProportionateScreenWidth(25),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(getProportionateScreenWidth(5)),
                                              bottomRight: Radius.circular(getProportionateScreenWidth(5))
                                          )
                                      ),
                                      child: Center(child: const Text("+")),
                                    ),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                );
              }),
              SizedBox(height: getProportionateScreenHeight(15),),
              Container(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(5)),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))
                ),
                child: Row(
                  children: <Widget>[
                    const Expanded(flex: 3,child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        hintText: "Coupen code"
                      ),
                    )),
                    Expanded(flex:2,child: Container(
                      height: kToolbarHeight-5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                        color: Colors.black
                      ),
                      child: Center(child: Text("Apply Coupen ->",style: TextStyle(color: Colors.white),)),
                    ))
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sub Total",style: TextStyle(fontWeight: FontWeight.w400,fontSize: getProportionateScreenWidth(14)),),
                  Text("${CommonData.takaSign} 2970",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(14)),),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              Divider(color: Colors.black,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Shipping",style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: getProportionateScreenWidth(14)
                  ),),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(height: getProportionateScreenHeight(10),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Text("Delivery Charge ${CommonData.takaSign}60",textAlign: TextAlign.end)),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            Obx(()=>InkWell(
                              onTap:(){
                                _cartController.shippingValue.value = 0;
                              },
                              child: Container(
                                height: getProportionateScreenHeight(15),
                                width: getProportionateScreenHeight(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AllColors.mainColor)
                                ),
                                child: _cartController.shippingValue.value == 0?Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.mainColor
                                  ),
                                ):SizedBox(),
                                padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Text("Spot Purchase",textAlign: TextAlign.end,)),
                            SizedBox(width: getProportionateScreenWidth(10),),
                                    Obx(()=>InkWell(
                                      onTap:(){
                                        _cartController.shippingValue.value = 1;
                            },
                                      child: Container(
                                        height: getProportionateScreenHeight(15),
                                        width: getProportionateScreenHeight(15),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(color: AllColors.mainColor)
                                        ),
                                        child: _cartController.shippingValue.value == 1?Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AllColors.mainColor
                                          ),
                                        ):SizedBox(),
                                        padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                                      ),
                                    ))
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(child: Text("8 Hours Delivery (Dhaka City Only): ৳ 150",textAlign: TextAlign.end)),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            Obx(()=>InkWell(
                              onTap:(){
                                _cartController.shippingValue.value = 2;
                              },
                              child: Container(
                                height: getProportionateScreenHeight(15),
                                width: getProportionateScreenHeight(15),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AllColors.mainColor)
                                ),
                                child: _cartController.shippingValue.value == 2?Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AllColors.mainColor
                                  ),
                                ):SizedBox(),
                                padding: EdgeInsets.all(getProportionateScreenHeight(2)),
                              ),
                            ))
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        Text("Shipping to Dhaka",textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.w400,fontSize: getProportionateScreenWidth(14)),),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        Text("Change Address",textAlign: TextAlign.end,style: TextStyle(fontWeight: FontWeight.bold,color:AllColors.mainColor, fontSize: getProportionateScreenWidth(14)),)

                      ],
                    )
                  )
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total",style: TextStyle(fontWeight: FontWeight.w400,fontSize: getProportionateScreenWidth(14)),),
                  Text("${CommonData.takaSign} 2970",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(14)),),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
