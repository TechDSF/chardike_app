import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/CartPage/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';

class CartItem extends StatefulWidget {
  CartItem({Key? key,required this.cartModel,required this.itemCount}) : super(key: key);
  CartModel cartModel;
  int itemCount;


  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  final CartController _cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
      child: Row(
        children: [
          Container(
            height: getProportionateScreenHeight(100),
            width: getProportionateScreenHeight(100),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
              image: DecorationImage(
                image: AssetImage(widget.cartModel.image)
              )
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(10),),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Expanded(child: Text("${widget.cartModel.title} ",
                    style:const TextStyle(color: Colors.black,fontWeight: FontWeight.w500),maxLines: 2,)),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Text("${CommonData.takaSign} ${widget.itemCount * widget.cartModel.price}",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(15),),
              Row(
                children: <Widget>[
                  Expanded(child: RichText(
                    text: TextSpan(
                      text: '',
                      style: TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            text: '${CommonData.takaSign} ${widget.cartModel.price}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text:" x ${widget.itemCount}")
                      ],
                    ),
                  ),
                  ),
                  Row(
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          if(widget.itemCount > 1){
                            setState(() {
                              _cartController.subTotalAmount.value -= widget.cartModel.price.toInt();
                              _cartController.mainTotalAmount.value -= widget.cartModel.price.toInt();
                              widget.itemCount--;
                            });
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
                        child: Center(child: Text(widget.itemCount.toString())),
                      ),
                      InkWell(
                        onTap: (){
                          if(widget.itemCount < 5){
                            setState(() {
                              _cartController.subTotalAmount.value += widget.cartModel.price.toInt();
                              _cartController.mainTotalAmount.value += widget.cartModel.price.toInt();
                              widget.itemCount++;
                            });

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
  }
}
