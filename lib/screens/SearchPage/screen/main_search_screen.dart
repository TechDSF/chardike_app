import 'package:chardike/CommonData/common_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';
import '../../ProductDetails/product_details.dart';
import '../controller/search_controller.dart';
import 'all_search_products.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  static const String routeName = "/search_screen";
  final SearchController _searchController = Get.put(SearchController());

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
        title: Container(
          height: getProportionateScreenHeight(40),
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: AllColors.mainColor),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            controller: _searchController.mainSearchTextController.value,
            onChanged: (value) {
              if (value.isEmpty) {
                _searchController.mainSearchShowType.value = false;
              } else {
                _searchController.mainSearchShowType.value = true;
                _searchController.filterProduct(value);
              }
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
          Center(
              child: FaIcon(
            FontAwesomeIcons.search,
            color: AllColors.mainColor,
          )),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Obx(() {
            if (_searchController.mainSearchShowType.value) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: isTab ? 3 : 2,
                      childAspectRatio: isTab
                          ? CommonData.aspactRatio(
                              height: getProportionateScreenHeight(350),
                              context: context,
                              crossAxisCount: 3,
                              crossAxisSpacing: 0)
                          : CommonData.aspactRatio(
                              height: getProportionateScreenHeight(260),
                              context: context,
                              crossAxisCount: 2,
                              crossAxisSpacing: 0)),
                  itemCount: _searchController.filterProductList.value.length,
                  shrinkWrap: true,
                  //physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var result =
                        _searchController.filterProductList.value[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ProductDetails.routeName,
                              arguments: {
                                "type": true,
                                "ds": "0",
                                "product": result
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.15),
                              border: Border.all(
                                  color: Colors.grey.withOpacity(0.1)),
                              borderRadius: BorderRadius.circular(
                                  getProportionateScreenWidth(5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: isTab
                                    ? getProportionateScreenHeight(230)
                                    : getProportionateScreenHeight(160),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            getProportionateScreenWidth(5)),
                                        topRight: Radius.circular(
                                            getProportionateScreenWidth(5))),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(result.featureImage),
                                        fit: BoxFit.fill)),
                                child: Stack(
                                  children: <Widget>[
                                    Positioned(
                                        right: 0,
                                        child: result.reviews.isEmpty
                                            ? SizedBox()
                                            : Container(
                                                height:
                                                    getProportionateScreenWidth(
                                                        20),
                                                width:
                                                    getProportionateScreenWidth(
                                                        45),
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(
                                                            getProportionateScreenWidth(
                                                                10)),
                                                        bottomLeft: Radius.circular(
                                                            getProportionateScreenWidth(
                                                                10)))),
                                                child: Center(
                                                    child: Text(
                                                  "${CommonData.calculateRating(result.reviews)}",
                                                  style: TextStyle(
                                                      fontSize:
                                                          getProportionateScreenWidth(
                                                              10),
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                              ))
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(10),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      result.productName.toString(),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize:
                                              getProportionateScreenHeight(12)),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              getProportionateScreenHeight(5)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "₺ " +
                                                result.sellingPrice.toString() +
                                                " ",
                                            style: TextStyle(
                                                color: AllColors.mainColor),
                                          ),
                                          Text(
                                            "₺" +
                                                result.regularPrice.toString(),
                                            style: TextStyle(
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Colors.grey,
                                                fontSize:
                                                    getProportionateScreenHeight(
                                                        10)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: getProportionateScreenHeight(5),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return SingleChildScrollView(
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
                      children: List.generate(
                          _searchController.brandList.length, (index) {
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
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    const Text(
                      "Category",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                          _searchController.categoryList.length, (index) {
                        var result = _searchController.categoryList[index];
                        return ChoiceChip(
                          labelPadding: const EdgeInsets.all(2.0),
                          label: Text(result.categoryName.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: getProportionateScreenWidth(13))),
                          selected: true,
                          selectedColor: Colors.grey.withOpacity(0.1),
                          onSelected: (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllSearchProducts(
                                        productList: [],
                                        id: result.id.toString(),
                                        searchType:
                                            result.categoryName.toString())));
                          },
                          // backgroundColor: color,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        );
                      }),
                    ),
                    const Text(
                      "Country",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(5),
                    ),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                          _searchController.countryList.length, (index) {
                        var result = _searchController.countryList[index];
                        return ChoiceChip(
                          labelPadding: const EdgeInsets.all(2.0),
                          label: Text(result.name.toString(),
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: getProportionateScreenWidth(13))),
                          selected: true,
                          selectedColor: Colors.grey.withOpacity(0.1),
                          onSelected: (value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => AllSearchProducts(
                                        productList: result.country,
                                        id: result.id.toString(),
                                        searchType: result.name.toString())));
                          },
                          // backgroundColor: color,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                        );
                      }),
                    )
                  ],
                ),
              );
            }
          })),
    );
  }
}
