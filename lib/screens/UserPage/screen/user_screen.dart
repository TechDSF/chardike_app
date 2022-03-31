import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../AuthenticationPage/screens/login_screen.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getProportionateScreenHeight(250),
                child: Column(
                  children: <Widget>[
                    Expanded(child: Container(
                      width: getProportionateScreenWidth(150),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          shape: BoxShape.circle
                      ),
                      child: Center(child: FaIcon(FontAwesomeIcons.user,size: getProportionateScreenWidth(50),))
                    )),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    AppBar(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginScreen()));
                                },
                                child: Text("Login",textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15)
                                ),),
                              ),
                            )
                          ),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.moneyBill1),
                                      SizedBox(height: getProportionateScreenHeight(5),),
                                      Text("Chardike Money",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(8)),),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      FaIcon(FontAwesomeIcons.sackDollar),
                                      SizedBox(height: getProportionateScreenHeight(5),),
                                      Text("Chardike Cash",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(8)),),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                    AppBar(
                      titleTextStyle: TextStyle(
                        fontWeight: FontWeight.normal,color: Colors.black
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FaIcon(FontAwesomeIcons.magnifyingGlassDollar),
                                SizedBox(height: getProportionateScreenHeight(5),),
                                Text("Purchase Review",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(10)),),
                              ],
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FaIcon(FontAwesomeIcons.heart),
                                SizedBox(height: getProportionateScreenHeight(5),),
                                Text("Favourite Product",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(10)),),
                              ],
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FaIcon(FontAwesomeIcons.eye),
                                SizedBox(height: getProportionateScreenHeight(5),),
                                Text("Recently Viewed",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(10)),),
                              ],
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                FaIcon(FontAwesomeIcons.atom),
                                SizedBox(height: getProportionateScreenHeight(5),),
                                Text("Comodities",maxLines: 2,textAlign: TextAlign.center,style: TextStyle(fontSize: getProportionateScreenWidth(10)),),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(10),),
                  ],
                ),
              ),
              Container(
                height: getProportionateScreenHeight(10),
                color: Colors.grey.withOpacity(0.1),),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.listSquares,color: Colors.black,),
                title: Text("Order List",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.reset_tv,color: Colors.black,),
                title: Text("Cancellation/Return",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.star,color: Colors.black,),
                title: Text("Review Management",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.card_membership,color: Colors.black,),
                title: Text("Membership",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: Icon(Icons.card_membership,color: Colors.black,),
                title: Text("Membership",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.truck,color: Colors.black,),
                title: Text("Regular Delivery",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.moneyCheck,color: Colors.black,),
                title: Text("Payment Method",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.tag,color: Colors.black,),
                title: Text("Discount Coupon",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
              const ListTile(
                leading: FaIcon(FontAwesomeIcons.questionCircle,color: Colors.black,),
                title: Text("Service Center",style: TextStyle(color: Colors.black),),
                trailing: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
