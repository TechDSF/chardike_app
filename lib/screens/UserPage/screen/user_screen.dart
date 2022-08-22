import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/AuthenticationPage/screens/login_screen.dart';
import 'package:chardike/screens/AuthenticationPage/screens/register_screen.dart';
import 'package:chardike/screens/CartPage/screen/cart_screen.dart';
import 'package:chardike/screens/UserPage/components/MyLikes/my_likes.dart';
import 'package:chardike/screens/UserPage/components/MyPurchases/my_purchases.dart';
import 'package:chardike/screens/UserPage/components/my_review.dart';
import 'package:chardike/screens/UserPage/controller/purchase_controller.dart';
import 'package:chardike/screens/UserPage/controller/user_controller.dart';
import 'package:chardike/screens/UserPage/screen/account_setting.dart';
import 'package:chardike/screens/UserPage/screen/edit_profile.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../components/help_center.dart';

class UserScreen extends StatelessWidget {
  UserScreen({Key? key}) : super(key: key);
  final UserController userController = Get.put(UserController());
  final CommonController _commonController = Get.put(CommonController());
  final UserDataController _userDataController = Get.put(UserDataController());
  final PurchaseController _purchaseController = Get.put(PurchaseController());

  Widget ButtonWithText(
      {required String text, required Color color, required String icon}) {
    return Column(
      children: <Widget>[
        Container(
          height: getProportionateScreenWidth(50),
          width: getProportionateScreenWidth(50),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
        ),
        SizedBox(
          height: getProportionateScreenHeight(5),
        ),
        Text(
          text,
          style: TextStyle(
              color: Colors.black, fontSize: getProportionateScreenWidth(10)),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget SocialMediaIcon({required String image, required VoidCallback onTap}) {
    return InkWell(
        onTap: onTap,
        child: Image.asset(
          image,
          height: getProportionateScreenWidth(50),
          width: getProportionateScreenWidth(50),
          fit: BoxFit.fill,
        ));
  }

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0xFFB6CAEF)),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(40),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, AccountSetting.routeName);
                          },
                          child: CommonData.icon(
                              icon: "asset/icons/settings.png",
                              color: Colors.black,
                              isTab: isTab)),
                      SizedBox(
                        width: getProportionateScreenWidth(15),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CartScreen.routeName);
                          },
                          child: CommonData.icon(
                              icon: "asset/icons/cart.png",
                              color: Colors.black,
                              isTab: isTab)),
                      SizedBox(
                        width: getProportionateScreenWidth(15),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(15),
                  ),
                  Obx(() {
                    if (_commonController.isLogin.value) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget>[
                            InkWell(onTap: () {
                              Navigator.pushNamed(
                                  context, EditProfile.routeName);
                            }, child: Obx(() {
                              if (_userDataController.image.value != "") {
                                return Container(
                                  height: getProportionateScreenWidth(70),
                                  width: getProportionateScreenWidth(70),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              _userDataController.image.value),
                                          fit: BoxFit.cover)),
                                );
                              } else {
                                return Container(
                                  height: getProportionateScreenWidth(70),
                                  width: getProportionateScreenWidth(70),
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white),
                                  child: Icon(
                                    Icons.person,
                                    color: AllColors.mainColor,
                                    size: getProportionateScreenWidth(40),
                                  ),
                                );
                              }
                            })),
                            SizedBox(
                              width: getProportionateScreenWidth(15),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Obx(
                                    () => Text(
                                      _userDataController.fullName.value,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(15)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(5),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Image.asset(
                                        "asset/icons/coins.png",
                                        height: SizeConfig.screenWidth * 0.05,
                                        width: SizeConfig.screenWidth * 0.05,
                                      ),
                                      SizedBox(
                                        width: SizeConfig.screenWidth * 0.01,
                                      ),
                                      Expanded(
                                          child: Text(
                                        _userDataController.points.value
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: getProportionateScreenWidth(50),
                              width: getProportionateScreenWidth(50),
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: Icon(
                                Icons.person,
                                color: AllColors.mainColor,
                                size: getProportionateScreenWidth(25),
                              ),
                            ),
                            Expanded(
                                child: Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, LoginScreen.routeName);
                                  },
                                  child: Container(
                                    child: Text(
                                      "Log In",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: AllColors.mainColor),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenWidth(15),
                                        vertical:
                                            getProportionateScreenWidth(8)),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(2))),
                                  ),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(10),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, RegisterScreen.routeName);
                                  },
                                  child: Container(
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            getProportionateScreenWidth(15),
                                        vertical:
                                            getProportionateScreenWidth(8)),
                                    decoration: BoxDecoration(
                                        color: Color(0xFFB6CAEF),
                                        borderRadius: BorderRadius.circular(
                                            getProportionateScreenWidth(2)),
                                        border:
                                            Border.all(color: Colors.black)),
                                  ),
                                ),
                              ],
                              mainAxisAlignment: MainAxisAlignment.end,
                            ))
                          ],
                        ),
                      );
                    }
                  }),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                ],
              ),
            ),
            // Obx(() {
            //   if (!_commonController.isLogin.value) {
            //     return SizedBox();
            //   } else {
            //     return Column(
            //       children: <Widget>[
            //         ListTile(
            //           leading: Image.asset(
            //             "asset/icons/gift.png",
            //             height: getProportionateScreenWidth(25),
            //             width: getProportionateScreenWidth(25),
            //           ),
            //           title: const Text(
            //             "Welcome Package",
            //             style: TextStyle(color: Colors.black),
            //           ),
            //         ),
            //         const Divider(
            //           color: Colors.grey,
            //         ),
            //         Row(
            //           children: <Widget>[
            //             Expanded(
            //                 child: ButtonWithText(
            //                     text: "Free Vouchers",
            //                     color: Colors.amber,
            //                     icon: "")),
            //             Expanded(
            //                 child: ButtonWithText(
            //                     text: "Free Gifts",
            //                     color: AllColors.mainColor,
            //                     icon: "")),
            //             Expanded(
            //                 child: ButtonWithText(
            //                     text: "Free Money",
            //                     color: Colors.amber,
            //                     icon: "")),
            //             Expanded(
            //                 child: ButtonWithText(
            //                     text: "Free Deals",
            //                     color: AllColors.mainColor,
            //                     icon: "")),
            //           ],
            //         ),
            //         SizedBox(
            //           height: getProportionateScreenWidth(15),
            //         ),
            //       ],
            //     );
            //   }
            // }),

            ListTile(
              onTap: () {
                if (!_commonController.isLogin.value) {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                } else {
                  _purchaseController.tabIndex.value = 4;
                  Navigator.pushNamed(context, MyPurchases.routeName);
                }
              },
              leading: CommonData.icon(
                  icon: "asset/icons/writing.png",
                  color: Colors.blue,
                  isTab: isTab),
              title: const Text(
                "My Purchases",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Text(
                "View Purchase History >",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: getProportionateScreenWidth(10)),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
            Obx(() {
              if (!_commonController.isLogin.value) {
                return const SizedBox();
              } else {
                return Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: CommonData.icon(
                                icon: "asset/icons/wallet.png",
                                color: Colors.black,
                                isTab: isTab),
                            subtitle: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "On Hold",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                            onTap: () {
                              _purchaseController.tabIndex.value = 3;
                              Navigator.pushNamed(
                                  context, MyPurchases.routeName);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: CommonData.icon(
                                icon: "asset/icons/wallet.png",
                                color: Colors.black,
                                isTab: isTab),
                            subtitle: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Confirmed",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(9)),
                              ),
                            )),
                            onTap: () {
                              _purchaseController.tabIndex.value = 1;
                              Navigator.pushNamed(
                                  context, MyPurchases.routeName);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: CommonData.icon(
                                icon: "asset/icons/postbox.png",
                                color: Colors.black,
                                isTab: isTab),
                            subtitle: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Shipped",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getProportionateScreenWidth(10)),
                              ),
                            )),
                            onTap: () {
                              _purchaseController.tabIndex.value = 2;
                              Navigator.pushNamed(
                                  context, MyPurchases.routeName);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                              onTap: () {
                                _purchaseController.tabIndex.value = 4;
                                Navigator.pushNamed(
                                    context, MyPurchases.routeName);
                              },
                              title: CommonData.icon(
                                  icon: "asset/icons/rate.png",
                                  color: Colors.black,
                                  isTab: isTab),
                              subtitle: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "To Rate",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize:
                                          getProportionateScreenWidth(10)),
                                ),
                              ))),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.5),
                    ),
                  ],
                );
              }
            }),
            // ListTile(
            //   onTap: (){
            //     if(!_commonController.isLogin.value){
            //       Navigator.pushNamed(context, LoginScreen.routeName);
            //     }
            //   },
            //   leading: CommonData.icon(icon: "asset/icons/smartphone.png", color: Colors.green , isTab: isTab),
            //   title: const Text("Digital Purchases",style: TextStyle(color: Colors.black),),
            //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
            // ),
            // Divider(color: Colors.grey.withOpacity(0.5),),
            // ListTile(
            //   onTap: (){
            //     if(!_commonController.isLogin.value){
            //       Navigator.pushNamed(context, LoginScreen.routeName);
            //     }
            //   },
            //   leading: Icon(Icons.wallet_giftcard,color: AllColors.mainColor,),
            //   title: const Text("Chardike Loyality",style: TextStyle(color: Colors.black),),
            //   trailing: const Icon(Icons.arrow_forward_ios_outlined),
            // ),
            //Divider(color: Colors.grey.withOpacity(0.5),),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, MyLikes.routeName);
              },
              leading: Icon(
                Icons.favorite_border,
                color: AllColors.mainColor,
              ),
              title: const Text(
                "My Likes",
                style: TextStyle(color: Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            // Divider(
            //   color: Colors.grey.withOpacity(0.5),
            // ),
            // ListTile(
            //   onTap: () {
            //     if (!_commonController.isLogin.value) {
            //       Navigator.pushNamed(context, LoginScreen.routeName);
            //     }
            //   },
            //   leading: Icon(
            //     Icons.mail_outline,
            //     color: Colors.green,
            //   ),
            //   title: Text(
            //     "Refere a Friend",
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   trailing: Icon(Icons.arrow_forward_ios_outlined),
            // ),

            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            ListTile(
              onTap: () {
                if (!_commonController.isLogin.value) {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => MyReviews()));
                }
              },
              leading: Icon(
                Icons.star_border_purple500_sharp,
                color: Colors.blue,
              ),
              title: Text(
                "My Reviews",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Container(
              height: getProportionateScreenWidth(10),
              width: double.infinity,
              color: Colors.grey.withOpacity(0.2),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, AccountSetting.routeName);
              },
              leading: const Icon(
                Icons.person,
                color: Colors.blue,
              ),
              title: const Text(
                "Account Setting",
                style: TextStyle(color: Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, HelpCenter.routeName);
              },
              leading: const Icon(
                Icons.help_outline,
                color: Colors.green,
              ),
              title: const Text(
                "Help Centre",
                style: TextStyle(color: Colors.black),
              ),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),

            ListTile(
              onTap: () {
                Share.share("https://chardike.com/");
              },
              leading: Icon(
                Icons.share,
                color: Colors.greenAccent,
              ),
              title: Text(
                "Share With Friends",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            Divider(
              color: Colors.grey.withOpacity(0.5),
            ),

            const ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.green,
              ),
              title: Text(
                "Chat With Chardike",
                style: TextStyle(color: Colors.black),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            ),
            SizedBox(
              height: getProportionateScreenHeight(20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialMediaIcon(
                    image: "asset/icons/social/facebook.png",
                    onTap: () {
                      userController.launchFacebookUrl(
                          url:
                              Uri.parse("https://www.facebook.com/chardikebd"));
                    }),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                SocialMediaIcon(
                    image: "asset/icons/social/instagram.png", onTap: () {}),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                SocialMediaIcon(
                    image: "asset/icons/social/twitter.png", onTap: () {})
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Term of Use",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(10)),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  height: getProportionateScreenWidth(5),
                  width: getProportionateScreenWidth(5),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "Term of Sale",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(10)),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  height: getProportionateScreenWidth(5),
                  width: getProportionateScreenWidth(5),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(10)),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Warranty Policy",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(10)),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Container(
                  height: getProportionateScreenWidth(5),
                  width: getProportionateScreenWidth(5),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(10),
                ),
                Text(
                  "Return Policy",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                      fontSize: getProportionateScreenWidth(10)),
                ),
              ],
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            const Text(
              "Version 1.0.1",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
          ],
        ),
      ),
    );
  }
}
