import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/section_title.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';

class LookAtGlance extends StatelessWidget {
  const LookAtGlance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.01),
      child: Column(
        children: <Widget>[
          Text(
            "Look at a Glance",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: SizeConfig.screenWidth * 0.04),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenWidth * 0.01),
            ),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth * 0.01),
                child: BannerSection(
                    image: "asset/images/new_arrivals.jpg", onTap: () {})),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenWidth * 0.01),
            ),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth * 0.01),
                child: BannerSection(
                    image: "asset/images/dont_miss_out.png", onTap: () {})),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
          Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(SizeConfig.screenWidth * 0.01),
            ),
            child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(SizeConfig.screenWidth * 0.01),
                child: BannerSection(
                    image: "asset/images/hot_sale.webp", onTap: () {})),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.01,
          ),
        ],
      ),
    );
  }
}
