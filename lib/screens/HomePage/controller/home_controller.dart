import 'package:chardike/screens/HomePage/model/flash_sale_model.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  var isSliderDataLoading =false.obs;
  List<SliderModel> sliderList = List<SliderModel>.empty(growable:true).obs;
  var dotIndex = 0.obs;

  var isProdctTypeDataLoading =false.obs;
  List<SliderModel> productTypeList = List<SliderModel>.empty(growable:true).obs;
  ScrollController scrollController = ScrollController();

  var isFlashSaleDataLoading =false.obs;
  List<FlashSaleModel> flashSaleList = List<FlashSaleModel>.empty(growable:true).obs;

  var isCategoryDataLoading =false.obs;
  List<SliderModel> categoryList = List<SliderModel>.empty(growable:true).obs;

  var isProductDataLoading =false.obs;
  List<ProductModel> productList = List<ProductModel>.empty(growable:true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getSliderItem();
    getProductType();
    getFlashSaleData();
    getCategoryData();
    getProduct();
    super.onInit();
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

  getFlashSaleData(){
    isFlashSaleDataLoading(true);
    var list = [
      FlashSaleModel(discount: "59", soldNumber: 146, price: 1099,image: "asset/images/flashImage/flash_sale_1.jpeg",total: 150),
      FlashSaleModel(discount: "48", soldNumber: 48, price: 1550,image: "asset/images/flashImage/flash_sale_2.jpeg",total:100),
      FlashSaleModel(discount: "2", soldNumber: 47, price: 4490,image: "asset/images/flashImage/flash_sale_3.jpeg",total: 100),
      FlashSaleModel(discount: "30", soldNumber: 171, price: 2029,image: "asset/images/flashImage/flash_sale_4.jpeg",total: 200),
      FlashSaleModel(discount: "26", soldNumber: 35, price: 2822,image: "asset/images/flashImage/flash_sale_5.jpg",total: 50),
      FlashSaleModel(discount: "17", soldNumber: 50, price: 2499,image: "asset/images/flashImage/flash_sale_6.png",total: 100),
      FlashSaleModel(discount: "17", soldNumber: 50, price: 2499,image: "asset/images/flashImage/flash_sale_7.jpeg",total: 100),
    ];
    flashSaleList = list;
    isFlashSaleDataLoading(false);
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

  getProduct(){
    isProductDataLoading(true);
    var list = [
      ProductModel(
          title: "Cosrx Salicylic Acid Daily Gentle Cleanser- 150ml",
          image: [
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 970, cutPrice: 1000,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Laneige Lip Sleeping Mask Berry- 3g",
          image: [
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg"
          ],
          rating: 4.5,
          totalRating: 7, totalSold: 16,
          price: 320, cutPrice: 350,
          discount: 17, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Tiam Vita B3 Source Serum- 40ml",
          image: [
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg"
          ],
          rating: 4.0,
          totalRating: 14, totalSold: 26,
          price: 1220, cutPrice: 1500,
          discount: 30, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Missha Soft Finish Sun Milk- 70ml",
          image: [
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg"
          ],
          rating: 4.7,
          totalRating: 41, totalSold: 60,
          price: 1350, cutPrice: 1500,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Snail Truecica Miracle Repair Starter Kit",
          image: [
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg"
          ],
          rating: 4.9,
          totalRating: 4, totalSold: 6,
          price: 1330, cutPrice: 1500,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Yuja Niacin 30 Days Brightening Starter Kit",
          image: [
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg"
          ],
          rating: 4.6,
          totalRating: 34, totalSold: 46,
          price: 1250, cutPrice: 1300,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Centella Blemish Cream- 30g",
          image: [
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 1250, cutPrice: 1400,
          discount: 15, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Acne Pimple Master Patch- 24 Patch",
          image: [
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 330, cutPrice: 400,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Salicylic Acid Daily Gentle Cleanser- 150ml",
          image: [
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 970, cutPrice: 1000,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Laneige Lip Sleeping Mask Berry- 3g",
          image: [
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg"
          ],
          rating: 4.5,
          totalRating: 7, totalSold: 16,
          price: 320, cutPrice: 350,
          discount: 17, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Tiam Vita B3 Source Serum- 40ml",
          image: [
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg"
          ],
          rating: 4.0,
          totalRating: 14, totalSold: 26,
          price: 1220, cutPrice: 1500,
          discount: 30, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Missha Soft Finish Sun Milk- 70ml",
          image: [
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg"
          ],
          rating: 4.7,
          totalRating: 41, totalSold: 60,
          price: 1350, cutPrice: 1500,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Snail Truecica Miracle Repair Starter Kit",
          image: [
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg"
          ],
          rating: 4.9,
          totalRating: 4, totalSold: 6,
          price: 1330, cutPrice: 1500,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Yuja Niacin 30 Days Brightening Starter Kit",
          image: [
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg"
          ],
          rating: 4.6,
          totalRating: 34, totalSold: 46,
          price: 1250, cutPrice: 1300,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Centella Blemish Cream- 30g",
          image: [
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 1250, cutPrice: 1400,
          discount: 15, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Acne Pimple Master Patch- 24 Patch",
          image: [
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 330, cutPrice: 400,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Salicylic Acid Daily Gentle Cleanser- 150ml",
          image: [
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 970, cutPrice: 1000,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Laneige Lip Sleeping Mask Berry- 3g",
          image: [
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg"
          ],
          rating: 4.5,
          totalRating: 7, totalSold: 16,
          price: 320, cutPrice: 350,
          discount: 17, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Tiam Vita B3 Source Serum- 40ml",
          image: [
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg"
          ],
          rating: 4.0,
          totalRating: 14, totalSold: 26,
          price: 1220, cutPrice: 1500,
          discount: 30, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Missha Soft Finish Sun Milk- 70ml",
          image: [
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg"
          ],
          rating: 4.7,
          totalRating: 41, totalSold: 60,
          price: 1350, cutPrice: 1500,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Snail Truecica Miracle Repair Starter Kit",
          image: [
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg"
          ],
          rating: 4.9,
          totalRating: 4, totalSold: 6,
          price: 1330, cutPrice: 1500,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Yuja Niacin 30 Days Brightening Starter Kit",
          image: [
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg"
          ],
          rating: 4.6,
          totalRating: 34, totalSold: 46,
          price: 1250, cutPrice: 1300,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Centella Blemish Cream- 30g",
          image: [
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 1250, cutPrice: 1400,
          discount: 15, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Acne Pimple Master Patch- 24 Patch",
          image: [
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 330, cutPrice: 400,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Salicylic Acid Daily Gentle Cleanser- 150ml",
          image: [
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 970, cutPrice: 1000,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Laneige Lip Sleeping Mask Berry- 3g",
          image: [
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg"
          ],
          rating: 4.5,
          totalRating: 7, totalSold: 16,
          price: 320, cutPrice: 350,
          discount: 17, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Tiam Vita B3 Source Serum- 40ml",
          image: [
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg"
          ],
          rating: 4.0,
          totalRating: 14, totalSold: 26,
          price: 1220, cutPrice: 1500,
          discount: 30, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Missha Soft Finish Sun Milk- 70ml",
          image: [
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg"
          ],
          rating: 4.7,
          totalRating: 41, totalSold: 60,
          price: 1350, cutPrice: 1500,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Snail Truecica Miracle Repair Starter Kit",
          image: [
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg",
            "asset/images/topProduct/tp_5.jpeg",
            "asset/images/topProduct/tp_1.jpeg"
          ],
          rating: 4.9,
          totalRating: 4, totalSold: 6,
          price: 1330, cutPrice: 1500,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Some By Mi Yuja Niacin 30 Days Brightening Starter Kit",
          image: [
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg",
            "asset/images/topProduct/tp_6.jpeg",
            "asset/images/topProduct/tp_2.jpeg"
          ],
          rating: 4.6,
          totalRating: 34, totalSold: 46,
          price: 1250, cutPrice: 1300,
          discount: 5, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Centella Blemish Cream- 30g",
          image: [
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg",
            "asset/images/topProduct/tp_7.jpeg",
            "asset/images/topProduct/tp_3.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 1250, cutPrice: 1400,
          discount: 15, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
      ProductModel(
          title: "Cosrx Acne Pimple Master Patch- 24 Patch",
          image: [
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg",
            "asset/images/topProduct/tp_8.jpeg",
            "asset/images/topProduct/tp_4.jpeg"
          ],
          rating: 5.0,
          totalRating: 4, totalSold: 6,
          price: 330, cutPrice: 400,
          discount: 20, isFree: true,
          shoppingFrom: "Mainland Korea", shoppingFee: "90"),
    ];

    productList = list;
    isProductDataLoading(false);

  }
}