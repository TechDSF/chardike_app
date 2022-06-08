import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/FeedPage/screens/time_line_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../CommonData/common_data.dart';
import '../../CartPage/screen/cart_screen.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;
    return Scaffold(
        appBar: AppBar(
          leading: Center(
              child: Icon(
            Icons.search,
            color: AllColors.mainColor,
          )),
          title: const Text("Feed"),
          centerTitle: false,
          actions: <Widget>[
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: CommonData.icon(
                    icon: "asset/icons/cart.png", color: AllColors.mainColor, isTab: isTab)),
            SizedBox(
              width: getProportionateScreenWidth(15),
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: CommonData.icon(
                    icon: "asset/icons/messenger.png",
                    color: AllColors.mainColor,isTab: isTab)),
            SizedBox(
              width: getProportionateScreenWidth(10),
            )
          ],
        ),
        body: DefaultTabController(
            length: 5,
            child: Column(children: <Widget>[
              Container(
                height: getProportionateScreenHeight(2),
                color: Colors.grey.withOpacity(0.05),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    TabBar(
                      indicatorColor: AllColors.mainColor,
                      isScrollable: true,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.normal
                      ),
                      indicatorWeight: getProportionateScreenWidth(2),
                      labelColor: AllColors.mainColor,
                      unselectedLabelColor: Colors.grey,
                      tabs: const [
                        Tab(
                          text: "Timeline",
                        ),
                        Tab(
                          text: "Explore",
                        ),
                        Tab(
                          text: "Vouchers",
                        ),
                        Tab(
                          text: "Freebies",
                        ),
                        Tab(
                          text: "4.4 Deals",
                        )
                      ],
                    ),
                    Container(
                      height: getProportionateScreenHeight(10),
                      color: Colors.grey.withOpacity(0.05),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          TimeLineScreen(),
                          Icon(Icons.directions_transit),
                          Icon(Icons.directions_bike),
                          Icon(Icons.directions_bike),
                          Icon(Icons.directions_bike),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
