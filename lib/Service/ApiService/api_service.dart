import 'dart:convert';

import 'package:chardike/Service/ApiService/api_components.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/SearchPage/model/search_product_model.dart';
import 'package:http/http.dart' as http;

import '../../screens/CategoryPage/model/brand_model.dart';
import '../../screens/CategoryPage/model/category_model.dart';
import '../../screens/HomePage/model/product_model.dart';
import '../../screens/SearchPage/model/country_model.dart';

class ApiService{
  static var client = http.Client();

  static dynamic fetchCategories() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(categoriesUrl),headers: headers);
    if(response.statusCode == 200){
      return categoryModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }

  static dynamic fetchBrands() async{
    var response = await client.get(Uri.parse(brandUrl));
    if(response.statusCode == 200){
      print("work");
      return brandModelFromJson(response.body);

    }else{
      return response.statusCode;
    }


  }

  static dynamic fetchProducts() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(productUrl),headers: headers);
    if(response.statusCode == 200){
      return productModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }

  ///get query product
  static dynamic fetchQueryProducts() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(queryProductUrl),headers: headers);
    if(response.statusCode == 200){
      return queryProductModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }

  ///get country list
  static dynamic fetchCountry() async{
    var headers = {
      'Cookie': 'csrftoken=b5Agy7kbhlA1IR4YDJzOK3MUBty739mrPIbiepJxY6Na2bjbOPKG3GzodAWJLjIg'
    };
    var response = await client.get(Uri.parse(countryUrl),headers: headers);
    if(response.statusCode == 200){
      return countryModelFromJson(response.body);
    }else{
      return response.statusCode;
    }
  }

  static Future<bool> createUser({required String email, required String password, required String fullName, required String phone})async{
    var body = jsonEncode({
      "email":email,
      "password":password,
      "confirm_password":password,
      "full_name":fullName,
      "phone":phone
    });

    var response = await client.post(Uri.parse(userCreateUrl),body: body);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }

  static Future<bool> userLogin({required String userName, required String password})async{

    var body = jsonEncode({
      'username':userName,
      'password':password
    });

    var response = await client.post(Uri.parse(userLoginUrl),body: body);
    if(response.statusCode == 200){
      return true;
    }else{
      return false;
    }
  }


}