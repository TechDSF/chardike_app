import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

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
}