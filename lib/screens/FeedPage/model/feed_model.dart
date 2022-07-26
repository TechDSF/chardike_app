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
    required this.createdAt,
    required this.updatedAt,
    required this.userProfileImage,
    required this.userFullName,
  });

  int id;
  String title;
  String description;
  String image;
  String urlField;
  DateTime createdAt;
  DateTime updatedAt;
  String userProfileImage;
  String userFullName;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        image: json["image"] ?? "",
        urlField: json["url_field"] ?? "",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userProfileImage: json["user_profile_image"] ?? "",
        userFullName: json["user_full_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "url_field": urlField,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_profile_image": userProfileImage,
        "user_full_name": userFullName,
      };
}
