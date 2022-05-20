import 'dart:async';

import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/HomePage/model/flash_sale_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../size_config.dart';

class HomeController extends GetxController{

  late SharedPreferences preferences;
  var perDayDiscountItem = 6.obs;

  var isSliderDataLoading =false.obs;
  List<SliderModel> sliderList = List<SliderModel>.empty(growable:true).obs;
  var dotIndex = 0.obs;
  final navigatorKey = GlobalKey<NavigatorState>();
  late Timer timer;

  var isProdctTypeDataLoading =false.obs;
  List<SliderModel> productTypeList = List<SliderModel>.empty(growable:true).obs;
  ScrollController scrollController = ScrollController();



   var isCategoryDataLoading =false.obs;
   List<SliderModel> categoryList = List<SliderModel>.empty(growable:true).obs;
  //
  // var isProductDataLoading =false.obs;
  // List<ProductModel> productList = List<ProductModel>.empty(growable:true).obs;

  var isApiProductLoading = false.obs;
  List<ProductModel> apiProductList = List<ProductModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getSliderItem();
    getProductType();
    getCategoryData();
    getApiProduct();
    checkYourDiscount();
    openDiscountBanner();
    super.onInit();
  }

  checkYourDiscount()async{
    preferences = await SharedPreferences.getInstance();
    int date = preferences.getInt("discount") ?? 100;
    if(date == 100){
      preferences.setInt("discount", DateTime.now().day);
      preferences.setInt("totalDiscount", 0);
      perDayDiscountItem.value = 0;
    }else if(date == DateTime.now().day){
      perDayDiscountItem.value = preferences.getInt("totalDiscount")!;
    }else if(date != DateTime.now().day){
      preferences.setInt("discount", DateTime.now().day);
      preferences.setInt("totalDiscount", 0);
      perDayDiscountItem.value = 0;
    }
  }

  setPerDayDiscount()async{
    preferences = await SharedPreferences.getInstance();
    perDayDiscountItem.value = perDayDiscountItem.value + 1;
    preferences.setInt("totalDiscount" , perDayDiscountItem.value);
  }

  openDiscountBanner()async{
    Future.delayed(Duration(seconds: 5), (){
      showGeneralDialog(
        context: navigatorKey.currentContext!,
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return Center(
            child: Container(
              height: SizeConfig.screenHeight / 2.5,
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: getProportionateScreenHeight(40),
                      width: getProportionateScreenHeight(40),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white
                      ),
                      child: Center(child: GestureDetector(onTap: (){Navigator.pop(navigatorKey.currentContext!);},child: Icon(Icons.clear,size: getProportionateScreenHeight(20),)),),
                    ),
                  ),
                  SizedBox(height: getProportionateScreenHeight(10),),
                  Expanded(child: Container(
                    margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                      image: DecorationImage(
                        image: AssetImage("asset/images/supar_sale_discount_image.png")
                      )
                    ),
                  ))
                ],
              ),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.transparent, borderRadius: BorderRadius.circular(40)
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          Tween<Offset> tween;
          if (anim.status == AnimationStatus.reverse) {
            tween = Tween(begin: Offset(0, 0), end: Offset.zero);
          } else {
            tween = Tween(begin: Offset(0, 0), end: Offset.zero);
          }

          return SlideTransition(
            position: tween.animate(anim),
            child: FadeTransition(
              opacity: anim,
              child: child,
            ),
          );
        },
      );
    });

  }

  getApiProduct()async{
    isApiProductLoading(true);
    var data = await ApiService.fetchProducts();
    if(data.runtimeType == int){
      isApiProductLoading(false);
      Fluttertoast.showToast(msg: "Product fetch error");
    }else{
      ProductResult myData = data;
      myData.results.forEach((element) {
        apiProductList.add(element);
      });
      isApiProductLoading(false);
    }
  }

  getSliderItem(){
    isSliderDataLoading(true);
    var list = [
      SliderModel(type: "1", image: "asset/images/image1.webp"),
      SliderModel(type: "2", image: "asset/images/image2.jpeg"),
      SliderModel(type: "3", image: "asset/images/image3.webp"),
      SliderModel(type: "4", image: "asset/images/image4.jpeg"),
      SliderModel(type: "5", image: "asset/images/image5.png")
    ];
    sliderList = list;
    isSliderDataLoading(false);
  }

  getProductType(){
    isProdctTypeDataLoading(true);
    var list = [
      SliderModel(type: "Moedas Shopee", image: "asset/images/dollar_beg.png"),
      SliderModel(type: "Frete Gratis", image: "asset/images/shopping_beg.png"),
      SliderModel(type: "Shopee Official", image: "asset/images/free_delivery.png"),
      SliderModel(type: "Moedas Shopee", image: "asset/images/dollar_beg.png"),
      SliderModel(type: "Frete Gratis", image: "asset/images/free_delivery.png"),
      SliderModel(type: "Cupons Diarios", image: "asset/images/shopping_beg.png"),
      SliderModel(type: "Cupons Diarios", image: "asset/images/dollar_beg.png"),
      SliderModel(type: "Frete Gratis", image: "asset/images/shopping_beg.png"),
      SliderModel(type: "Shopee Official", image: "asset/images/free_delivery.png"),
      SliderModel(type: "Frete Gratis", image: "asset/images/dollar_beg.png"),
      SliderModel(type: "Cupons Diarios", image: "asset/images/free_delivery.png"),
      SliderModel(type: "Cupons Diarios", image: "asset/images/shopping_beg.png"),
      SliderModel(type: "Cupons Diarios", image: "asset/images/dollar_beg.png"),
    ];

    productTypeList = list;
    isProdctTypeDataLoading(false);
  }

  getCategoryData(){
    isCategoryDataLoading(true);
    var list = [
      SliderModel(type: "Skin Cream", image: "asset/images/catImage/cat_image5.png"),
      SliderModel(type: "Hair Oil", image: "asset/images/catImage/cat_image4.png"),
      SliderModel(type: "Hair Care", image: "asset/images/catImage/hair_care.png"),
      SliderModel(type: "Skin Care", image: "asset/images/catImage/cat_image5.png"),
      SliderModel(type: "Beauty Cosmetics", image: "asset/images/catImage/beauty_cosmetic.jpeg"),
      SliderModel(type: "Body Care", image: "asset/images/catImage/body_care.png"),
      SliderModel(type: "Herbal Body Care", image: "asset/images/catImage/cat_image9.png"),
      SliderModel(type: "Cosmetic Raw Material", image: "asset/images/catImage/cat_image6.png"),
      SliderModel(type: "Lip Cosmetics", image: "asset/images/catImage/cat_image7.png"),
      SliderModel(type: "Body Cream", image: "asset/images/catImage/cat_image5.png"),
      SliderModel(type: "Body Lotions", image: "asset/images/catImage/body_lotion.jpeg"),
      SliderModel(type: "Hair Wig", image: "asset/images/catImage/cat_image9.png"),
      SliderModel(type: "Nail Cosmetics", image: "asset/images/catImage/cat_image8.png"),
    ];
    categoryList = list;
    isCategoryDataLoading(false);
  }

}