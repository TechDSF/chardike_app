import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

class FlashSaleDetails extends StatelessWidget {
  FlashSaleDetails({Key? key}) : super(key: key);
  static const String routeName = "/flashSaleDetails";
  final HomeController _homeController = Get.put(HomeController());

  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    var _aspectRatio;

    return Scaffold(
        appBar: AppBar(
          elevation: 1,
          centerTitle: false,
          title: const Text("Flash Sale"),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  "ENDS IN",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: SizeConfig.screenWidth * 0.025,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(5),
                ),
                SlideCountdownSeparated(
                  height: SizeConfig.screenWidth * 0.03,
                  width: SizeConfig.screenWidth * 0.03,
                  separatorStyle: TextStyle(color: Colors.deepOrange),
                  textStyle: TextStyle(
                      fontSize: SizeConfig.screenWidth * 0.018,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(3))),
                  duration: CommonData.calculateEndTime(
                      endTime: _homeController.allFlashList[0].endTime),
                )
              ],
            ),
            SizedBox(
              width: SizeConfig.screenWidth * 0.02,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTab ? 3 : 2,
                  crossAxisSpacing: getProportionateScreenWidth(5),
                  mainAxisSpacing: getProportionateScreenWidth(5),
                  childAspectRatio: CommonData.aspactRatio(
                      height: isTab
                          ? SizeConfig.screenWidth * 0.7
                          : SizeConfig.screenWidth * 0.7,
                      context: context,
                      crossAxisCount: 2,
                      crossAxisSpacing: 5)),
              itemCount: _homeController.flashProductList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var result = _homeController.flashProductList[index];
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ProductDetails.routeName,
                        arguments: {
                          "type": false,
                          "ds": result.productElement.flashPrice.toString(),
                          "product": result.productElement.flashProduct
                        });
                  },
                  child: SizedBox(
                    height: isTab
                        ? SizeConfig.screenWidth * 0.7
                        : SizeConfig.screenWidth * 0.5,
                    width: SizeConfig.screenWidth * 0.32,
                    child: Card(
                      color: Color(0xFFF3F5F8),
                      shadowColor: Colors.grey,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            SizeConfig.screenWidth * 0.02),
                      ),
                      child: Column(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: Container(
                            height: isTab
                                ? SizeConfig.screenWidth * 0.3
                                : SizeConfig.screenWidth * 0.43,
                            width: double.infinity,
                            padding: EdgeInsets.only(
                                top: SizeConfig.screenWidth * 0.015),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                      SizeConfig.screenWidth * 0.02),
                                ),
                                image: DecorationImage(
                                    image: NetworkImage(result.productElement
                                        .flashProduct.featureImage),
                                    fit: BoxFit.fill)),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(
                                        SizeConfig.screenWidth * 0.004),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(
                                                SizeConfig.screenWidth * 0.015),
                                            bottomRight: Radius.circular(
                                                SizeConfig.screenWidth *
                                                    0.015)),
                                        color: Colors.green),
                                    child: Text(
                                      "${result.discount}%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              SizeConfig.screenWidth * 0.027),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: SizeConfig.screenWidth * 0.05,
                                        width: SizeConfig.screenWidth * 0.05,
                                        child: Icon(
                                          Icons.favorite,
                                          color: Colors.orange,
                                          size: SizeConfig.screenWidth * 0.03,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.grey.withOpacity(0.3)),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.008,
                                      ),
                                    ],
                                  )
                                ]),
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.screenWidth * 0.01,
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.screenWidth * 0.003),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                      SizeConfig.screenWidth * 0.02),
                                  bottomRight: Radius.circular(
                                      SizeConfig.screenWidth * 0.02))),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  result
                                      .productElement.flashProduct.productName,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: isTab
                                          ? SizeConfig.screenWidth * 0.02
                                          : SizeConfig.screenWidth * 0.03,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: isTab
                                              ? SizeConfig.screenWidth * 0.025
                                              : SizeConfig.screenWidth * 0.03),
                                      text: "₺" +
                                          result.productElement.flashPrice
                                              .toString()),
                                  TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          fontSize: isTab
                                              ? SizeConfig.screenWidth * 0.018
                                              : SizeConfig.screenWidth * 0.022),
                                      text: " ₺" +
                                          result.productElement.flashProduct
                                              .regularPrice
                                              .toString())
                                ])),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RatingBar.builder(
                                      initialRating: CommonData.calculateRating(
                                          result.productElement.flashProduct
                                              .reviews),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemSize: isTab
                                          ? SizeConfig.screenWidth * 0.02
                                          : SizeConfig.screenWidth * 0.03,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ),
                                    Text(
                                      "(${result.productElement.flashProduct.reviews.length})",
                                      style: TextStyle(
                                        fontSize: isTab
                                            ? SizeConfig.screenWidth * 0.02
                                            : SizeConfig.screenWidth * 0.03,
                                      ),
                                    )
                                  ],
                                ),
                              ]),
                        ))
                      ]),
                    ),
                  ),
                );
              }),
        ));
  
  }
}
