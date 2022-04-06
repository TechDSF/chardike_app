import 'package:chardike/screens/SearchPage/screen/search_product_list.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../size_config.dart';
import '../controller/search_controller.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const String routeName = "/search_screen";
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Container(
          height: getProportionateScreenHeight(40),
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            controller: _searchController.searchTextController.value,
            onChanged: (value) {
              if (value.isEmpty) {
                _searchController.showType.value = false;
              }
              _searchController.getSearchSuggestionList(value);
            },
            decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: "Search here"),
          ),
        ),
        actions: <Widget>[
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          const Center(child: FaIcon(FontAwesomeIcons.search)),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              const Text(
                "Brand",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Wrap(
                spacing: 8,
                children: List.generate(_searchController.searchBrandList.length,
                    (index) {
                  var result = _searchController.searchBrandList[index];
                  return ChoiceChip(
                    labelPadding: const EdgeInsets.all(2.0),
                    label: Text(
                      result,
                      style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: getProportionateScreenWidth(13))
                    ),
                    selected: true,
                    selectedColor: Colors.grey.withOpacity(0.1),
                    onSelected: (value) {
                      Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchProductList()));
                    },
                    // backgroundColor: color,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                  );
                }),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              const Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: getProportionateScreenHeight(5),
              ),
              Wrap(
                spacing: 8,
                children: List.generate(_searchController.searchCategoryList.length,
                        (index) {
                      var result = _searchController.searchCategoryList[index];
                      return ChoiceChip(
                        labelPadding: const EdgeInsets.all(2.0),
                        label: Text(
                            result,
                            style: TextStyle(color: Colors.black.withOpacity(0.7),fontSize: getProportionateScreenWidth(13))
                        ),
                        selected: true,
                        selectedColor: Colors.grey.withOpacity(0.1),
                        onSelected: (value) {
                          Navigator.push(context, MaterialPageRoute(builder: (_)=>SearchProductList()));
                        },
                        // backgroundColor: color,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
