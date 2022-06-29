import 'package:flutter/material.dart';

import '../../../size_config.dart';

class BannerSection extends StatelessWidget {
  BannerSection({Key? key, required this.image, required this.onTap})
      : super(key: key);
  String image;
  VoidCallback onTap;
  bool isTab = SizeConfig.screenWidth > 768;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTab
          ? getProportionateScreenHeight(200)
          : getProportionateScreenHeight(100),
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
    );
  }
}
