import 'package:flutter/material.dart';

import '../../../size_config.dart';

class EditPhone extends StatelessWidget {
  EditPhone({Key? key}) : super(key: key);
  static const String routeName = "/phone_edit_box";
  final TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: AppBar(
        title: Text("Phone"),
        actions: <Widget>[
          TextButton(onPressed: (){}, child: Text("SAVE"))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: getProportionateScreenHeight(20),),
          Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10),vertical: getProportionateScreenWidth(10)),
            child: TextField(
              keyboardType: TextInputType.number,
              controller: phoneTextEditingController,
              style: const TextStyle(
                  color: Colors.black
              ),
              decoration: const InputDecoration(
                  hintText: "Phone no",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none
              ),
            ),
          ),
        ],
      ),
    );
  }
}
