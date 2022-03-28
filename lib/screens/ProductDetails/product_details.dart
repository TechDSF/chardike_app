import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key,required this.productModel}) : super(key: key);
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
            expandedHeight: getProportionateScreenHeight(310+kToolbarHeight),
            flexibleSpace: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  AppBar(
                    actions: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                        child: FaIcon(FontAwesomeIcons.home,color: Colors.grey,),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                        child: FaIcon(FontAwesomeIcons.cartShopping,color: Colors.grey,),
                      ),
                    ],
                  ),
                  Container(
                    height: getProportionateScreenHeight(310),
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(7))
                    ),
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount: productModel.image.length,
                          options: CarouselOptions(
                            height: getProportionateScreenHeight(300),
                            viewportFraction: 1,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlayCurve: Curves.linear,
                            enlargeCenterPage: true,
                            scrollDirection: Axis.horizontal,
                          ),
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                  image: DecorationImage(
                                    image: AssetImage(productModel.image[itemIndex]),fit: BoxFit.fill
                                  )
                                ),
                                width: double.infinity,
                              ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: getProportionateScreenWidth(50),
                                  height: getProportionateScreenWidth(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                    color: Colors.grey
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Obx(()=>Text(productModel.image.length.toString()),),
                                      Text(productModel.image.length.toString())
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: Colors.greenAccent,
            floating: true,
            title: Text("dfjkd",style: TextStyle(color: Colors.black),),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(15),
                  child: Container(
                    color: Colors.blue[100 * (index % 9 + 1)],
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(
                      "Item $index",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                );
              },
              childCount: 1000, // 1000 list items
            ),
          ),
        ],
      ),
    );
  }
}
