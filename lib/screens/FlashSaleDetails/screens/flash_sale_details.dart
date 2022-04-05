import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/CommonData/common_data.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/ProductDetails/product_details.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:slide_countdown/slide_countdown.dart';

class FlashSaleDetails extends StatelessWidget {
  FlashSaleDetails({Key? key}) : super(key: key);
  static const String routeName = "/flashSaleDetails";
  final HomeController _homeController = Get.put(HomeController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Flash Sale"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: const Center(child: FaIcon(FontAwesomeIcons.share,)),
          )
        ],
      ),
      body: DefaultTabController(length: 3, child: Column(
        children: [
          Container(
            height: getProportionateScreenHeight(50),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.withOpacity(0.5))
              )
            ),
            child: TabBar(
              padding: EdgeInsets.all(0),
              labelPadding: EdgeInsets.all(0),
              unselectedLabelColor: Colors.black,
              indicatorColor: AllColors.mainColor,
              labelColor: AllColors.mainColor,
              labelStyle: TextStyle(
                fontSize: getProportionateScreenWidth(11)
              ),
              tabs: [
                Tab(text: "ongoing",icon: Text("${DateTime.now().hour}:00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: getProportionateScreenWidth(15)),),iconMargin: EdgeInsets.all(getProportionateScreenHeight(3)),),
                Tab(text: "coming soon",icon: Text("${DateTime.now().hour+1}:00",style: TextStyle(fontWeight: FontWeight.bold),),),
                Tab(text: "coming soon",icon: Text("${DateTime.now().hour+2}:00",style: TextStyle(fontWeight: FontWeight.bold),),),
              ],
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Image.asset("asset/images/category/flash_deal.jpg",height: getProportionateScreenHeight(100),width: double.infinity,fit: BoxFit.fill,),
                  SizedBox(height: getProportionateScreenHeight(5),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("ENDS IN",style: TextStyle(fontSize: getProportionateScreenWidth(11)),),
                      SizedBox(width: getProportionateScreenWidth(5),),
                      SlideCountdownSeparated(withDays: true,
                        height: getProportionateScreenHeight(15),
                        width: getProportionateScreenHeight(15),
                        textStyle: TextStyle(
                            fontSize: getProportionateScreenHeight(7),
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                            BorderRadius.circular(getProportionateScreenWidth(3))),
                        duration: Duration(hours: 00,minutes: DateTime.now().minute),
                      )
                    ],
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _homeController.flashSaleList.length,
                      itemBuilder: (context , index){
                      var result = _homeController.flashSaleList[index];
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, ProductDetails.routeName, arguments: result);
                        },
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: getProportionateScreenHeight(120),
                                    width: getProportionateScreenHeight(120),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(result.image[0])
                                      )
                                    ),
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(10),),
                                  Expanded(child: Column(
                                    children: <Widget>[
                                      const Text("Cos De BAHA Vitamin C Facial Serum (VM)-30ml"),
                                      Text(CommonData.takaSign+result.cutPrice.toString(),style: TextStyle(decoration: TextDecoration.lineThrough),),
                                      Text(CommonData.takaSign+" "+result.price.toString(),style: TextStyle(
                                        fontSize: getProportionateScreenWidth(15),fontWeight: FontWeight.bold,color: AllColors.mainColor
                                      ),),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: LinearPercentIndicator(
                                              lineHeight: 8.0,
                                              percent: double.parse(
                                                  (result.totalSold / 100)
                                                      .toStringAsFixed(1)),
                                              progressColor: Colors.orange,
                                            ),
                                          ),
                                          Expanded(flex: 1,child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(color: AllColors.mainColor),
                                              shape: BoxShape.circle
                                            ),
                                            child: Center(child: Padding(
                                              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
                                              child: Text("Buy",style: TextStyle(fontSize: getProportionateScreenWidth(12)),),
                                            )),
                                          ),)
                                        ],
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                  ),
                                  )
                                ],
                              ),
                            ),
                            Divider()
                          ],
                        ),
                      );
                  })
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
