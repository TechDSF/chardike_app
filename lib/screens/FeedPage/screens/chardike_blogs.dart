import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';
import '../components/feed_details.dart';

class ChardikeBlogScreen extends StatelessWidget {
  ChardikeBlogScreen({Key? key}) : super(key: key);
  final FeedController _feedController = Get.put(FeedController());
  final CommonController _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    _feedController.getAdminFeed();
    return RefreshIndicator(
      onRefresh: _feedController.getAdminFeed,
      color: AllColors.mainColor,
      child: Obx(() {
        if (_feedController.isAdminBlogLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: AllColors.mainColor,
            ),
          );
        } else {
          return ListView.builder(
              itemCount: _feedController.adminBlogList.value.length,
              itemBuilder: (context, index) {
                var result = _feedController.adminBlogList.value[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => FeedDetails(feedModel: result)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: SizeConfig.screenHeight * 0.54,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.1,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.screenWidth * 0.03),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: SizeConfig.screenHeight * 0.07,
                                        width: SizeConfig.screenHeight * 0.07,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border:
                                                Border.all(color: Colors.grey)),
                                        child: result.userProfileImage == ""
                                            ? Icon(
                                                Icons.person,
                                                color: AllColors.mainColor,
                                                size: SizeConfig.screenHeight *
                                                    0.04,
                                              )
                                            : Container(
                                                height:
                                                    SizeConfig.screenHeight *
                                                        0.07,
                                                width: SizeConfig.screenHeight *
                                                    0.07,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(result
                                                          .userProfileImage),
                                                      fit: BoxFit.cover),
                                                ),
                                              ),
                                      ),
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.03,
                                      ),
                                      Text(
                                        "Chardike",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(10)),
                                child: Text(
                                  result.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: SizeConfig.screenHeight * 0.01,
                              ),
                              result.image == ""
                                  ? Container(
                                      height: SizeConfig.screenHeight * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "asset/images/blank_image.png"),
                                              fit: BoxFit.cover)),
                                    )
                                  : Container(
                                      height: SizeConfig.screenHeight * 0.3,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(result.image),
                                              fit: BoxFit.cover)),
                                    ),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Html(
                                      data: result.description,
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  )
                                ],
                              )),
                              Center(
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => FeedDetails(
                                                  feedModel: result)));
                                    },
                                    child: Text("See More")),
                              ),
                            ]),
                      ),
                    ),
                  ),
                );
              });
        }
      }),
    );
  }
}
