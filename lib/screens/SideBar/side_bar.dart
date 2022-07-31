import 'package:chardike/CommonData/CommonController.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/screens/BrandPage/brand_page.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../AuthenticationPage/screens/login_screen.dart';
import '../CategoryPage/category_page.dart';
import '../UserPage/components/MyLikes/my_likes.dart';
import '../UserPage/screen/account_setting.dart';
import '../UserPage/screen/edit_profile.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key}) : super(key: key);
  bool isTab = SizeConfig.screenWidth > 768;
  final HomeController _homeController = Get.put(HomeController());
  final CommonController _commonController = Get.put(CommonController());
  final UserDataController _dataController = Get.put(UserDataController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth * 0.03),
        child: Column(children: [
          SizedBox(
            height: isTab ? SizeConfig.screenHeight * 0.025 : kToolbarHeight,
          ),
          Row(
            children: <Widget>[
              InkWell(
                onTap: () {
                  if (_commonController.isLogin.value) {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  } else {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  }
                },
                child: Container(
                    height: width * 0.2,
                    width: width * 0.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.greenAccent)),
                    child: Obx(
                      () => _commonController.isLogin.value &&
                              _dataController.image.value != ""
                          ? Container(
                              height: width * 0.19,
                              width: width * 0.19,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          _dataController.image.value),
                                      fit: BoxFit.cover)),
                            )
                          : Icon(
                              Icons.person,
                              size: width * 0.1,
                              color: AllColors.mainColor,
                            ),
                    )),
              ),
              SizedBox(
                width: SizeConfig.screenWidth * 0.03,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Obx(
                    () => Text(
                      _commonController.isLogin.value == false ||
                              _dataController.fullName.value == ""
                          ? "Demo User"
                          : _dataController.fullName.value,
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.035,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenWidth * 0.02,
                  ),
                  Obx(
                    () => Text(
                      _commonController.isLogin.value == false ||
                              _dataController.phone.value == ""
                          ? "01**********"
                          : _dataController.phone.value,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: SizeConfig.screenWidth * 0.03,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
          Divider(),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BrandPage()));
            },
            leading: Icon(Icons.category),
            title: Text("Brand"),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => CategoryScreen(
                            slug: _homeController.categoryList[0].slug,
                          )));
            },
            leading: Icon(Icons.category),
            title: Text("Category"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, MyLikes.routeName);
            },
            leading: Icon(Icons.favorite),
            title: Text("Wishlist"),
          ),
          ListTile(
            onTap: () {
              if (_commonController.isLogin.value) {
                Navigator.pushNamed(context, EditProfile.routeName);
              } else {
                Navigator.pushNamed(context, LoginScreen.routeName);
              }
            },
            leading: Icon(Icons.person),
            title: Text("Account"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AccountSetting.routeName);
            },
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
        ]),
      ),
    );
  }
}
