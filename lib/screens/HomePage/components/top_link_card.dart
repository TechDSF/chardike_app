import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../../../size_config.dart';

class TopLinkCard extends StatelessWidget {
  TopLinkCard({Key? key, required this.title, required this.color, this.icon})
      : super(key: key);
  String title;
  Icon? icon;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.02),
      padding: EdgeInsets.all(SizeConfig.screenWidth * 0.005),
      height: SizeConfig.screenWidth / 2,
      width: SizeConfig.screenWidth / 4.4,
      child: Column(
        children: [
          icon == null
              ? Expanded(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(
                            Icons.fire_extinguisher,
                            color: Colors.red,
                            size: SizeConfig.screenWidth * 0.03,
                          ),
                          Text(
                            "Trending",
                            style: TextStyle(
                                fontSize: SizeConfig.screenWidth * 0.024,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(SizeConfig.screenWidth * 0.01),
                            child: Text(
                              title,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenWidth * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: icon,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding:
                                EdgeInsets.all(SizeConfig.screenWidth * 0.01),
                            child: Text(
                              title,
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: SizeConfig.screenWidth * 0.03,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Container(
            decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth * 0.005)),
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.002),
            child: Text(
              "Explore",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.screenWidth * 0.018),
            ),
          ),
          SizedBox(
            height: SizeConfig.screenWidth * 0.02,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(SizeConfig.screenWidth * 0.01)),
    );
  }
}
