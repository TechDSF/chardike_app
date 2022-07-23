import 'package:chardike/screens/HomePage/components/top_link_card.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../size_config.dart';

class TopOffer extends StatelessWidget {
  TopOffer({Key? key}) : super(key: key);
  final HomeController _newHomeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.screenWidth * 0.25,
      child: ListView.builder(
          itemCount: _newHomeController.topLinkList.length,
          scrollDirection: Axis.horizontal,
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
    );
  }
}
