// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SliderModel> sliderModelFromMap(String str) =>
    List<SliderModel>.from(json.decode(str).map((x) => SliderModel.fromMap(x)));

String sliderModelToMap(List<SliderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class SliderModel {
  SliderModel({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
    required this.slidername,
    required this.sliderImage,
    required this.urlLink,
    required this.position,
    required this.homeShown,
    required this.category,
  });

  int id;
  DateTime createdAt;
  DateTime updatedAt;
  bool isActive;
  String slidername;
  String sliderImage;
  String urlLink;
  int position;
  bool homeShown;
  int category;

  factory SliderModel.fromMap(Map<String, dynamic> json) => SliderModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        isActive: json["is_active"] ?? false,
        slidername: json["slidername"] ?? "",
        sliderImage: json["slider_image"],
        urlLink: json["url_link"] ?? "",
        position: json["position"] ?? 0,
        homeShown: json["home_shown"] ?? false,
        category: json["category"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "is_active": isActive,
        "slidername": slidername,
        "slider_image": sliderImage,
        "url_link": urlLink,
        "position": position,
        "home_shown": homeShown,
        "category": category,
      };
}
