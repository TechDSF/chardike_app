import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/FeedPage/components/image_slider_item.dart';
import 'package:chardike/screens/FeedPage/controller/feed_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TimeLineScreen extends StatelessWidget {
  TimeLineScreen({Key? key}) : super(key: key);
  final FeedController _feedController = Get.put(FeedController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _feedController.timeLineList.length,
        itemBuilder: (context, index) {
        var result = _feedController.timeLineList[index];
      return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(10)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: Row(
                children: <Widget>[
                  Container(
                    height: getProportionateScreenWidth(40),
                    width: getProportionateScreenWidth(40),
                    padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Image.asset("asset/images/chardike_logo.png"),
                  ),
                  SizedBox(width: getProportionateScreenWidth(10),),
                  Expanded(child: Text("Chardike",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(12)),)),
                  Icon(Icons.more_horiz,color: Colors.grey,size: getProportionateScreenWidth(20),)
                ],
              ),
            ),
            SizedBox(height: getProportionateScreenWidth(10),),
            ImageSliderItem(images: result.image),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: getProportionateScreenWidth(10),),
                  Row(
                    children: <Widget>[
                      Row(
                        children: [
                          Icon(Icons.favorite_border,color: Colors.grey,size: getProportionateScreenWidth(20),),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Text(result.totalLike.toString(),style: TextStyle(color: Colors.grey,fontSize: getProportionateScreenWidth(12)),)
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(15),),
                      Row(
                        children: [
                          Icon(Icons.mode_comment_outlined,color: Colors.grey,size: getProportionateScreenWidth(20),),
                          SizedBox(width: getProportionateScreenWidth(5),),
                          Text(result.totalComment.toString(),style: TextStyle(color: Colors.grey,fontSize: getProportionateScreenWidth(12)),)
                        ],
                      ),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      Spacer(),
                      FaIcon(FontAwesomeIcons.share,color: Colors.grey,size: getProportionateScreenWidth(20),)
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(10),),
                  RichText(text: TextSpan(
                      children: [
                        TextSpan(text: "Chardike ",style: TextStyle(fontSize: getProportionateScreenWidth(13),fontWeight: FontWeight.bold,color: Colors.black)),
                        TextSpan(text: result.title,style: CommonData.customTextStyle())
                      ]
                  )),
                  SizedBox(height: getProportionateScreenWidth(10),),
                  Row(
                    children: [
                      Container(
                        height: getProportionateScreenWidth(30),
                        width: getProportionateScreenWidth(30),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black.withOpacity(0.3)
                      ),
                        child: Center(child: Icon(Icons.person,size: getProportionateScreenWidth(20),)),
                      ),
                      SizedBox(width: getProportionateScreenWidth(10),),
                      Expanded(child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            fontSize: getProportionateScreenWidth(12)
                          ),
                          hintText: "Add a comment...",
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none
                        ),
                      ))
                    ],
                  ),
                  SizedBox(height: getProportionateScreenWidth(3),),
                  Text(CommonData.findOutDifferenceDate(result.postHour),style: TextStyle(fontSize: getProportionateScreenWidth(10)),)
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
