import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/FeedPage/model/feed_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';

import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';

class FeedDetails extends StatelessWidget {
  FeedDetails({Key? key, required this.feedModel}) : super(key: key);
  FeedModel feedModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Details"),
      ),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.02),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
            SizedBox(
              height: SizeConfig.screenHeight * 0.1,
              child: Row(
                children: <Widget>[
                  Container(
                    height: SizeConfig.screenHeight * 0.07,
                    width: SizeConfig.screenHeight * 0.07,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey)),
                    child: feedModel.userProfileImage == ""
                        ? Icon(
                            Icons.person,
                            color: AllColors.mainColor,
                            size: SizeConfig.screenHeight * 0.04,
                          )
                        : Container(
                            height: SizeConfig.screenHeight * 0.07,
                            width: SizeConfig.screenHeight * 0.07,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image:
                                      NetworkImage(feedModel.userProfileImage),
                                  fit: BoxFit.cover),
                            ),
                          ),
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.03,
                  ),
                  Text(
                    feedModel.userFullName,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Text(
              feedModel.title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: SizeConfig.screenWidth * 0.04),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            Text(
              CommonData.customizeDate(dateTime: feedModel.createdAt),
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: getProportionateScreenHeight(5),
            ),
            feedModel.image == ""
                ? Container(
                    height: SizeConfig.screenHeight * 0.4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("asset/images/blank_image.png"))),
                  )
                : Container(
                    height: SizeConfig.screenHeight * 0.5,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(feedModel.image),
                            fit: BoxFit.fill)),
                  ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Html(
              data: feedModel.description,
            ),
          ]),
        ),
      ),
    );
  }
}
