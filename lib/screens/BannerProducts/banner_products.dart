import 'package:chardike/screens/HomePage/model/banner_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../CommonData/common_data.dart';
import '../../size_config.dart';
import '../HomePage/model/product_model.dart';
import '../ProductDetails/product_details.dart';

class BannerProducts extends StatelessWidget {
  BannerProducts({Key? key, required this.bannerModel}) : super(key: key);
  BannerModel bannerModel;

  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(bannerModel.name),
      ),
      body: bannerModel.products.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                  ),
                  Container(
                    height: SizeConfig.screenWidth * 0.7,
                    width: SizeConfig.screenWidth * 0.7,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/images/empty_cart.png"))),
                  ),
                ])
         
          : Padding(
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
                  itemCount: bannerModel.products.length,
                  itemBuilder: (context, index) {
                    var result = bannerModel.products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetails.routeName,
                            arguments: {
                              "type": true,
                              "ds": "0",
                              "product": result.bannerProduct
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
                                        image: NetworkImage(
                                            result.bannerProduct!.featureImage),
                                        fit: BoxFit.fill)),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.all(
                                            SizeConfig.screenWidth * 0.004),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(
                                                    SizeConfig.screenWidth *
                                                        0.015),
                                                bottomRight: Radius.circular(
                                                    SizeConfig.screenWidth *
                                                        0.015)),
                                            color: Colors.green),
                                        child: Text(
                                          "${CommonData.calculateDiscount(regularPrice: double.parse(result.bannerProduct!.regularPrice), sellingPrice: double.parse(result.bannerProduct!.sellingPrice))}%",
                                          //"${result.regularPrice}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: SizeConfig.screenWidth *
                                                  0.03),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.screenWidth * 0.05,
                                            width:
                                                SizeConfig.screenWidth * 0.05,
                                            child: Icon(
                                              Icons.favorite,
                                              color: Colors.orange,
                                              size:
                                                  SizeConfig.screenWidth * 0.03,
                                            ),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.grey
                                                    .withOpacity(0.3)),
                                          ),
                                          SizedBox(
                                            width:
                                                SizeConfig.screenWidth * 0.008,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text(
                                      result.bannerProduct!.productName,
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
                                                  ? SizeConfig.screenWidth *
                                                      0.025
                                                  : SizeConfig.screenWidth *
                                                      0.03),
                                          text: CommonData.takaSign +
                                              result
                                                  .bannerProduct!.sellingPrice),
                                      TextSpan(
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: isTab
                                                  ? SizeConfig.screenWidth *
                                                      0.018
                                                  : SizeConfig.screenWidth *
                                                      0.022),
                                          text: " " +
                                              CommonData.takaSign +
                                              result.bannerProduct!.regularPrice
                                                  .toString())
                                    ])),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        RatingBarIndicator(
                                          rating: CommonData.calculateRating(
                                              result.bannerProduct!.reviews),
                                          itemBuilder: (context, index) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          itemCount: 5,
                                          itemSize:
                                              SizeConfig.screenWidth * 0.03,
                                          direction: Axis.horizontal,
                                        ),
                                        Text(
                                          "(${result.bannerProduct!.reviews.length})",
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
            ),
   
    );
  }
}
