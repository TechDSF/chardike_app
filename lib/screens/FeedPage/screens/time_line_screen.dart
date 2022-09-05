import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/FeedPage/components/create_post.dart';
import 'package:chardike/screens/FeedPage/components/feed_details.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';

class TimeLineScreen extends StatelessWidget {
  TimeLineScreen({Key? key}) : super(key: key);
  final FeedController _feedController = Get.put(FeedController());
  final CommonController _commonController = Get.put(CommonController());
  final UserDataController _dataController = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    _feedController.getTimeLineFeed();
    return RefreshIndicator(
      onRefresh: _feedController.getTimeLineFeed,
      color: AllColors.mainColor,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  child: Row(children: [
                    Container(
                      height: getProportionateScreenWidth(50),
                      width: getProportionateScreenWidth(50),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          shape: BoxShape.circle,
                          color: Colors.white),
                      child: _dataController.image.value == ""
                          ? Icon(
                              Icons.person,
                              color: AllColors.mainColor,
                              size: getProportionateScreenWidth(40),
                            )
                          : Container(
                              height: getProportionateScreenWidth(49),
                              width: getProportionateScreenWidth(49),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        _dataController.image.value),
                                    fit: BoxFit.cover),
                              ),
                            ),
                    ),
                    SizedBox(
                      width: getProportionateScreenWidth(8),
                    ),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        if (!_commonController.isLogin.value) {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        } else {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) => CreatePost()));
                        }
                      },
                      child: Container(
                        height: getProportionateScreenHeight(45),
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(15),
                        ),
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("What's on your mind?")),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(25))),
                      ),
                    ))
                  ]),
                ),
              ],
            ),
          ),
          Container(
            height: getProportionateScreenHeight(10),
            color: Colors.black.withOpacity(0.03),
          ),
          Expanded(
            child: Obx(() {
              if (_feedController.isBlogLoading.value) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AllColors.mainColor,
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: _feedController.timeLineList.value.length,
                    itemBuilder: (context, index) {
                      var result = _feedController.timeLineList.value[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) =>
                                        FeedDetails(feedModel: result)));
                          },
                          child: Card(
                            child: Container(
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
                                              height: SizeConfig.screenHeight *
                                                  0.07,
                                              width: SizeConfig.screenHeight *
                                                  0.07,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: Colors.grey)),
                                              child: result.userProfileImage ==
                                                      ""
                                                  ? Icon(
                                                      Icons.person,
                                                      color:
                                                          AllColors.mainColor,
                                                      size: SizeConfig
                                                              .screenHeight *
                                                          0.04,
                                                    )
                                                  : Container(
                                                      height: SizeConfig
                                                              .screenHeight *
                                                          0.07,
                                                      width: SizeConfig
                                                              .screenHeight *
                                                          0.07,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                result
                                                                    .userProfileImage),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                            ),
                                            SizedBox(
                                              width:
                                                  SizeConfig.screenWidth * 0.03,
                                            ),
                                            Text(
                                              result.userFullName,
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
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: SizeConfig.screenHeight * 0.01,
                                    ),
                                    result.image == ""
                                        ? Container(
                                            height:
                                                SizeConfig.screenHeight * 0.3,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        "asset/images/blank_image.png"),
                                                    fit: BoxFit.cover)),
                                          )
                                        : Container(
                                            height:
                                                SizeConfig.screenHeight * 0.3,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        result.image),
                                                    fit: BoxFit.cover)),
                                          ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              SizeConfig.screenWidth * 0.03),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            result.description,
                                            style: TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
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
          ),
        ],
      ),
    );
  }
}
