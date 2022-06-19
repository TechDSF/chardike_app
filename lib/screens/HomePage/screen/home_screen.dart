import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/components/all_product_section.dart';
import 'package:chardike/screens/HomePage/components/banner_section.dart';
import 'package:chardike/screens/HomePage/components/category_section.dart';
import 'package:chardike/screens/HomePage/components/feature_product.dart';
import 'package:chardike/screens/HomePage/components/flash_deal_section.dart';
import 'package:chardike/screens/HomePage/components/product_type.dart';
import 'package:chardike/screens/HomePage/components/slider_widget.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/screens/SearchPage/screen/sub_search_screen.dart';
import 'package:chardike/screens/SideBar/side_bar.dart';
import 'package:chardike/screens/WheelPage/screen/wheel_screen.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../components/top_product.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _homeController = Get.put(HomeController());
  final SearchController _searchController = Get.put(SearchController());

  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  late ScrollController _scrollController;
  double _scrollControllerOffest = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  _scrollListener() {
    setState(() {
      _scrollControllerOffest = _scrollController.offset;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;
    //print("Work twice------------");
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: _homeController.navigatorKey,
      drawer: Drawer(
        child: SideBar(),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              SliderWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ProductTType(),
                    BannerSection(
                        image: "asset/images/banner_1.png", onTap: () {}),
                    FlashDealSection(),
                    TopProduct(),
                    CategorySection(),
                    BannerSection(
                        image: "asset/images/banner2.jpg", onTap: () {}),
                    FeatureProductSection(),
                    AllProductSection()
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: getProportionateScreenHeight(80),
          padding: EdgeInsets.only(top: getProportionateScreenHeight(30)),
          child: Row(children: [
            Builder(builder: (context) {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            }),
            Expanded(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SubSearchScreen()));
                },
                child: Container(
                    height: getProportionateScreenHeight(30),
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10),
                        vertical: getProportionateScreenHeight(2)),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(getProportionateScreenWidth(7)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: <Widget>[
                        CommonData.bottomIcon(
                            icon: "asset/icons/search_icon.png",
                            color: Colors.grey,
                            isTab: isTab),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        Expanded(child: Obx(() {
                          if (_searchController
                              .firstitemOfCategory.value.isNotEmpty) {
                            return Text(
                              _searchController.firstitemOfCategory.value,
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: getProportionateScreenWidth(13)),
                              maxLines: 1,
                            );
                          } else {
                            return Text(
                              "Search your product",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: getProportionateScreenWidth(13)),
                              maxLines: 1,
                            );
                          }
                        }))
                      ],
                    )),
              ),
            ),
            Image.asset(
              "asset/icons/coins.png",
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(30),
            ),
            SizedBox(
              width: getProportionateScreenWidth(3),
            )
          ]),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AllColors.mainColor.withOpacity(
                (_scrollControllerOffest / 200).clamp(0, 1).toDouble()),
          ),
        )
      ]),
      // body: NestedScrollView(
      //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
      //       [
      //     SliverAppBar(
      //       floating: true,
      //       pinned: false,
      //       bottom: PreferredSize(
      //         preferredSize: const Size.fromHeight(0.0),
      //         child: Transform.translate(
      //           offset: const Offset(0, 24),
      //           child: ElevatedButton(
      //             child: Text("Click Here"),
      //             onPressed: () {},
      //           ),
      //         ),
      //       ),
      //       title: Padding(
      //         padding: EdgeInsets.all(getProportionateScreenHeight(7)),
      //         child: InkWell(
      //           onTap: () {
      //             Navigator.push(context,
      //                 MaterialPageRoute(builder: (_) => SubSearchScreen()));
      //           },
      //           child: Container(
      //               height: getProportionateScreenWidth(45),
      //               margin: EdgeInsets.symmetric(
      //                   horizontal: getProportionateScreenWidth(10)),
      //               padding: EdgeInsets.symmetric(
      //                   horizontal: getProportionateScreenWidth(10),
      //                   vertical: getProportionateScreenHeight(2)),
      //               decoration: BoxDecoration(
      //                 borderRadius:
      //                     BorderRadius.circular(getProportionateScreenWidth(7)),
      //                 border: Border.all(color: Colors.grey),
      //               ),
      //               child: Row(
      //                 children: <Widget>[
      //                   CommonData.bottomIcon(
      //                       icon: "asset/icons/search_icon.png",
      //                       color: Colors.grey,
      //                       isTab: isTab),
      //                   SizedBox(
      //                     width: getProportionateScreenWidth(10),
      //                   ),
      //                   Expanded(
      //                     child: Text(
      //                       "Search your product",
      //                       style: TextStyle(
      //                           color: Colors.black.withOpacity(0.6),
      //                           fontSize: getProportionateScreenWidth(13)),
      //                       maxLines: 1,
      //                     ),
      //                   )
      //                 ],
      //               )),
      //         ),
      //       ),
      //       toolbarHeight: isTab
      //           ? getProportionateScreenHeight(270)
      //           : getProportionateScreenHeight(190),
      //       flexibleSpace: SliderWidget(),
      //     ),
      //   ],
      //   body: SingleChildScrollView(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: <Widget>[
      //           SliderWidget(),
      //           ProductType(),
      //           BannerSection(image: "asset/images/banner_1.png", onTap: () {}),
      //           FlashDealSection(),
      //           TopProduct(),
      //           CategorySection(),
      //           BannerSection(image: "asset/images/banner2.jpg", onTap: () {}),
      //           FeatureProductSection(),
      //           AllProductSection()
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButton: Obx(() {
      //   if (_homeController.perDayDiscountItem.value > 10) {
      //     return const SizedBox();
      //   } else {
      //     return InkWell(
      //       onTap: () {
      //         //_homeController.setPerDayDiscount();
      //         Navigator.pushNamed(context, WheelScreen.routeName);
      //       },
      //       child: Container(
      //         height: getProportionateScreenHeight(50),
      //         width: getProportionateScreenHeight(50),
      //         decoration: const BoxDecoration(
      //             shape: BoxShape.circle,
      //             image: DecorationImage(
      //                 image: AssetImage("asset/icons/wheel_icon.gif"))),
      //       ),
      //     );
      //   }
      // }),
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniStartFloat,
    );
  }
}
