import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

CategoryProductModel categoryProductModelFromJson(String str) =>
    CategoryProductModel.fromJson(json.decode(str));

class CategoryProductModel {
  CategoryProductModel({
    required this.id,
    required this.categoryName,
    required this.categoryProducts,
  });

  int id;
  String categoryName;
  List<ProductModel> categoryProducts;

  factory CategoryProductModel.fromJson(Map<String, dynamic> json) =>
      CategoryProductModel(
        id: json["id"],
        categoryName: json["category_name"] ?? "",
        categoryProducts: List<ProductModel>.from(
            json["Category_products"].map((x) => ProductModel.fromJson(x))),
      );
}
