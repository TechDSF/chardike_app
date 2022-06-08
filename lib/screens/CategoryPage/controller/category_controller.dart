import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  var isLoading = false.obs;
  var selectedTab = 0.obs;
  List<CategoryItemModel> skinCareList = List<CategoryItemModel>.empty(growable: true).obs;
  List<CategoryItemModel> bodyCareList = List<CategoryItemModel>.empty(growable: true).obs;
  List<CategoryItemModel> hairCareList = List<CategoryItemModel>.empty(growable: true).obs;
  List<CategoryItemModel> makeupCareList = List<CategoryItemModel>.empty(growable: true).obs;
  List<CategoryItemModel> subCategoryList = List<CategoryItemModel>.empty(growable: true).obs;


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
      CategoryItemModel(icon: "asset/images/category/subCategory/acne_patch.jpeg", title: "Acne Patch"),
      CategoryItemModel(icon: "asset/images/category/subCategory/cleansing_oil.jpeg", title: "Cleansing Oil"),
      CategoryItemModel(icon: "asset/images/category/subCategory/cleansing_tissue.jpeg", title: "Cleansing Tissue"),
      CategoryItemModel(icon: "asset/images/category/subCategory/cleansing_foam.jpeg", title: "Cleansing Foam"),
      CategoryItemModel(icon: "asset/images/category/subCategory/cleansing_bar.jpeg", title: "Cleansing Bar"),
      CategoryItemModel(icon: "asset/images/category/subCategory/toner.jpeg", title: "Toner"),
      CategoryItemModel(icon: "asset/images/category/subCategory/essence.png", title: "Essence"),
      CategoryItemModel(icon: "asset/images/category/subCategory/serum.jpg", title: "Serum"),
      CategoryItemModel(icon: "asset/images/category/subCategory/ampoule.jpeg", title: "Ampoule"),
      CategoryItemModel(icon: "asset/images/category/subCategory/eye_cream.jpeg", title: "Eye Cream"),
      CategoryItemModel(icon: "asset/images/category/subCategory/sooting_gel.webp", title: "Soothing Gel"),
      CategoryItemModel(icon: "asset/images/category/subCategory/moisturizer.jpeg", title: "Moisturizer"),
      CategoryItemModel(icon: "asset/images/category/subCategory/cream.jpeg", title: "Cream"),
      CategoryItemModel(icon: "asset/images/category/subCategory/sunscreen.jpeg", title: "Sunscreen"),
      CategoryItemModel(icon: "asset/images/category/subCategory/lip_mask.jpeg", title: "Sleeping Mask"),
      CategoryItemModel(icon: "asset/images/category/subCategory/lip_mask.jpeg", title: "Lip Sleeping Mask"),
      CategoryItemModel(icon: "asset/images/category/subCategory/exfoliator.jpeg", title: "Exfoliator"),
      CategoryItemModel(icon: "asset/images/category/subCategory/wash_of_musk.png", title: "Wash of Mask"),
      CategoryItemModel(icon: "asset/images/category/subCategory/clay_mask.jpeg", title: "Clay Mask"),
      CategoryItemModel(icon: "asset/images/category/subCategory/sheet_mask.jpeg", title: "Sheet Mask"),
      CategoryItemModel(icon: "asset/images/category/subCategory/skincare_set.png", title: "Skincare Set"),
    ];
    skinCareList = skinList;

    var boyList = [
      CategoryItemModel(icon: "asset/images/category/subCategory/body_wash.jpeg", title: "Body Wash"),
      CategoryItemModel(icon: "asset/images/category/subCategory/foot_care.jpeg", title: "Foot Care"),
      CategoryItemModel(icon: "asset/images/category/subCategory/hand_cream.jpeg", title: "Hand Cream"),
    ];
    bodyCareList = boyList;

    var hairList = [
      CategoryItemModel(icon: "asset/images/category/subCategory/shampoo.jpeg", title: "Shampoo"),
      CategoryItemModel(icon: "asset/images/category/subCategory/hair_treatement.jpeg", title: "Hair Treatment"),
      CategoryItemModel(icon: "asset/images/category/subCategory/hair_serum.jpeg", title: "Hair Serum"),
    ];
    hairCareList = hairList;

    var makeupList = [
      CategoryItemModel(icon: "asset/images/category/subCategory/bb_cream.jpeg", title: "BB Cream"),
      CategoryItemModel(icon: "asset/images/category/subCategory/foundation.jpeg", title: "Foundation"),
      CategoryItemModel(icon: "asset/images/category/subCategory/loose_powder.jpeg", title: "Loose Powder"),
      CategoryItemModel(icon: "asset/images/category/subCategory/lip_tint.jpeg", title: "Lip Tint"),
      CategoryItemModel(icon: "asset/images/category/subCategory/eye_look.jpeg", title: "Eye Look"),
      CategoryItemModel(icon: "asset/images/category/subCategory/blush.jpeg", title: "Blush"),
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

class CategoryItemModel{
  String icon;
  String title;

  CategoryItemModel({required this.icon , required this.title});
}