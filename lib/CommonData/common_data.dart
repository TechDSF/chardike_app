import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class CommonData{

  static String currency(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format = NumberFormat.simpleCurrency(locale: locale.toString());
    return format.currencySymbol;
  }
}