import 'package:chardike/screens/SearchPage/screen/search_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../../CommonData/all_colors.dart';
import '../../../size_config.dart';
import '../controller/search_controller.dart';

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
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
          ),
          child: TextField(
            controller: _searchController.mainSearchTextController.value,
            onChanged: (value) {
              if (value.isEmpty) {
                _searchController.mainSearchShowType.value = false;
              }else{
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
          const Center(child: FaIcon(FontAwesomeIcons.search)),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
        child: Obx((){
          if(_searchController.mainSearchShowType.value){
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isTab?4:3,
                  crossAxisSpacing: getProportionateScreenWidth(5),
                  mainAxisSpacing: getProportionateScreenWidth(5),
                  childAspectRatio: isTab?aspt(getProportionateScreenWidth(420)):aspt(getProportionateScreenWidth(300)),
                ),
                itemCount: _searchController.filterProductList.value.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var result = _searchController.filterProductList.value[
                  (_searchController.filterProductList.value.length - 1) -
                      index];
                  return InkWell(
                    onTap: () {
                      // var data = _homeController.queryProductList[index];
                      // var model = ProductModel(
                      //     id: data.id, productImage: data.featureImage, createdAt: createdAt, updatedAt: updatedAt, isActive: isActive, productName: productName, slug: slug, meta: meta, shortDescriptions: shortDescriptions, longDescription: longDescription, alterText: alterText, sku: sku, upc: upc, featureImage: featureImage, regularPrice: regularPrice, newPrice: newPrice, inventory: inventory, isStock: isStock, brand: brand, country: country, category: category, subCategory: subCategory)
                      // Navigator.pushNamed(
                      //     context, ProductDetails.routeName,
                      //     arguments:
                      //     _homeController.queryProductList[index]);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.05)),
                      padding: EdgeInsets.all(
                          getProportionateScreenWidth(8)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: isTab?getProportionateScreenWidth(110):getProportionateScreenWidth(90),
                            width: isTab?getProportionateScreenWidth(110):getProportionateScreenWidth(90),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.grey
                                        .withOpacity(0.3))
                            ),
                            child: Stack(
                              children: <Widget>[
                                Center(
                                  child: Image.network(
                                    result.featureImage,
                                    fit: BoxFit.cover,
                                    height: isTab?getProportionateScreenWidth(105):getProportionateScreenWidth(85),
                                    width: isTab?getProportionateScreenWidth(105):getProportionateScreenWidth(85),
                                  ),
                                ),
                                Positioned(
                                    right: 0,
                                    child: Container(
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
                                            "-10%",
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
                          Text(
                            result.productName.toString(),
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize:
                                getProportionateScreenWidth(12)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Text(
                            "₺ " + result.newPrice.toString() + " ",
                            style: TextStyle(
                                color: AllColors.mainColor,
                                fontSize:
                                getProportionateScreenWidth(13)),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(5),
                          ),
                          Row(
                            children: [
                              RatingBarIndicator(
                                rating: 4.4,
                                itemBuilder: (context, index) =>
                                const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize:
                                getProportionateScreenWidth(10),
                                direction: Axis.horizontal,
                              ),
                              Text(
                                "(34)",
                                style: TextStyle(
                                    fontSize:
                                    getProportionateScreenWidth(
                                        10)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }else{
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
                    children: List.generate(_searchController.brandList.length,
                            (index) {
                          var result = _searchController.brandList[index];
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Text(
                                result.name,
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
                    children: List.generate(_searchController.categoryList.length,
                            (index) {
                          var result = _searchController.categoryList[index];
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Text(
                                result.categoryName.toString(),
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
                  const Text(
                    "Country",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(5),
                  ),
                  Wrap(
                    spacing: 8,
                    children: List.generate(_searchController.countryList.length,
                            (index) {
                          var result = _searchController.countryList[index];
                          return ChoiceChip(
                            labelPadding: const EdgeInsets.all(2.0),
                            label: Text(
                                result.name.toString(),
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
            );
          }
        })
      ),
    );
  }
}
