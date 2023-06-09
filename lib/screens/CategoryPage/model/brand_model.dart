import 'dart:convert';

List<BrandModel> brandModelFromJson(String str) => List<BrandModel>.from(json.decode(str).map((x) => BrandModel.fromJson(x)));

String brandModelToJson(List<BrandModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandModel {
  BrandModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.name,
    required this.brandWebsite,
    required this.description,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String name;
  String brandWebsite;
  String description;

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    isActive: json["is_active"],
    name: json["name"],
    brandWebsite: json["brand_website"] ?? "",
    description: json["description"]??"",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "is_active": isActive,
    "name": name,
    "brand_website": brandWebsite??"",
    "description": description??"",
  };
}
