import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({Key? key}) : super(key: key);
  static const String routeName = "/return_policy";

  Widget customText({required String text}){
    return Text(text,style: TextStyle(fontSize: getProportionateScreenWidth(14)),);
  }
  
  Widget customRichText({required String serial, required String text}){
    return RichText(text: TextSpan(
        children: [
          TextSpan(text: "$serial. ",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.black),),
          TextSpan(text:text,style: TextStyle(fontSize: getProportionateScreenWidth(14),color: Colors.black),),
        ]
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        title: Text("Return Policy"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("1. Returns, Refunds and Exchange",style: TextStyle(fontSize: getProportionateScreenWidth(15),fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: getProportionateScreenHeight(5),),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
                child: customText(text: "Chardike.com does not take title to returned items until the item arrives at our fulfillment center. At our discretion, a refund may be issued without requiring a return. In this situation, Chardike.com does not take title to the refunded item. Chardike.com is giving the opportunity to return, refunds, cancellation and exchange but in that case you need to follow the procedure of chardike.com."),
              ),
              SizedBox(height: getProportionateScreenHeight(25),),
              Text("2. What and how can I return?",style: TextStyle(fontSize: getProportionateScreenWidth(15),fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: getProportionateScreenHeight(5),),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
                child: Column(
                  children: [
                    customRichText(serial: "1", text: "If the product is damaged or broken while delivering the product, you must call and inform us in front of the Deliveryman. You can call us on 01790270066 or send a mail info@chardike.com."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customText(text: "If for some reason you can’t receive the product yourself, you must inform the person who received the product instead of you."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customText(text: "No such complaint will be admissible after the delivery man has left."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customRichText(serial: "2", text: "If the wrong product or number is not correct while receiving the product your Invoice number and the product received are not the same, you need to call and inform the delivery man in front. We will deliver the missing products to you within 24-72 hours and you do not have to pay any extra delivery charge."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customText(text: "No such complaint will be admissible after the delivery man has left."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customRichText(serial: "3", text: "The product is as expected If it doesn’t work after receiving the product it does not work as you expected or the feature mentioned in the product page is missing, you can contact our complaint handling team."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customText(text: "Remember, you must notify us of your complaint within a maximum of 24 hours after receiving the product."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customRichText(serial: "4", text: "If you do not like the product at the time of receiving, you can return to Delivery Man. The product must be unused, unworn, unwashed and without any flaws. In that case delivery charge has to be paid (90 Tk inside Dhaka, 150 Tk outside Dhaka)."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customRichText(serial: "5", text: "If you get any replica products from chardike and you are able to prove it in that case If you paid full money then we will refund you full amount of money."),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    customRichText(serial: "6", text: "No cancellation will be allowed after sending the product. If anyone wants to cancel he/she has to pay the delivery charge. (90 Tk inside Dhaka, 150 Tk outside Dhaka)."),
                    SizedBox(height: getProportionateScreenHeight(30),),
                    customText(text: "** The Return Policy will not be valid after the seal is broken or if the product does not suit you. **")
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(25),),
              Text("3. Contact Us:",style: TextStyle(fontSize: getProportionateScreenWidth(15),fontWeight: FontWeight.bold,color: Colors.black),),
              SizedBox(height: getProportionateScreenHeight(5),),
              Padding(
                padding: EdgeInsets.only(left: getProportionateScreenWidth(15)),
                child: customText(text: "Need service or Support? Make a request and we will find you a solution."),
              ),
              SizedBox(height: getProportionateScreenHeight(50),)
            ],
          ),
        ),
      ),
    );
  }
}
