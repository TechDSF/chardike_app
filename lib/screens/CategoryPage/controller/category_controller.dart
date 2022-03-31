import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var isLoading = false.obs;
  var selectedTab = 0.obs;
  List<CategoryModel> skinCareList = List<CategoryModel>.empty(growable: true).obs;
  List<CategoryModel> bodyCareList = List<CategoryModel>.empty(growable: true).obs;
  List<CategoryModel> hairCareList = List<CategoryModel>.empty(growable: true).obs;
  List<CategoryModel> makeupCareList = List<CategoryModel>.empty(growable: true).obs;
  List<CategoryModel> subCategoryList = List<CategoryModel>.empty(growable: true).obs;


  var selectRating = 10.obs;
  var selectDiscount = 10.obs;
  var selectBrand = 100.obs;
  var isShowAllBrand = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getAllListData();
    getSubCategoryList(type: 0);
    super.onInit();
  }

  getAllListData(){
    var skinList = [
      CategoryModel(icon: "asset/images/category/subCategory/acne_patch.jpeg", title: "Acne Patch"),
      CategoryModel(icon: "asset/images/category/subCategory/cleansing_oil.jpeg", title: "Cleansing Oil"),
      CategoryModel(icon: "asset/images/category/subCategory/cleansing_tissue.jpeg", title: "Cleansing Tissue"),
      CategoryModel(icon: "asset/images/category/subCategory/cleansing_foam.jpeg", title: "Cleansing Foam"),
      CategoryModel(icon: "asset/images/category/subCategory/cleansing_bar.jpeg", title: "Cleansing Bar"),
      CategoryModel(icon: "asset/images/category/subCategory/toner.jpeg", title: "Toner"),
      CategoryModel(icon: "asset/images/category/subCategory/essence.png", title: "Essence"),
      CategoryModel(icon: "asset/images/category/subCategory/serum.jpg", title: "Serum"),
      CategoryModel(icon: "asset/images/category/subCategory/ampoule.jpeg", title: "Ampoule"),
      CategoryModel(icon: "asset/images/category/subCategory/eye_cream.jpeg", title: "Eye Cream"),
      CategoryModel(icon: "asset/images/category/subCategory/sooting_gel.webp", title: "Soothing Gel"),
      CategoryModel(icon: "asset/images/category/subCategory/moisturizer.jpeg", title: "Moisturizer"),
      CategoryModel(icon: "asset/images/category/subCategory/cream.jpeg", title: "Cream"),
      CategoryModel(icon: "asset/images/category/subCategory/sunscreen.jpeg", title: "Sunscreen"),
      CategoryModel(icon: "asset/images/category/subCategory/lip_mask.jpeg", title: "Sleeping Mask"),
      CategoryModel(icon: "asset/images/category/subCategory/lip_mask.jpeg", title: "Lip Sleeping Mask"),
      CategoryModel(icon: "asset/images/category/subCategory/exfoliator.jpeg", title: "Exfoliator"),
      CategoryModel(icon: "asset/images/category/subCategory/wash_of_musk.png", title: "Wash of Mask"),
      CategoryModel(icon: "asset/images/category/subCategory/clay_mask.jpeg", title: "Clay Mask"),
      CategoryModel(icon: "asset/images/category/subCategory/sheet_mask.jpeg", title: "Sheet Mask"),
      CategoryModel(icon: "asset/images/category/subCategory/skincare_set.png", title: "Skincare Set"),
    ];
    skinCareList = skinList;

    var boyList = [
      CategoryModel(icon: "asset/images/category/subCategory/body_wash.jpeg", title: "Body Wash"),
      CategoryModel(icon: "asset/images/category/subCategory/foot_care.jpeg", title: "Foot Care"),
      CategoryModel(icon: "asset/images/category/subCategory/hand_cream.jpeg", title: "Hand Cream"),
    ];
    bodyCareList = boyList;

    var hairList = [
      CategoryModel(icon: "asset/images/category/subCategory/shampoo.jpeg", title: "Shampoo"),
      CategoryModel(icon: "asset/images/category/subCategory/hair_treatement.jpeg", title: "Hair Treatment"),
      CategoryModel(icon: "asset/images/category/subCategory/hair_serum.jpeg", title: "Hair Serum"),
    ];
    hairCareList = hairList;

    var makeupList = [
      CategoryModel(icon: "asset/images/category/subCategory/bb_cream.jpeg", title: "BB Cream"),
      CategoryModel(icon: "asset/images/category/subCategory/foundation.jpeg", title: "Foundation"),
      CategoryModel(icon: "asset/images/category/subCategory/loose_powder.jpeg", title: "Loose Powder"),
      CategoryModel(icon: "asset/images/category/subCategory/lip_tint.jpeg", title: "Lip Tint"),
      CategoryModel(icon: "asset/images/category/subCategory/eye_look.jpeg", title: "Eye Look"),
      CategoryModel(icon: "asset/images/category/subCategory/blush.jpeg", title: "Blush"),
    ];
    makeupCareList = makeupList;

  }

  getSubCategoryList({required int type}){
    if(type == 0){
      subCategoryList = skinCareList;
    }else if(type == 1){
      subCategoryList = bodyCareList;
    }else if(type == 2){
      subCategoryList = hairCareList;
    }else{
      subCategoryList = makeupCareList;
    }
  }

}

class CategoryModel{
  String icon;
  String title;

  CategoryModel({required this.icon , required this.title});
}