import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_search_products.dart';

class SubSearchScreen extends StatelessWidget {
  SubSearchScreen({Key? key, required this.searchType}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  String searchType;

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;

    var _aspectRatio;
    double aspt(double height) {
      var _crossAxisSpacing = 8;
      var _screenWidth = MediaQuery.of(context).size.width;
      var _crossAxisCount = 2;
      var _width =
          (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
              _crossAxisCount;
      var cellHeight = height;
      return _aspectRatio = _width / cellHeight;
    }

    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight:
              isTab ? getProportionateScreenHeight(70) : kToolbarHeight,
          title: Container(
            height: isTab
                ? getProportionateScreenHeight(50)
                : getProportionateScreenHeight(40),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(7)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius:
                  BorderRadius.circular(getProportionateScreenWidth(5)),
            ),
            child: TextField(
              controller: _searchController.subSearchTextController.value,
              onChanged: (value) {
                if (value.isEmpty) {
                  _searchController.showType.value = false;
                  _searchController.isTextEmpty.value = true;
                } else {
                  _searchController.isTextEmpty.value = false;
                }
                _searchController.getSearchSuggestionList(value);
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintText: searchType),
            ),
          ),
          actions: <Widget>[
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
            InkWell(
              onTap: () {
                if (_searchController
                    .subSearchTextController.value.text.isEmpty) {
                  _searchController.addToSearchHistory(value: searchType);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AllSearchProducts(
                                searchType: searchType,
                              )));
                } else {
                  _searchController.addToSearchHistory(
                      value:
                          _searchController.subSearchTextController.value.text);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AllSearchProducts(
                                searchType: _searchController
                                    .subSearchTextController.value.text,
                              )));
                }
              },
              child: CommonData.icon(
                  icon: "asset/icons/search_icon.png",
                  color: Colors.black,
                  isTab: isTab),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            )
          ],
        ),
        body: Obx(() {
          if (_searchController.showType.value) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Search History"),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Wrap(
                    spacing: 8,
                    children: List.generate(
                        _searchController.searchHistoryList.length, (index) {
                      var result = _searchController.searchHistoryList[index];
                      return ChoiceChip(
                        labelPadding: const EdgeInsets.all(2.0),
                        label: Text(result,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: getProportionateScreenWidth(13))),
                        selected: true,
                        selectedColor: Colors.grey.withOpacity(0.1),
                        onSelected: (value) {
                          _searchController.addToSearchHistory(value: result);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllSearchProducts(
                                        searchType: result,
                                      )));
                        },
                        // backgroundColor: color,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  ),
                ],
              ),
            );
          } else {
            return Obx(() {
              if (_searchController.isTextEmpty.value) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Search History"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.delete,
                                color: Colors.grey,
                              ))
                        ],
                      ),
                      Wrap(
                        spacing: 8,
                        children: List.generate(
                            _searchController.searchHistoryList.length,
                            (index) {
                          var result =
                              _searchController.searchHistoryList[index];
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Text(result,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: getProportionateScreenWidth(13))),
                            selected: true,
                            selectedColor: Colors.grey.withOpacity(0.1),
                            onSelected: (value) {
                              _searchController.addToSearchHistory(
                                  value: result);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AllSearchProducts(
                                            searchType: result,
                                          )));
                            },
                            // backgroundColor: color,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                          );
                        }),
                      ),
                    ],
                  ),
                );
              } else {
                return ListView.builder(
                    itemCount: _searchController.suggestionList.value.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          // _searchController.showType.value = true;
                          // _searchController.subSearchTextController.value.text =
                          //     _searchController.suggestionList.value[index];
                          _searchController.addToSearchHistory(
                              value: _searchController
                                  .suggestionList.value[index].subCategoryName);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllSearchProducts(
                                      searchType: _searchController
                                          .suggestionList
                                          .value[index]
                                          .subCategoryName)));
                        },
                        title: Text(_searchController
                            .suggestionList.value[index].subCategoryName),
                        trailing: Icon(Icons.keyboard_arrow_up),
                      );
                    });
              }
            });
          }
        }));
  }
}
