import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/TopProduct/controller/top_product_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../CommonData/common_data.dart';
import '../../ProductDetails/product_details.dart';

class TopProductPage extends StatelessWidget {
  TopProductPage({Key? key}) : super(key: key);
  static const String routeName = "/top_product_page";
  final TopProductController _topProductController = Get.put(TopProductController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
                // Status bar color
                statusBarColor: AllColors.mainColor,
                // Status bar brightness (optional)
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
              backgroundColor: AllColors.mainColor,
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                "Top Products",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: false,
              actions: <Widget>[
                const Center(
                  child: Text(
                    "More",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(10),)
              ],
      ),
      body: DefaultTabController(
        length: 5,
        child: Column(
          children: <Widget>[
          Container(
            color: Colors.grey.withOpacity(0.1),
            padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5),horizontal: getProportionateScreenWidth(5)),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  TabItem(title: "Cleanser", image: "asset/images/shopping_beg.png", index: 0),
                  TabItem(title: "Cleanser", image: "asset/images/shopping_beg.png", index: 1),
                  TabItem(title: "Cleanser", image: "asset/images/shopping_beg.png", index: 2),
                  TabItem(title: "Cleanser", image: "asset/images/shopping_beg.png", index: 3),
                  TabItem(title: "Cleanser", image: "asset/images/shopping_beg.png", index: 4)
                ],
              ),
            )
          ),
            Expanded(child: ListView.builder(
                shrinkWrap: true,
                itemCount: _homeController.apiProductList.length,
                itemBuilder: (context , index){
                  var result = _homeController.apiProductList[index];
                  return InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, ProductDetails.routeName, arguments: result);
                    },
                    child: Column(
                      children: [
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(5),
                                horizontal: getProportionateScreenWidth(5)
                            ),
                            child: Row(
                              children: [
                                Container(
                                  height: getProportionateScreenHeight(120),
                                  width: getProportionateScreenHeight(120),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                      image: DecorationImage(
                                          image: AssetImage(result.featureImage),fit: BoxFit.fill
                                      )
                                  ),
                                ),
                                SizedBox(width: getProportionateScreenWidth(10),),
                                Expanded(child: SizedBox(
                                  height: getProportionateScreenHeight(120),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(result.name,style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: getProportionateScreenWidth(14)
                                      ),maxLines: 3,),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex : 3,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                                color: AllColors.mainColor.withOpacity(0.8)
                                              ),
                                                height: getProportionateScreenHeight(20),
                                              child: Center(child: Text("Monthly Sales: 119,018",style: TextStyle(fontSize: getProportionateScreenWidth(12),color: Colors.white),)),
                                            ),
                                          ),
                                          const Expanded(flex: 1, child: SizedBox())
                                        ],
                                      ),
                                      Text(CommonData.takaSign+" "+result.newPrice.toString(),style: TextStyle(color: AllColors.mainColor,fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                )),
                              ],
                            )),
                        Divider()
                      ],
                    ),
                  );
                }),)
          ],
        ),
      ),
    );
  }

  Widget TabItem({required String title ,required String image , required int index}){
    return InkWell(
      onTap: (){
        _topProductController.selectedItem.value = index;
      },
      child: Obx(()=>Container(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3)),
        width: getProportionateScreenWidth(80),
        height: getProportionateScreenHeight(80),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: _topProductController.selectedItem.value == index?AllColors.mainColor:Colors.transparent)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Image.asset("asset/images/shopping_beg.png",height: getProportionateScreenHeight(30),),
            SizedBox(height: getProportionateScreenHeight(5),),
            Text(title,style: TextStyle(fontSize: getProportionateScreenWidth(12)),textAlign: TextAlign.center,maxLines: 2,)
          ],
        ),
      ),)
    );
  }
}
