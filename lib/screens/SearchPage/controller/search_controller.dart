import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
  var isLoading = false.obs;
  var searchTextController = TextEditingController().obs;
  Rx<List<String>> suggestionList = Rx<List<String>>([]);
  var showType = false.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  List<String> searchCategoryList = ["Acne Patch",
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