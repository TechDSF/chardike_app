import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/CategoryPage/model/brand_model.dart';
import 'package:chardike/screens/CategoryPage/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  var isLoading = false.obs;
  var searchTextController = TextEditingController().obs;
  Rx<List<String>> suggestionList = Rx<List<String>>([]);
  List<Result> categoryList = List<Result>.empty(growable: true).obs;
  List<BrandResult> brandList = List<BrandResult>.empty(growable: true).obs;
  var showType = false.obs;
  var isTextEmpty = true.obs;

  var isCategoryLoading = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    getCategoryList();
    getBrandList();
    super.onInit();
  }

  getCategoryList()async{
    isCategoryLoading(true);
    var data = await ApiService.fetchCategories();
    if(data.runtimeType == int){
      isCategoryLoading(false);
      Fluttertoast.showToast(msg: "Category fetch Error");
    }else{
      CategoryModel2 myData = data;
      myData.results.forEach((element) {
        categoryList.add(element);
      });
      isCategoryLoading(false);
    }
  }

  getBrandList()async{
    isCategoryLoading(true);
    var data = await ApiService.fetchBrands();
    if(data.runtimeType == int){
      isCategoryLoading(false);
      Fluttertoast.showToast(msg: "Brand fetch Error");
    }else{
      BrandModel myData = data;
      myData.results.forEach((element) {
        brandList.add(element);
      });
      isCategoryLoading(false);
    }
  }

  List<String> searchCategoryList = [
    "Acne Patch",
    "All Products",
    "Ampoule",
    "BB Cream",
    "Blush",
    "Body Care",
    "Body Lotion",
    "Body Lotion",
    "Body Wash",
    "Clay Mask",
    "Cleansing Bar",
    "Cleansing Foam",
    "Cleansing Oil",
    "Cleansing Tissue",
    "Cream",
    "Essence",
    "Exfoliator",
    "Eye Cream",
    "Eye Look",
    "Foot Care",
    "Foot Peeling Pack",
    "Foundation",
    "Hair Care",
    "Hair Serum",
    "Hair Treatment",
    "Hand Cream",
    "Kit",
    "Lip Balm",
    "Lip Scrub",
    "Lip Sleeping Mask",
    "Lip Tint",
    "Loose Powder",
    "Make Up",
    "Moisturizer",
    "Peeling Gel",
    "Serum",
    "Shampoo",
    "Sheet Mask",
    "Skin Care",
    "Skincare Set",
    "Sleeping Mask",
    "Soothing Gel",
    "Suncreen",
    "Toner",
    "Wash of Mask"];


  List<String> searchBrandList = [
    "THE FACE SHOP",
    "Beaute",
    "SKINFOOD",
    "Nella",
    "RIRE",
    "purito",
    "HTS"
  ];


  getSearchSuggestionList(String suggestion){
    var list = [
      "Acne Patch",
      "All Products",
      "Ampoule",
      "BB Cream",
      "Blush",
      "Body Care",
      "Body Lotion",
      "Body Lotion",
      "Body Wash",
      "Clay Mask",
      "Cleansing Bar",
      "Cleansing Foam",
      "Cleansing Oil",
      "Cleansing Tissue",
      "Cream",
      "Essence",
      "Exfoliator",
      "Eye Cream",
      "Eye Look",
      "Foot Care",
      "Foot Peeling Pack",
      "Foundation",
      "Hair Care",
      "Hair Serum",
      "Hair Treatment",
      "Hand Cream",
      "Kit",
      "Lip Balm",
      "Lip Scrub",
      "Lip Sleeping Mask",
      "Lip Tint",
      "Loose Powder",
      "Make Up",
      "Moisturizer",
      "Peeling Gel",
      "Serum",
      "Shampoo",
      "Sheet Mask",
      "Skin Care",
      "Skincare Set",
      "Sleeping Mask",
      "Soothing Gel",
      "Suncreen",
      "Toner",
      "Wash of Mask",
    ];

    List<String> results = [];
    if(suggestion.isEmpty){
      results = list;
    }else{
      results = list.where((element) => element.toLowerCase().contains(suggestion.toLowerCase())).toList();    }
    suggestionList.value = results;
  }

}