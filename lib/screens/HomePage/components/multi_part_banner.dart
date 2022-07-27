import 'package:flutter/material.dart';

import '../../../size_config.dart';

class MultiPartBannerSection extends StatelessWidget {
  MultiPartBannerSection(
      {Key? key,
      required this.bigImage,
      required this.smallImage1,
      required this.smallImage2,
      required this.onTap})
      : super(key: key);
  String bigImage, smallImage1, smallImage2;
  VoidCallback onTap;
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
      child: Column(
        children: <Widget>[
          ///banner section
          Row(
            children: [
              Expanded(
                child: Container(
                  height: isTab
                      ? getProportionateScreenHeight(230)
                      : getProportionateScreenHeight(170),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(10)),
                      image: DecorationImage(
                          image: AssetImage(bigImage), fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.005,
              ),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Container(
                    height: isTab
                        ? getProportionateScreenHeight(114)
                        : getProportionateScreenHeight(84),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(7)),
                        image: DecorationImage(
                            image: AssetImage(smallImage1), fit: BoxFit.fill)),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(2),
                  ),
                  Container(
                    height: isTab
                        ? getProportionateScreenHeight(114)
                        : getProportionateScreenHeight(84),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(7)),
                        image: DecorationImage(
                            image: AssetImage(smallImage2), fit: BoxFit.fill)),
                  ),
                ],
              ))
            ],
          ),
          SizedBox(
            height: getProportionateScreenHeight(10),
          ),
        ],
      ),
    );
  }
}
