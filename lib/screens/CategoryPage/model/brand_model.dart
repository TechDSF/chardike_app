// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<BrandModel> brandModelFromJson(String str) =>
    List<BrandModel>.from(json.decode(str).map((x) => BrandModel.fromJson(x)));

String brandModelToJson(List<BrandModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
        name: json["name"],
        description: json["description"],
        brand: List<ProductModel>.from(
            json["brand"].map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "brand": List<dynamic>.from(brand.map((x) => x.toJson())),
      };
}
