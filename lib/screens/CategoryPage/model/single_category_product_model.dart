// To parse this JSON data, do
//
//     final singleCategoryProductModel = singleCategoryProductModelFromJson(jsonString);

import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

SingleCategoryProductModel singleCategoryProductModelFromJson(String str) =>
    SingleCategoryProductModel.fromJson(json.decode(str));

class SingleCategoryProductModel {
  SingleCategoryProductModel({
    required this.id,
    required this.categoryName,
    required this.categoryProducts,
  });

  int id;
  String categoryName;
  List<ProductModel> categoryProducts;

  factory SingleCategoryProductModel.fromJson(Map<String, dynamic> json) =>
      SingleCategoryProductModel(
        id: json["id"],
        categoryName: json["category_name"] ?? "",
        categoryProducts: List<ProductModel>.from(
            json["Category_products"].map((x) => ProductModel.fromJson(x))),
      );
}
