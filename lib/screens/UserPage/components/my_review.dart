import 'package:chardike/screens/UserPage/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../CommonData/all_colors.dart';
import '../../../CommonData/common_data.dart';
import '../../../size_config.dart';

class MyReviews extends StatelessWidget {
  MyReviews({Key? key}) : super(key: key);
  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    _userController.getMyReviews();
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("My Reviews"),
      ),
      body: RefreshIndicator(
        onRefresh: _userController.getMyReviews,
        child: Obx(() {
          if (_userController.isMyReviewLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (_userController.myReviewList.isEmpty) {
              return Center(
                child: Text("There is no review yet!"),
              );
            } else {
              return ListView.builder(
                  itemCount: _userController.myReviewList.length,
                  itemBuilder: (context, index) {
                    var result = _userController.myReviewList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shadowColor: Colors.grey,
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  result.product.productName.toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis),
                                ),
                                SizedBox(
                                  height: getProportionateScreenHeight(5),
                                ),
                                Text(
                                  CommonData.customizeDate(
                                      dateTime: result.product.updatedAt),
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: getProportionateScreenWidth(10),
                                      overflow: TextOverflow.ellipsis),
                                ),
                                result.product.featureImage == ""
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
                                                image: NetworkImage(result
                                                    .product.featureImage),
                                                fit: BoxFit.cover)),
                                      ),
                                Divider(),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      height: getProportionateScreenHeight(50),
                                      width: getProportionateScreenHeight(50),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: result.profile.profilePicture == ""
                                          ? Icon(
                                              Icons.person,
                                              color: AllColors.mainColor,
                                              size: getProportionateScreenWidth(
                                                  40),
                                            )
                                          : Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                      image: NetworkImage(result
                                                          .profile
                                                          .profilePicture),
                                                      fit: BoxFit.cover)),
                                            ),
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                    Expanded(
                                        child: Container(
                                      padding: EdgeInsets.all(
                                          getProportionateScreenWidth(10)),
                                      decoration: BoxDecoration(
                                          color: Colors.grey.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                              getProportionateScreenWidth(5))),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              result.profile.fullName,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      5),
                                            ),
                                            RatingBarIndicator(
                                              rating:
                                                  result.starCount.toDouble(),
                                              itemBuilder: (context, index) =>
                                                  Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize:
                                                  SizeConfig.screenWidth * 0.04,
                                              direction: Axis.horizontal,
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      5),
                                            ),
                                            Text(
                                              result.review,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w300),
                                            )
                                          ]),
                                    )),
                                    SizedBox(
                                      width: getProportionateScreenWidth(10),
                                    ),
                                  ],
                                )
                              ]),
                        ),
                      ),
                    );
                  });
            }
          }
        }),
      ),
    );
  }
}
