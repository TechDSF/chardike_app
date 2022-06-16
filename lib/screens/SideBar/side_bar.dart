import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          ListTile(
            leading: Icon(Icons.category),
            title: Text("Category"),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text("Last Seen"),
          ),
        ]),
      ),
    );
  }
}
