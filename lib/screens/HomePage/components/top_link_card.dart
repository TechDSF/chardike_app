import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/components/all_offers.dart';
import 'package:chardike/screens/HomePage/components/products_of_you_details.dart';
import 'package:chardike/screens/HomePage/components/top_product.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import '../../BrandPage/brand_page.dart';

class TopLinkCard extends StatelessWidget {
  TopLinkCard(
      {Key? key,
      required this.title,
      required this.color,
      this.icon,
      required this.index})
      : super(key: key);
  String title;
  String? icon;
  Color color;
  int index;
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (index == 4) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ProductsYouDetails(
                        type: false,
                      )));
        } else if (index == 1) {
          Navigator.push(context,
              MaterialPageRoute(builder: (_) => AllOfferProducts(type: "60")));
        } else if (index == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AllOfferProducts(type: "AllOffer")));
        } else if (index == 3) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => BrandPage()));
        } else if (index == 2) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => TopProduct()));
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: SizeConfig.screenWidth * 0.02),
        padding: EdgeInsets.all(SizeConfig.screenWidth * 0.005),
        height: SizeConfig.screenWidth / 2,
        width: SizeConfig.screenWidth / 3.25,
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
                                  fontWeight: FontWeight.bold),
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
                                    fontSize: SizeConfig.screenWidth * 0.04,
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
                          flex: 4,
                          child: Center(
                              child: Container(
                            height: SizeConfig.screenWidth * 0.13,
                            width: SizeConfig.screenWidth * 0.13,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(icon!),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle),
                          )),
                        ),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.all(SizeConfig.screenWidth * 0.01),
                              child: Text(
                                title,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: SizeConfig.screenWidth * 0.04,
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
                  color: AllColors.mainColor,
                  borderRadius:
                      BorderRadius.circular(SizeConfig.screenWidth * 0.005)),
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.screenWidth * 0.008,
                  vertical: SizeConfig.screenWidth * 0.004),
              child: Text(
                "Explore",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfig.screenWidth * 0.027),
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
      ),
    );
  }
}
