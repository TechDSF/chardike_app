import 'package:flutter/material.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../size_config.dart';

class FlashDealSectionTitle extends StatelessWidget {
  FlashDealSectionTitle({Key? key,required this.onTap}) : super(key: key);
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
                    fontSize: getProportionateScreenWidth(15),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SlideCountdownSeparated(
                height: getProportionateScreenHeight(20),
                width: getProportionateScreenHeight(20),
                textStyle: TextStyle(
                    fontSize: getProportionateScreenHeight(10),
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(3))),
                duration: Duration(hours: 2, minutes: 29),
              )
            ],
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
