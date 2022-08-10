// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

List<CountryModel> countryModelFromJson(String str) => List<CountryModel>.from(
    json.decode(str).map((x) => CountryModel.fromJson(x)));

class CountryModel {
  CountryModel({
    required this.id,
    required this.name,
    required this.country,
  });

  int id;
  String name;
  List<ProductModel> country;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
        id: json["id"],
        name: json["name"],
        country: List<ProductModel>.from(
            json["country"].map((x) => ProductModel.fromJson(x))),
      );
}
