// To parse this JSON data, do
//
//     final brandModel = brandModelFromJson(jsonString);

import 'dart:convert';

BrandModel brandModelFromJson(String str) => BrandModel.fromJson(json.decode(str));

String brandModelToJson(BrandModel data) => json.encode(data.toJson());

class BrandModel {
  BrandModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  int count;
  dynamic next;
  dynamic previous;
  List<BrandResult> results;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    count: json["count"],
    next: json["next"],
    previous: json["previous"],
    results: List<BrandResult>.from(json["results"].map((x) => BrandResult.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "next": next,
    "previous": previous,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class BrandResult {
  BrandResult({
    required this.id,
    required this.name,
    required this.brandWebsite,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String brandWebsite;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  factory BrandResult.fromJson(Map<String, dynamic> json) => BrandResult(
    id: json["id"],
    name: json["name"],
    brandWebsite: json["brand_website"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "brand_website": brandWebsite,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
