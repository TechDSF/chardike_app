import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/SearchPage/controller/search_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'all_search_products.dart';

class SubSearchScreen extends StatelessWidget {
  SubSearchScreen({Key? key, required this.searchType, required this.id})
      : super(key: key);
  final SearchController _searchController = Get.put(SearchController());
  String searchType;
  String id;

  @override
  Widget build(BuildContext context) {
    bool isTab = SizeConfig.screenWidth > 768;

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
                  if (!_searchController.checkDataExitOrNotInSearch(
                      id: searchType)) {
                    _searchController.addToSearchHistory(
                        value: searchType, id: id);
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AllSearchProducts(
                                productList: [],
                                id: id,
                                searchType: searchType,
                              )));
                } else {
                  if (!_searchController.checkDataExitOrNotInSearch(
                      id: _searchController
                          .subSearchTextController.value.text)) {
                    _searchController.addToSearchHistory(
                        value: _searchController
                            .subSearchTextController.value.text,
                        id: "1");
                  }

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AllSearchProducts(
                                productList: [],
                                id: "1",
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
                        label: Text(result.name,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: getProportionateScreenWidth(13))),
                        selected: true,
                        selectedColor: Colors.grey.withOpacity(0.1),
                        onSelected: (value) {
                          if (!_searchController.checkDataExitOrNotInSearch(
                              id: result.name)) {
                            _searchController.addToSearchHistory(
                                id: result.id, value: result.name);
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllSearchProducts(
                                        productList: [],
                                        id: result.id,
                                        searchType: result.name,
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
                            label: Text(result.name,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: getProportionateScreenWidth(13))),
                            selected: true,
                            selectedColor: Colors.grey.withOpacity(0.1),
                            onSelected: (value) {
                              if (!_searchController.checkDataExitOrNotInSearch(
                                  id: result.name)) {
                                _searchController.addToSearchHistory(
                                    value: result.name, id: result.id);
                              }

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => AllSearchProducts(
                                            productList: [],
                                            id: result.id,
                                            searchType: result.name,
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
                          if (!_searchController.checkDataExitOrNotInSearch(
                              id: _searchController.suggestionList.value[index]
                                  .subCategoryName)) {
                            _searchController.addToSearchHistory(
                                value: _searchController.suggestionList
                                    .value[index].subCategoryName,
                                id: _searchController
                                    .suggestionList.value[index].id
                                    .toString());
                          }

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllSearchProducts(
                                      productList: [],
                                      id: _searchController
                                          .suggestionList.value[index].id
                                          .toString(),
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
