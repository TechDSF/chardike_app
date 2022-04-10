import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../size_config.dart';

class CommonData{

  static String currency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }

  static String takaSign = "৳";

  static Widget icon({required String icon,required Color color}){
    return  Image.asset(icon,height: getProportionateScreenWidth(25),width: getProportionateScreenWidth(25),color: color,);
  }

  static Widget bottomIcon({required String icon,required Color color}){
    return  Image.asset(icon,height: getProportionateScreenWidth(20),width: getProportionateScreenWidth(20),color: color,);
  }

  static TextStyle customTextStyle(){
    return TextStyle(
      fontSize: getProportionateScreenWidth(13),
      color: Colors.black
    );
  }

  static String findOutDifferenceDate(DateTime dateTime){
    return Jiffy(dateTime).fromNow();
  }
}