import 'dart:convert';

List<FeedModel> feedModelFromJson(String str) =>
    List<FeedModel>.from(json.decode(str).map((x) => FeedModel.fromJson(x)));

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
}
