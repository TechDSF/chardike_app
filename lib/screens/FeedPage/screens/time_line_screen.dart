import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/FeedPage/components/create_post.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';

class TimeLineScreen extends StatelessWidget {
  TimeLineScreen({Key? key}) : super(key: key);
  final FeedController _feedController = Get.put(FeedController());
  final CommonController _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    _feedController.getTimeLineFeed();
    return Column(
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
                    child: Icon(
                      Icons.person,
                      color: AllColors.mainColor,
                      size: getProportionateScreenWidth(40),
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
        Expanded(
          child: Obx(() {
            if (_feedController.isBlogLoading.value) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                  itemCount: _feedController.timeLineList.value.length,
                  itemBuilder: (context, index) {
                    var result = _feedController.timeLineList.value[index];
                    return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: getProportionateScreenHeight(10),
                            color: Colors.black.withOpacity(0.09),
                          ),
                          result.image == null
                              ? SizedBox()
                              : Container(
                                  height: SizeConfig.screenHeight * 0.4,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              result.image.toString()))),
                                ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  result.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Html(
                                  data: result.description,
                                  style: {
                                    'p': Style(
                                        maxLines: 2,
                                        textOverflow: TextOverflow.ellipsis),
                                  },
                                ),
                              ],
                            ),
                          ),
                        ]);
                  });
            }
          }),
        ),
      ],
    );
  }
}
