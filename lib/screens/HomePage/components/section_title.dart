import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({Key? key, required this.title, required this.onTap})
      : super(key: key);
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
                fontSize: SizeConfig.screenWidth * 0.04,
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              "See More",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: SizeConfig.screenWidth * 0.03),
            ))
      ],
    );
  }
}
