import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../screens/HomePage/model/product_model.dart';
import '../size_config.dart';

class CommonData {
  static String fullName = "FullName";
  static String userObjId = "UserObjId";
  static String userProfileId = "UserProfileId";
  static String userName = "UserName";
  static String email = "Email";
  static String phone = "Phone";
  static String token = "token";
  static String password = "password";

  static String currency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }

  static String takaSign = "৳";

  static Widget icon(
      {required String icon, required Color color, required bool isTab}) {
    return Image.asset(
      icon,
      height: isTab
          ? getProportionateScreenWidth(32)
          : getProportionateScreenWidth(25),
      width: isTab
          ? getProportionateScreenWidth(32)
          : getProportionateScreenWidth(25),
      color: color,
    );
  }

  static Widget bottomIcon(
      {required String icon, required Color color, required bool isTab}) {
    return Image.asset(
      icon,
      height: isTab
          ? getProportionateScreenWidth(28)
          : getProportionateScreenWidth(20),
      width: isTab
          ? getProportionateScreenWidth(28)
          : getProportionateScreenWidth(20),
      color: color,
    );
  }

  static TextStyle customTextStyle() {
    return TextStyle(
        fontSize: getProportionateScreenWidth(13), color: Colors.black);
  }

  static String findOutDifferenceDate(DateTime dateTime) {
    return Jiffy(dateTime).fromNow();
  }

  static double calculateRating(List<Review> list) {
    double rating = 0;
    if (list.isEmpty) {
      return 0;
    } else {
      list.forEach((element) {
        rating = rating + element.starCount.toDouble();
      });
      return rating / list.length;
    }
  }

  static int calculateDiscount(
      {required double regularPrice, required double sellingPrice}) {
    return (((regularPrice - sellingPrice) * 100) / regularPrice).toInt();
  }

  static double aspactRatio(
      {required double height,
      required BuildContext context,
      required int crossAxisCount,
      required double crossAxisSpacing}) {
    var _screenWidth = MediaQuery.of(context).size.width;
    var _width = (_screenWidth - ((crossAxisCount - 1) * crossAxisSpacing)) /
        crossAxisCount;
    var cellHeight = height;
    var aspectRatio = _width / cellHeight;
    return aspectRatio;
  }
}
