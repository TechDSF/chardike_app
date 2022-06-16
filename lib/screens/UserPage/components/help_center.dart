import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);
  static const String routeName = "help_center";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            color: AllColors.mainColor,
            child: Column(
              children: <Widget>[
                AppBar(
                  backgroundColor: AllColors.mainColor,
                  leading: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      )),
                  title: Text(
                    "Help Center",
                    style: TextStyle(color: Colors.white),
                  ),
                  centerTitle: false,
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.all(getProportionateScreenWidth(2)),
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.white, width: 2.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
          ListTile(
            leading: Icon(
              Icons.location_on_rounded,
              color: AllColors.mainColor,
            ),
            title: const Text(
                "Sahara Tropical Centre, Bata Signal, New Elephant Road Dhaka."),
          ),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: AllColors.mainColor,
            ),
            title: const Text("Email: support@chardike.com"),
          ),
          ListTile(
            leading: Icon(
              Icons.phone,
              color: AllColors.mainColor,
            ),
            title: const Text("Support: 01790-270066"),
          )
        ],
      ),
    );
  }
}
