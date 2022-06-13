import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({Key? key,required this.title,required this.onTap}) : super(key: key);
  String title;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            title,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15),
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: RichText(
            text: TextSpan(
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: getProportionateScreenWidth(12)),
                children: [
                  TextSpan(text: "See More"),
                  WidgetSpan(
                      child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: getProportionateScreenWidth(14),
                            color: Colors.black.withOpacity(0.5),
                          )))
                ]),
          ),
        )
      ],
    );
  }
}
