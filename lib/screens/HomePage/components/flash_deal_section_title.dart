import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../size_config.dart';

class FlashDealSectionTitle extends StatelessWidget {
  FlashDealSectionTitle({Key? key, required this.onTap}) : super(key: key);
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Row(
            children: [
              Text(
                "Flash Sale",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.03,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Text(
                "Ending in",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.025,
                    color: Colors.black),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SlideCountdownSeparated(
                height: getProportionateScreenHeight(15),
                width: getProportionateScreenHeight(15),
                separatorStyle: TextStyle(color: Colors.deepOrange),
                textStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(8),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(3))),
                duration: Duration(hours: 2, minutes: 29),
              )
            ],
          ),
        ),
        InkWell(
            onTap: onTap,
            child: Text(
              "See More",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: SizeConfig.screenWidth * 0.02),
            ))
      ],
    );
  }
}
