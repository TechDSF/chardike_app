
import 'dart:developer';

import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';
import '../../ProductDetails/product_details.dart';

class SingleSearchScreen extends StatelessWidget {
  SingleSearchScreen({Key? key}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: getProportionateScreenHeight(40),
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            controller: _searchController.searchTextController.value,
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
          CommonData.icon(icon: "asset/icons/search_icon.png", color: Colors.black),
          SizedBox(width: getProportionateScreenWidth(10),)
        ],
      ),
      body: Obx((){
        if(_searchController.showType.value){
          return ListView.builder(
            shrinkWrap: true,
            itemCount: _homeController.apiProductList.length,
              itemBuilder: (context , index){
              var result = _homeController.apiProductList[index];
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
                                  Text(result.name,style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(14)
                                  ),maxLines: 2,),
                                  RichText(
                                    text: TextSpan(
                                      text: '',
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: "10% ${CommonData.takaSign}",style: const TextStyle(color: Colors.black)),
                                        TextSpan(text: '${result.oldPrice}',style: const TextStyle(
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
              return SizedBox();
            }else{
              return ListView.builder(
                  itemCount: _searchController.suggestionList.value.length,
                  itemBuilder: (context , index){
                    return ListTile(
                      onTap: (){
                        _searchController.showType.value = true;
                        _searchController.searchTextController.value.text = _searchController.suggestionList.value[index];
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
