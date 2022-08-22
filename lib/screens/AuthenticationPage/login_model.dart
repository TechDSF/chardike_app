// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.username,
    required this.userObjId,
    required this.profileId,
    required this.fullName,
  });

  String username;
  int userObjId;
  int profileId;
  String fullName;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        username: json["username"],
        userObjId: json["user_obj_ID"],
        profileId: json["profile_ID"],
        fullName: json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "user_obj_ID": userObjId,
        "profile_ID": profileId,
        "fullName": fullName,
      };
}
