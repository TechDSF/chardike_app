import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'dart:convert';

List<BrandModel> brandModelFromJson(String str) =>
    List<BrandModel>.from(json.decode(str).map((x) => BrandModel.fromJson(x)));

class BrandModel {
  BrandModel({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
  });

  int id;
  String name;
  String description;
  List<ProductModel> brand;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        id: json["id"],
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        brand: List<ProductModel>.from(
            json["brand"].map((x) => ProductModel.fromJson(x))),
      );
}
