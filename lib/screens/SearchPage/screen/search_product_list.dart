import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';
import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';

class SearchProductList extends StatelessWidget {
  SearchProductList({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: getProportionateScreenHeight(40),
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            onChanged: (value) {

            },
            decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search here"),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Center(child: Icon(Icons.home_outlined,size: getProportionateScreenWidth(30),)),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Center(child: InkWell(
            onTap: (){
              Navigator.pushNamed(context, CartScreen.routeName);
            },
              child: CommonData.icon(icon: "asset/icons/cart.png", color: Colors.black))),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: _homeController.productList.length,
          itemBuilder: (context , index){
            var result = _homeController.productList[index];
            return InkWell(
              onTap: (){
                Navigator.pushNamed(context, ProductDetails.routeName, arguments: result);
              },
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5),
                          horizontal: getProportionateScreenWidth(5)
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: getProportionateScreenHeight(150),
                            width: getProportionateScreenHeight(150),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                image: DecorationImage(
                                    image: AssetImage(result.image[0]),fit: BoxFit.fill
                                )
                            ),
                          ),
                          SizedBox(width: getProportionateScreenWidth(10),),
                          Expanded(child: SizedBox(
                            height: getProportionateScreenHeight(120),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(result.title,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(14)
                                ),maxLines: 2,),
                                RichText(
                                  text: TextSpan(
                                    text: '',
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "${result.discount.toString()}% ${CommonData.takaSign}",style: const TextStyle(color: Colors.black)),
                                      TextSpan(text: '${result.cutPrice}',style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,color: Colors.black
                                      )),
                                    ],
                                  ),
                                ),
                                Text(CommonData.takaSign + " "+result.price.toString(),style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.w600,
                                    color: AllColors.mainColor
                                ),),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: result.rating,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: getProportionateScreenWidth(12),
                                      direction: Axis.horizontal,
                                    ),
                                    Text("(${result.totalRating})")
                                  ],
                                ),
                              ],
                            ),
                          )),
                        ],
                      )),
                  Divider()
                ],
              ),
            );
          }),
    );
  }
}
