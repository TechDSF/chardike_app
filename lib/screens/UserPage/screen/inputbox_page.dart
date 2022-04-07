import 'package:flutter/material.dart';

class InputBoxPage extends StatelessWidget {
  const InputBoxPage({Key? key}) : super(key: key);
  static const String routeName = "/input_box_page";

  @override
  Widget build(BuildContext context) {

    final type = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit $type"),
      ),
      body: Column(
        children: const <Widget>[
          TextField(
            decoration: InputDecoration(
              hintText: "Name here",
            ),
          )
        ],
      ),
    );
  }
}
