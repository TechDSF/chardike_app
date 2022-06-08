
import 'dart:developer';

import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../CommonData/all_colors.dart';
import '../../ProductDetails/product_details.dart';

class SubSearchScreen extends StatelessWidget {
  SubSearchScreen({Key? key}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;

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
        toolbarHeight: isTab?getProportionateScreenHeight(70):kToolbarHeight,
        title: Container(
          height: isTab?getProportionateScreenHeight(50):getProportionateScreenHeight(40),
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            controller: _searchController.subSearchTextController.value,
            onChanged: (value){
              if(value.isEmpty){
                _searchController.showType.value = false;
                _searchController.isTextEmpty.value = true;
              }else{
                _searchController.isTextEmpty.value = false;
              }
              _searchController.getSearchSuggestionList(value);
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: "Search here"
            ),
          ),
        ),
        actions: <Widget>[
          SizedBox(width: getProportionateScreenWidth(10),),
          CommonData.icon(icon: "asset/icons/search_icon.png", color: Colors.black, isTab: isTab),
          SizedBox(width: getProportionateScreenWidth(10),)
        ],
      ),
      body: Obx((){
        if(_searchController.showType.value){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _homeController.queryProductList.length,
              itemBuilder: (context , index){
              var result = _homeController.queryProductList[index];
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
                                border: Border.all(color: Colors.grey.withOpacity(0.1)),
                                image: DecorationImage(
                                  image: NetworkImage(result.featureImage),fit: BoxFit.fill
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
                                  Text(result.productName.toString(),style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(14)
                                  ),maxLines: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "10% ${CommonData.takaSign}",style: const TextStyle(color: Colors.black)),
                                        TextSpan(text: result.regularPrice.toString(),style: const TextStyle(
                                          decoration: TextDecoration.lineThrough,color: Colors.black
                                        )),
                                      ],
                                    ),
                                  ),
                                  Text(CommonData.takaSign + " "+result.newPrice.toString(),style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15),
                                    fontWeight: FontWeight.w600,
                                    color: AllColors.mainColor
                                  ),),
                                  Row(
                                    children: [
                                      RatingBarIndicator(
                                        rating: 3,
                                        itemBuilder: (context, index) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        itemCount: 5,
                                        itemSize: getProportionateScreenWidth(12),
                                        direction: Axis.horizontal,
                                      ),
                                      Text("(5)")
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
          });
        }else{
          return Obx((){
            if(_searchController.isTextEmpty.value){
              if (_homeController.isQueryProductLoading.value) {
                return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTab?4:3,
                        crossAxisSpacing: getProportionateScreenWidth(5),
                        mainAxisSpacing: getProportionateScreenWidth(5)
                    ),
                    itemBuilder: (context , index){
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.1),
                        highlightColor: Colors.grey.withOpacity(0.5),
                        child: Container(
                          height: getProportionateScreenHeight(170),
                          color: Colors.yellow,
                        ),
                      );
                    });
              } else {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTab?4:3,
                      crossAxisSpacing: getProportionateScreenWidth(5),
                      mainAxisSpacing: getProportionateScreenWidth(5),
                      childAspectRatio: isTab?aspt(getProportionateScreenWidth(420)):aspt(getProportionateScreenWidth(300)),
                    ),
                    itemCount: _homeController.queryProductList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var result = _homeController.queryProductList[
                      (_homeController.queryProductList.length - 1) -
                          index];
                      return InkWell(
                        onTap: () {
                          // var data = _homeController.queryProductList[index];
                          // var model = ProductModel(
                          //     id: data.id, productImage: data.featureImage, createdAt: createdAt, updatedAt: updatedAt, isActive: isActive, productName: productName, slug: slug, meta: meta, shortDescriptions: shortDescriptions, longDescription: longDescription, alterText: alterText, sku: sku, upc: upc, featureImage: featureImage, regularPrice: regularPrice, newPrice: newPrice, inventory: inventory, isStock: isStock, brand: brand, country: country, category: category, subCategory: subCategory)
                          // Navigator.pushNamed(
                          //     context, ProductDetails.routeName,
                          //     arguments:
                          //     _homeController.queryProductList[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.05)),
                          padding: EdgeInsets.all(
                              getProportionateScreenWidth(8)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                height: isTab?getProportionateScreenWidth(110):getProportionateScreenWidth(90),
                                width: isTab?getProportionateScreenWidth(110):getProportionateScreenWidth(90),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey
                                            .withOpacity(0.3))
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Image.network(
                                        result.featureImage,
                                        fit: BoxFit.cover,
                                        height: isTab?getProportionateScreenWidth(105):getProportionateScreenWidth(85),
                                        width: isTab?getProportionateScreenWidth(105):getProportionateScreenWidth(85),
                                      ),
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
                                                "-10%",
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
                              Text(
                                result.productName.toString(),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize:
                                    getProportionateScreenWidth(12)),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              Text(
                                "₺ " + result.newPrice.toString() + " ",
                                style: TextStyle(
                                    color: AllColors.mainColor,
                                    fontSize:
                                    getProportionateScreenWidth(13)),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: 4.4,
                                    itemBuilder: (context, index) =>
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize:
                                    getProportionateScreenWidth(10),
                                    direction: Axis.horizontal,
                                  ),
                                  Text(
                                    "(34)",
                                    style: TextStyle(
                                        fontSize:
                                        getProportionateScreenWidth(
                                            10)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              }
            }else{
              return ListView.builder(
                  itemCount: _searchController.suggestionList.value.length,
                  itemBuilder: (context , index){
                    return ListTile(
                      onTap: (){
                        _searchController.showType.value = true;
                        _searchController.subSearchTextController.value.text = _searchController.suggestionList.value[index];
                      },
                      title: Text(_searchController.suggestionList.value[index]),
                      trailing: Icon(Icons.keyboard_arrow_up),
                    );
                  });
            }
          });
        }
      })
    );
  }
}
