import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class AuthWidget{

  static Widget customEmailTextField({required TextEditingController controller}){
    return TextFormField(
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: "Email",
        prefixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.9), width: 0.0),
        ),
      ),
      validator: (value){
        bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);
        if(value.isEmpty){
          return "Email can not be empty!";
        }else if(emailValid == false){
          return "Please enter valid email!";
        }
      },
      controller: controller,
    );
  }

}