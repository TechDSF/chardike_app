import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CategoryPage/controller/category_controller.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/size_config.dart';
import '../../../CommonData/common_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterMenu extends StatelessWidget {
  FilterMenu({Key? key}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: getProportionateScreenHeight(100),
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  color: Colors.grey.withOpacity(0.5),
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Search Filter",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15)),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Text(
                        "Rating",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _searchController.selectRating.value = 1;
                              _searchController.ratingCount.value = 5.0;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _searchController
                                                  .selectRating.value ==
                                              1
                                          ? AllColors.mainColor
                                          : Colors.grey.withOpacity(0.3)),
                                  color:
                                      _searchController.selectRating.value == 1
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("5 Stars"),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _searchController.selectRating.value = 2;
                              _searchController.ratingCount.value = 4.0;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _searchController
                                                  .selectRating.value ==
                                              2
                                          ? AllColors.mainColor
                                          : Colors.grey.withOpacity(0.3)),
                                  color:
                                      _searchController.selectRating.value == 2
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("4 Stars"),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _searchController.selectRating.value = 3;
                              _searchController.ratingCount.value = 3.0;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _searchController
                                                  .selectRating.value ==
                                              3
                                          ? AllColors.mainColor
                                          : Colors.grey.withOpacity(0.3)),
                                  color:
                                      _searchController.selectRating.value == 3
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("3 Stars"),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _searchController.selectRating.value = 4;
                              _searchController.ratingCount.value = 2.0;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _searchController
                                                  .selectRating.value ==
                                              4
                                          ? AllColors.mainColor
                                          : Colors.grey.withOpacity(0.3)),
                                  color:
                                      _searchController.selectRating.value == 4
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("2 Stars"),
                                ),
                              ),
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(5),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              _searchController.selectRating.value = 5;
                              _searchController.ratingCount.value = 1.0;
                            },
                            child: Obx(
                              () => Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: _searchController
                                                  .selectRating.value ==
                                              5
                                          ? AllColors.mainColor
                                          : Colors.grey.withOpacity(0.3)),
                                  color:
                                      _searchController.selectRating.value == 5
                                          ? Colors.transparent
                                          : Colors.grey.withOpacity(0.3),
                                ),
                                child: Center(
                                  child: Text("1 Stars"),
                                ),
                              ),
                            ),
                          )),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Expanded(child: SizedBox())
                        ],
                      ),
                      Divider(
                        color: Colors.black45,
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(10),
                      ),
                      Text(
                        "Price Range",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15)),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(15),
                      ),
                      Container(
                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                        color: Colors.grey.withOpacity(0.3),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                                child: Container(
                              height: getProportionateScreenHeight(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.8))),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "MIN",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                            )),
                            SizedBox(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(10)),
                                child: Text("-"),
                              ),
                            ),
                            Expanded(
                                child: Container(
                              height: getProportionateScreenHeight(30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.withOpacity(0.8))),
                              child: Center(
                                child: TextField(
                                  style: TextStyle(
                                      fontSize:
                                          getProportionateScreenWidth(12)),
                                  textAlign: TextAlign.center,
                                  decoration: const InputDecoration(
                                      hintText: "MAX",
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: getProportionateScreenHeight(25),
                      ),
                      Text(
                        "Brand",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(15)),
                      ),
                      GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _searchController.brandList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing:
                                      getProportionateScreenWidth(5),
                                  crossAxisSpacing:
                                      getProportionateScreenWidth(5),
                                  childAspectRatio: CommonData.aspactRatio(
                                      height: getProportionateScreenHeight(60),
                                      context: context,
                                      crossAxisCount: 2,
                                      crossAxisSpacing:
                                          getProportionateScreenWidth(10))),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                _searchController.selectBrand.value = index;
                                _searchController.brandName.value =
                                    _searchController.brandList[index].name;
                              },
                              child: Obx(
                                () => Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical:
                                          getProportionateScreenHeight(10)),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: _searchController
                                                    .selectBrand.value ==
                                                index
                                            ? AllColors.mainColor
                                            : Colors.grey.withOpacity(0.3)),
                                    color:
                                        _searchController.selectBrand.value ==
                                                index
                                            ? Colors.transparent
                                            : Colors.grey.withOpacity(0.3),
                                  ),
                                  child: Center(
                                      child: Text(
                                    _searchController.brandList[index].name
                                        .toString(),
                                    style: TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  )),
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: InkWell(
                onTap: () {
                  _searchController.selectRating.value = 10;
                  _searchController.selectBrand.value = 100;
                  _searchController.brandName.value = "";
                  _searchController.ratingCount.value = 0.0;
                  _searchController.filterAllProduct();
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      border: Border.all(color: AllColors.mainColor)),
                  child: Center(
                      child: Text(
                    "Reset",
                    style: TextStyle(
                        color: AllColors.mainColor,
                        fontSize: getProportionateScreenWidth(15)),
                  )),
                ),
              )),
              SizedBox(
                width: getProportionateScreenWidth(10),
              ),
              Expanded(
                  child: InkWell(
                onTap: () {
                  _searchController.filterAllProduct();
                },
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(color: AllColors.mainColor),
                  child: Center(
                      child: Text(
                    "Apply",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(15)),
                  )),
                ),
              )),
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(10),
        )
      ],
    );
  }
}
