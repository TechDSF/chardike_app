import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';

class SliderDetails extends StatelessWidget {
  SliderDetails({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  Widget SectionTitle(String text, VoidCallback onTap){
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RichText(
                  text: TextSpan(
                      style: TextStyle(
                          color: Colors.black
                      ),
                      children: <TextSpan>[
                        TextSpan(text: text+" ",style: TextStyle(
                            fontSize: getProportionateScreenWidth(14),
                            fontWeight: FontWeight.w600
                        )),
                        TextSpan(text: "SALE",style: TextStyle(
                            fontSize: getProportionateScreenWidth(16),
                            fontWeight: FontWeight.bold
                        )),
                      ]
                  )

              ),
              InkWell(onTap: onTap,child: Text("See More",style: TextStyle(color: AllColors.mainColor)))
            ],
          ),
        ),
        Divider(color: Colors.grey.withOpacity(0.5),)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    var _aspectRatio;

    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: false,
        title: const Text("Hot Deal"),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(child: FaIcon(FontAwesomeIcons.cartShopping)),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.asset("asset/images/category/gift_vouchar.png",height: getProportionateScreenHeight(200),width: double.infinity,),
              SizedBox(height: getProportionateScreenHeight(20),),
              ///banner section
              Container(
                height: getProportionateScreenHeight(100),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        getProportionateScreenWidth(10)),
                    image: const DecorationImage(
                        image: AssetImage("asset/images/banner_1.png"),
                        fit: BoxFit.fill)),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              ///all product
              Obx(() {
                if (_homeController.isProductDataLoading.value) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.1),
                    highlightColor: Colors.grey.withOpacity(0.5),
                    child: Container(
                      height: getProportionateScreenHeight(170),
                      color: Colors.yellow,
                    ),
                  );
                }
                else {
                  return GridView.builder(
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: aspt(300),
                      ),
                      itemCount: _homeController.productList.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        var result = _homeController.productList[(_homeController.productList.length-1) - index];
                        return InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, ProductDetails.routeName, arguments: result);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  top: const BorderSide(color: Colors.grey,width: 0.5),
                                  left: index%2==0?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                                  right: index%2==0?const BorderSide(color: Colors.grey,width: 0):const BorderSide(color: Colors.grey,width: 0.5),
                                  bottom: index == _homeController.productList.length-1 || index == _homeController.productList.length-2?const BorderSide(color: Colors.grey,width: 0.5):const BorderSide(color: Colors.grey,width: 0),
                                )
                            ),
                            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                            child: Column(
                              children: <Widget>[
                                Expanded(
                                  child: Stack(
                                    children: <Widget>[
                                      Image.asset(
                                        result.image[0],
                                        fit: BoxFit.fill,
                                      ),
                                      Positioned(
                                          right: 0,
                                          child: Container(
                                            height:
                                            getProportionateScreenWidth(
                                                20),
                                            width:
                                            getProportionateScreenWidth(
                                                45),
                                            decoration: BoxDecoration(
                                                color: Colors.orange,
                                                borderRadius: BorderRadius.only(
                                                    topLeft: Radius.circular(
                                                        getProportionateScreenWidth(
                                                            10)),
                                                    bottomLeft: Radius.circular(
                                                        getProportionateScreenWidth(
                                                            10)))),
                                            child: Center(
                                                child: Text(
                                                  "-${result.discount}%",
                                                  style: TextStyle(
                                                      fontSize:
                                                      getProportionateScreenWidth(
                                                          10),
                                                      color: Colors.white,
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )),
                                          ))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(10),
                                ),
                                Text(result.title,maxLines: 2,textAlign: TextAlign.start,style: TextStyle(
                                    fontSize: getProportionateScreenWidth(12)
                                ),),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      getProportionateScreenWidth(5)),
                                  child: Row(
                                    children: [
                                      Text(
                                        "₺ " + result.price.toString()+" ",
                                        style: TextStyle(
                                            color: AllColors.mainColor),
                                      ),
                                      Text(
                                        "₺" + result.price.toString(),
                                        style: TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,fontSize: getProportionateScreenWidth(10)),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Row(
                                  children: [
                                    RatingBarIndicator(
                                      rating: result.rating,
                                      itemBuilder: (context, index) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      itemCount: 5,
                                      itemSize: getProportionateScreenWidth(10),
                                      direction: Axis.horizontal,
                                    ),
                                    Text("(${result.totalRating})",style: TextStyle(
                                        fontSize: getProportionateScreenWidth(10)
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
