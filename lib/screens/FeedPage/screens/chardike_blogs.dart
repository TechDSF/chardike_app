import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ChardikeBlogScreen extends StatelessWidget {
  ChardikeBlogScreen({Key? key}) : super(key: key);
  final FeedController _feedController = Get.put(FeedController());
  final CommonController _commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    _feedController.getAdminFeed();
    return Obx(() {
      if (_feedController.isAdminBlogLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return ListView.builder(
            itemCount: _feedController.adminBlogList.value.length,
            itemBuilder: (context, index) {
              var result = _feedController.adminBlogList.value[index];
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
                            height: SizeConfig.screenHeight * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        NetworkImage(result.image.toString()))),
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
                                  maxLines: 1,
                                  textOverflow: TextOverflow.ellipsis),
                            },
                          ),
                        ],
                      ),
                    ),
                  ]);
            });
      }
    });
  }
}
