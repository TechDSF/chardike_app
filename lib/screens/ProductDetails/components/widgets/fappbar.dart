import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/ProductDetails/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../../../CommonData/all_colors.dart';
import '../../../../size_config.dart';

class FAppBar extends SliverAppBar {
  final BuildContext context;
  final ProductModel productModel;
  final ProductDetailsController detailsController;
  final bool isCollapsed;
  final double expandedHeight;
  final double collapsedHeight;
  final AutoScrollController scrollController;
  final TabController tabController;
  final void Function(bool isCollapsed) onCollapsed;
  final void Function(int index) onTap;

  FAppBar({
    required this.context,
    required this.productModel,
    required this.detailsController,
    required this.isCollapsed,
    required this.expandedHeight,
    required this.collapsedHeight,
    required this.scrollController,
    required this.onCollapsed,
    required this.onTap,
    required this.tabController,
  }) : super(elevation: 0.0, pinned: true, forceElevated: true);

  @override
  PreferredSizeWidget? get bottom {
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: TabBar(
        labelColor: AllColors.mainColor,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.label,
        indicator: DotIndicator(
          color: AllColors.mainColor,
          distanceFromCenter: 16,
          radius: 3,
          paintingStyle: PaintingStyle.fill,
        ),
        isScrollable: true,
        controller: tabController,
          tabs: const [
            Tab(
              text: "Description",
            ),
            Tab(text: "Product Reviews"),
            Tab(text: "Product Inquiry"),
            Tab(text: "Shipping/Return/Exchange"),
          ],
        onTap: onTap,
      ),
    );
  }



  @override
  Widget? get flexibleSpace {
    return LayoutBuilder(
      builder: (
        BuildContext context,
        BoxConstraints constraints,
      ) {
        final top = constraints.constrainHeight();
        final collapsedHight = MediaQuery.of(context).viewPadding.top + kToolbarHeight + 48;
        WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
          onCollapsed(collapsedHight != top);
        });
        return FlexibleSpaceBar(
          collapseMode: CollapseMode.pin,
          background: Container(
            height: getProportionateScreenHeight(310),
            margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(10)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    getProportionateScreenWidth(7))),
            child: Stack(
              children: [
                CarouselSlider.builder(
                  itemCount: productModel.image.length,
                  options: CarouselOptions(
                    height: getProportionateScreenHeight(300),
                    viewportFraction: 1,
                    initialPage: 0,
                    onPageChanged: (value, reason) {
                      detailsController.imageIndex.value =
                          value + 1;
                    },
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlayCurve: Curves.linear,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  itemBuilder: (BuildContext context,
                      int itemIndex, int pageViewIndex) =>
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(10)),
                            image: DecorationImage(
                                image: AssetImage(
                                    productModel.image[itemIndex]),
                                fit: BoxFit.fill)),
                        width: double.infinity,
                      ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.center,
                      children: [
                        Container(
                          width:
                          getProportionateScreenWidth(50),
                          height:
                          getProportionateScreenWidth(20),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                              getProportionateScreenWidth(
                                  5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(
                                      10)),
                              color: Colors.grey),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: <Widget>[
                              Obx(() => Text(detailsController
                                  .imageIndex.value
                                  .toString())),
                              Text("/"),
                              Text(productModel.image.length
                                  .toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        );
      },
    );
  }
}
