// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<FeedModel> feedModelFromJson(String str) =>
    List<FeedModel>.from(json.decode(str).map((x) => FeedModel.fromJson(x)));

String feedModelToJson(List<FeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedModel {
  FeedModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.urlField,
  });

  int id;
  String title;
  String description;
  dynamic image;
  String urlField;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        image: json["image"],
        urlField: json["url_field"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "url_field": urlField,
      };
}
