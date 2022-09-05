import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../size_config.dart';
import '../SearchPage/controller/search_controller.dart';
import '../SearchPage/screen/all_search_products.dart';

class BrandPage extends StatelessWidget {
  BrandPage({Key? key}) : super(key: key);
  final SearchController _searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Brand"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _searchController.brandList.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: double.infinity,
                      ),
                      Text("You don't have any brand!")
                    ],
                  )
                : Wrap(
                    spacing: 8,
                    children: List.generate(_searchController.brandList.length,
                        (index) {
                      var result = _searchController.brandList[index];
                      return ChoiceChip(
                        labelPadding: const EdgeInsets.all(2.0),
                        label: Text(result.name,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.7),
                                fontSize: getProportionateScreenWidth(13))),
                        selected: true,
                        selectedColor: Colors.grey.withOpacity(0.1),
                        onSelected: (value) {
                          print(result.brand.length);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => AllSearchProducts(
                                      productList: result.brand,
                                      id: result.id.toString(),
                                      searchType: result.name)));
                        },
                        // backgroundColor: color,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                      );
                    }),
                  )
          ],
        ),
      ),
    );
  }
}
