import 'dart:convert';

import 'package:chardike/Service/ApiService/api_components.dart';
import 'package:chardike/screens/HomePage/model/slider_mode.dart';
import 'package:chardike/screens/SearchPage/model/search_product_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../../screens/CategoryPage/model/brand_model.dart';
import '../../screens/CategoryPage/model/category_model.dart';
import '../../screens/CategoryPage/model/sub_category_model.dart';
import '../../screens/HomePage/model/product_model.dart';
import '../../screens/SearchPage/model/country_model.dart';

class ApiService {
  static var client = http.Client();

  ///fetch main categories
  static dynamic fetchCategories() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(categoriesUrl), headers: headers);
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///fetch main categories
  static dynamic fetchSubCategories() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response =
        await client.get(Uri.parse(subCategoriesUrl), headers: headers);
    if (response.statusCode == 200) {
      return subCategoryModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///fetch all brands
  static dynamic fetchBrands() async {
    var response = await client.get(Uri.parse(brandUrl));
    if (response.statusCode == 200) {
      print("work");
      return brandModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///fetch all products
  static dynamic fetchProducts() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(productUrl), headers: headers);
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///get query product
  static dynamic fetchQueryProducts() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response =
        await client.get(Uri.parse(queryProductUrl), headers: headers);
    if (response.statusCode == 200) {
      return queryProductModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///get country list
  static dynamic fetchCountry() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(countryUrl), headers: headers);
    if (response.statusCode == 200) {
      return countryModelFromJson(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///create user
  static Future<bool> createUser(
      {required String email,
      required String password,
      required String fullName,
      required String phone}) async {
    var body = jsonEncode({
      "email": email,
      "password": password,
      "confirm_password": password,
      "full_name": fullName,
      "phone": phone
    });

    var response = await client.post(Uri.parse(userCreateUrl), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///user login
  static Future<bool> userLogin(
      {required String userName, required String password}) async {
    var body = jsonEncode({'username': userName, 'password': password});

    var response = await client.post(Uri.parse(userLoginUrl), body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  ///get slider item list
  static dynamic fetchSliderData() async {
    var headers = {
      'Cookie':
          'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(sliderUrl), headers: headers);
    if (response.statusCode == 200) {
      return sliderModelFromMap(response.body);
    } else {
      return response.statusCode;
    }
  }

  ///forgot password
  static dynamic forotPasswordMethod({required String number}) async {
    var url = Uri.parse(
        'https://shark-app-gc4oe.ondigitalocean.app/user/forget/password/phone/');

    var body = {'phone': number};
    var req = http.MultipartRequest('GET', url);

    req.fields.addAll(body);

    var res = await req.send();
    final resBody = await res.stream.bytesToString();

    if (res.statusCode == 200) {
      var jsonData = json.decode(resBody);
      print(jsonData['profile_ID']);
      return jsonData['profile_ID'];
    } else if (res.statusCode == 204) {
      Fluttertoast.showToast(msg: "No account is available with this number!");
      return 0;
    } else {
      print(res.reasonPhrase);
      Fluttertoast.showToast(msg: "${res.reasonPhrase}!");
      return 0;
    }
  }

  static Future<bool> checkForgotPasswordotp(
      {required String otp, required String profileId}) async {
    var body = jsonEncode({'otp': otp, 'profile_ID': profileId});
    var response = await client.post(
        Uri.parse(
            "https://shark-app-gc4oe.ondigitalocean.app/user/forget/password/phone/"),
        body: body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> updatePassword(
      {required String password, required String profileId}) async {
    print("Here is profile id = " + profileId);

    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://shark-app-gc4oe.ondigitalocean.app/user/forget/password/phone/'));
    request.body = json.encode({
      "password1": password,
      "password2": password,
      "profile_ID": profileId
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode >= 200 && response.statusCode <= 300) {
      Fluttertoast.showToast(msg: "Password Updated!");
      return true;
    } else {
      return false;
    }
  }
}
