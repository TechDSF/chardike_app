import 'package:chardike/CommonData/common_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:slide_countdown/slide_countdown.dart';

import '../../../size_config.dart';
import '../controller/home_controller.dart';

class FlashDealSectionTitle extends StatelessWidget {
  FlashDealSectionTitle({Key? key, required this.onTap}) : super(key: key);
  VoidCallback onTap;
  final HomeController _homeController = Get.put(HomeController());

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
                    fontSize: SizeConfig.screenWidth * 0.04,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              Text(
                "Ending in",
                style: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.03,
                    color: Colors.black),
              ),
              SizedBox(
                width: getProportionateScreenWidth(5),
              ),
              SlideCountdownSeparated(
                height: SizeConfig.screenWidth * 0.03,
                width: SizeConfig.screenWidth * 0.03,
                separatorStyle: TextStyle(color: Colors.deepOrange),
                textStyle: TextStyle(
                    fontSize: SizeConfig.screenWidth * 0.018,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius:
                        BorderRadius.circular(getProportionateScreenWidth(3))),
                duration: CommonData.calculateEndTime(
                    endTime: _homeController.allFlashList[0].endTime),
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
                  fontSize: SizeConfig.screenWidth * 0.03),
            ))
      ],
    );
  }
}
