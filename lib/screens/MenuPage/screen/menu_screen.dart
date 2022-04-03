import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  MenuScreen({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(80),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2)
                            ),
                            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                            child: Column(
                              children: <Widget>[
                                Image.asset("asset/images/menu/discount.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                                Text("Discount",style: TextStyle(fontSize: getProportionateScreenWidth(13)),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5),),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                            child: Column(
                              children: <Widget>[
                                Image.asset("asset/images/menu/rocket_delivery.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                                Text("Rocket Delivery",style: TextStyle(fontSize: getProportionateScreenWidth(13),overflow: TextOverflow.ellipsis),textAlign: TextAlign.center,maxLines: 1,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5),),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                            child: Column(
                              children: <Widget>[
                                Image.asset("asset/images/menu/rocket_fastball.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                                Text("Rocket Fastball",style: TextStyle(fontSize: getProportionateScreenWidth(13),overflow: TextOverflow.ellipsis),textAlign: TextAlign.center,maxLines: 1,)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: getProportionateScreenWidth(5),),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2)
                            ),
                            padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                            child: Column(
                              children: <Widget>[
                                Image.asset("asset/images/menu/rocket_fresh.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                                Text("Rocket Fresh",style: TextStyle(fontSize: getProportionateScreenWidth(13),overflow: TextOverflow.ellipsis),textAlign: TextAlign.center,maxLines: 1,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Fashion",style: TextStyle(
                            fontSize: getProportionateScreenWidth(13),
                            overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(10),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Beauty",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/milk_jar.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Baby Food",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                            overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(10),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/food.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Food",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Kitchen Utensils",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(10),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Household Goods",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Home Interior",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(10),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Electronics",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Sports",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(10),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Car Accessories",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Book",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Toys",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/beauty.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Stationary",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      ),
                      Container(height: getProportionateScreenHeight(20),width: getProportionateScreenWidth(1),color: Colors.black.withOpacity(0.2),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      Expanded(
                        child: Row(children: <Widget>[
                          Image.asset("asset/images/menu/fashion.png",height: getProportionateScreenWidth(50),width: getProportionateScreenWidth(50),),
                          Text("Health",style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              overflow: TextOverflow.ellipsis
                          ),maxLines: 1,)
                        ],),
                      )
                    ],
                  ),
                  Divider(color: Colors.black.withOpacity(0.3),),
                  SizedBox(height: getProportionateScreenHeight(10),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Theme Hall",style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("View All",style: TextStyle(color: AllColors.mainColor),)
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(10),),
                  SizedBox(
                    height: getProportionateScreenHeight(150),
                    child: CarouselSlider.builder(
                      itemCount: _homeController.sliderList.length,
                      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                        var result = _homeController.sliderList[itemIndex];
                        return Container(
                          height: getProportionateScreenHeight(150),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                            image: DecorationImage(
                              image: AssetImage(result.image),fit: BoxFit.fill
                            )
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: getProportionateScreenHeight(150),
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 1000),
                        autoPlayCurve: Curves.linear,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
      ),
    );
  }
}
