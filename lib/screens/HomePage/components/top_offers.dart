import 'package:chardike/screens/HomePage/components/top_link_card.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_indicator/scroll_indicator.dart';

import '../../../size_config.dart';

class TopOffer extends StatelessWidget {
  TopOffer({Key? key}) : super(key: key);
  final HomeController _newHomeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenWidth * 0.3,
          child: ListView.builder(
              itemCount: _newHomeController.topLinkList.length,
              scrollDirection: Axis.horizontal,
              controller: _newHomeController.scrollController,
              itemBuilder: (context, index) {
                var result = _newHomeController.topLinkList[index];
                return result.icon == null
                    ? TopLinkCard(title: result.title, color: result.color)
                    : TopLinkCard(
                        title: result.title,
                        color: result.color,
                        icon: result.icon,
                      );
              }),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.01,
        ),
        ScrollIndicator(
          scrollController: _newHomeController.scrollController,
          width: 50,
          height: 5,
          indicatorWidth: 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.grey[300]),
          indicatorDecoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}
