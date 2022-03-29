import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/HomePage/model/product_model.dart';
import 'package:chardike/screens/ProductDetails/controller/product_details_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key,required this.productModel}) : super(key: key);
  ProductModel productModel;
  final ProductDetailsController _detailsController =Get.put(ProductDetailsController());
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: true,
                    expandedHeight: getProportionateScreenHeight(310+kToolbarHeight),
                    flexibleSpace: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          AppBar(
                            actions: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                                child: const FaIcon(FontAwesomeIcons.home,color: Colors.grey,),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
                                child: const FaIcon(FontAwesomeIcons.cartShopping,color: Colors.grey,),
                              ),
                            ],
                          ),
                          Container(
                            height: getProportionateScreenHeight(310),
                            margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(7))
                            ),
                            child: Stack(
                              children: [
                                CarouselSlider.builder(
                                  itemCount: productModel.image.length,
                                  options: CarouselOptions(
                                    height: getProportionateScreenHeight(300),
                                    viewportFraction: 1,
                                    initialPage: 0,
                                    onPageChanged: (value , reason){
                                      _detailsController.imageIndex.value = value+1;
                                    },
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlayCurve: Curves.linear,
                                    enlargeCenterPage: true,
                                    scrollDirection: Axis.horizontal,
                                  ),
                                  itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                          image: DecorationImage(
                                            image: AssetImage(productModel.image[itemIndex]),fit: BoxFit.fill
                                          )
                                        ),
                                        width: double.infinity,
                                      ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: SizedBox(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: getProportionateScreenWidth(50),
                                          height: getProportionateScreenWidth(20),
                                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                            color: Colors.grey
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              Obx(()=>Text(_detailsController.imageIndex.value.toString())),
                                              Text("/"),
                                              Text(productModel.image.length.toString())
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
                        ],
                      ),
                    ),
                  ),
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: false,
                    primary: false,
                    elevation: 0.0,
                    toolbarHeight: kToolbarHeight,
                    title: DefaultTabController(
                      length: 4,
                      child: TabBar(
                          //indicatorColor: Colors.transparent,
                          labelColor: AllColors.mainColor,
                          unselectedLabelColor: Colors.grey,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: DotIndicator(
                          color: AllColors.mainColor,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelStyle: TextStyle(
                          color: AllColors.mainColor
                        ),
                        isScrollable: true,
                          tabs: [
                        Tab(text: "Description",),
                        Tab(text: "Product Reviews"),
                        Tab(text: "Product Inquiry"),
                        Tab(text: "Shipping/Return/Exchange"),
                      ]),
                    ),),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return index == 0?Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text("₺ "+productModel.price.toString(),style: TextStyle(fontSize: getProportionateScreenWidth(16),fontWeight: FontWeight.bold),),
                                subtitle: RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: "₺"+productModel.cutPrice.toString(),
                                      style: TextStyle(decoration: TextDecoration.lineThrough,color: Colors.black.withOpacity(0.6)),),
                                      TextSpan(text: "  -"+productModel.discount.toString()+"%"),
                                    ],
                                  ),
                                ),
                                trailing: FaIcon(FontAwesomeIcons.shareNodes),
                                contentPadding: EdgeInsets.all(0),
                              ),
                              Text(productModel.title,style: TextStyle(
                                fontSize: getProportionateScreenWidth(18)
                              ),),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: productModel.rating,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    itemCount: 5,
                                    itemSize: getProportionateScreenWidth(15),
                                    direction: Axis.horizontal,
                                  ),
                                  SizedBox(width: getProportionateScreenWidth(5),),
                                  Text(productModel.rating.toString())
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(20),),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Shipping"),
                                  SizedBox(width: getProportionateScreenWidth(15),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Free Shipping"),
                                      SizedBox(height: getProportionateScreenHeight(5),),
                                      Row(
                                        children: <Widget>[
                                          Text("Shipping Form"),
                                          SizedBox(width: getProportionateScreenWidth(15),),
                                          Text("Mainland Korea")
                                        ],
                                      ),
                                      SizedBox(height: getProportionateScreenHeight(5),),
                                      Row(
                                        children: <Widget>[
                                          Text("Shipping Fee"),
                                          SizedBox(width: getProportionateScreenWidth(20),),
                                          Text("90-120")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(height: getProportionateScreenHeight(20),),
                              Row(
                                children: <Widget>[
                                  Text("Quantity"),
                                  SizedBox(width: getProportionateScreenWidth(20),),
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: (){
                                          if(_detailsController.quantityItem.value > 1){
                                            _detailsController.quantityItem.value--;
                                          }
                                        },
                                        child: Container(height: getProportionateScreenWidth(25),
                                        width: getProportionateScreenWidth(25),
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(getProportionateScreenWidth(5)),
                                                bottomLeft: Radius.circular(getProportionateScreenWidth(5))
                                            )
                                          ),
                                          child: Center(child: Text("-")),
                                        ),
                                      ),
                                      Container(height: getProportionateScreenWidth(25),
                                        width: getProportionateScreenWidth(45),
                                        decoration: const BoxDecoration(
                                            border: Border.symmetric(horizontal:BorderSide(
                                                color: Colors.grey,
                                            ))
                                        ),
                                        child: Center(child: Obx(()=>Text(_detailsController.quantityItem.value.toString()))),
                                      ),
                                      InkWell(
                                        onTap: (){
                                          if(_detailsController.quantityItem.value < 5){
                                            _detailsController.quantityItem.value++;
                                          }
                                        },
                                        child: Container(height: getProportionateScreenWidth(25),
                                          width: getProportionateScreenWidth(25),
                                          decoration: BoxDecoration(
                                              border: Border.all(color: Colors.grey),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(getProportionateScreenWidth(5)),
                                                  bottomRight: Radius.circular(getProportionateScreenWidth(5))
                                              )
                                          ),
                                          child: Center(child: const Text("+")),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ):index == 1?Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(20),),
                              Text("Product Review",style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(10),),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: _detailsController.reviewList.length,
                                  itemBuilder: (context , index){
                                  var result = _detailsController.reviewList[index];
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            height: getProportionateScreenHeight(50),
                                            width: getProportionateScreenHeight(50),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.grey.withOpacity(0.5)
                                            ),
                                          ),
                                          SizedBox(width: getProportionateScreenWidth(10),),
                                          Expanded(child: Column(
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Text(result.name,style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                  ),),
                                                  Text("${result.reviewDate.day}/${result.reviewDate.month}}/${result.reviewDate.year}")
                                                ],
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(3),),
                                              RatingBarIndicator(
                                                rating: result.rating.toDouble(),
                                                itemBuilder: (context, index) => const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                itemCount: 5,
                                                itemSize: getProportionateScreenWidth(15),
                                                direction: Axis.horizontal,
                                              ),
                                              SizedBox(height: getProportionateScreenHeight(3),),
                                              Text(result.reviewMessage)
                                            ],
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                          ))
                                        ],
                                      ),
                                    );
                                },

                              )
                            ],
                          ),
                        ):index == 2?Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(20),),
                              Text("SHIPPING & DELIVERY",style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(10),),
                              const Text("প্রোডাক্ট নষ্ট কিংবা ভাঙা হলে",style: TextStyle(
                                fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(3),),
                              const Text("প্রোডাক্ট ডেলিভারি করার সময় যদি ভাঙা কিংবা ড্যামেজ অবস্থায় পেয়ে থাকেন তাহলে অবশ্যই ডেলিভারিম্যান সামনে থাকা অবস্থায় আমাদেরকে কল করে জানাতে হবে। আমাদেরকে কল করতে পারেন 01790 270066 এই নাম্বার এ ।কোন কারণে আপনি নিজে প্রোডাক্ট রিসিভ না করতে পারলে যিনি আপনার পরিবর্তে প্রোডাক্ট টি বুঝে নিবেন তাকে অবশ্যই এই ব্যাপারে অবহিত করবেন ।ডেলিভারি ম্যান চলে যাবার পর এই ধরনের কোন অভিযোগ গ্রহণযোগ্য হবে না ।"),
                              SizedBox(height: getProportionateScreenHeight(10),),
                              const Text("ভুল প্রোডাক্ট কিংবা সংখ্যা ঠিক না হলে",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(3),),
                              const Text("প্রোডাক্ট রিসিভ করার সময় যদি আপনার অর্ডারকৃত অর্ডার সংখ্যা এবং রিসিভ করা প্রোডাক্ট এক না হয় তাহলে আমাদেরকে কল করে জানাতে হবে ডেলিভারিম্যান সামনে থাকা অবস্থায় ।আমরা মিসিং প্রোডাক্ট গুলো ৪৮-৭২ ঘন্টার মধ্যে আপনাকে পৌঁছে দেবো এবং এর জন্য আপনাকে অতিরিক্ত কোন ও ডেলিভারি চার্জ দিতে হবে না ।"),
                              SizedBox(height: getProportionateScreenHeight(10),),
                              const Text("প্রোডাক্ট রিটার্ন করতে চাইলে",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(3),),
                              const Text("প্রোডাক্ট রিসিভ করার সর্বোচ্চ ৭২ ঘন্টার মধ্যে প্রোডাক্টটি রিটার্ন করতে পারবেন যদি প্রোডাক্টে কোনও ফল্ট থাকে । সে ক্ষেত্রে আমাদেরকে অবশ্যই প্রোডাক্টটি ব্যবহারের ভিডিও কিংবা পিকচার পাঠাতে হবে।আপনার অভিযোগ গ্রহনের ১-২ কর্মদিবসের মধ্যে আমরা আপনার সাথে যোগাযোগ করবো এবং প্রোডাক্ট রিটার্ন, রিপ্লেসমেন্ট কিংবা টাকা ফেরত দেয়ার ব্যবস্থা নেব।"),
                              SizedBox(height: getProportionateScreenHeight(10),),
                              const Text("প্রোডাক্ট অর্ডার করার পর ক্যান্সেল করতে চাইলে",style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(3),),
                              const Text("প্রোডাক্ট অর্ডার করার পর ক্যান্সেল করতে চাইলে, যেদিন অর্ডার করেছেন সেদিন বিকাল ৫ টার পূর্বে আমাদের কে জানাতে হবে। প্রোডাক্ট আপনার এরিয়া কিংবা বাসায় নিচে গিয়ে ডেলিভারি ম্যান কল করার পর ক্যান্সেল করতে চাইলে সে ক্ষেত্রে ক্যান্সেলেশন চার্জ দিয়ে দিতে হবে । ( ঢাকার মধ্যে ৯০ টাকা, ঢাকার বাইরে ১২০ টাকা)।")
                            ],
                          ),
                        ):Padding(
                          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(height: getProportionateScreenHeight(20),),
                              Text("RELATED PRODUCT",style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15),
                                  fontWeight: FontWeight.bold
                              ),),
                              SizedBox(height: getProportionateScreenHeight(5),),
                              SizedBox(
                                height: getProportionateScreenHeight(220),
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: _homeController.productList.length,
                                  itemBuilder: (context , index){
                                    var result = _homeController.productList[index];
                                    return InkWell(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductDetails(productModel: result)));
                                      },
                                      child: Container(
                                        width: getProportionateScreenWidth(150),
                                        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                        decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey)
                                        ),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(result.image[0]),fit: BoxFit.fill
                                                  ),
                                                  borderRadius: BorderRadius.circular(getProportionateScreenWidth(5))
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(5),),
                                            Text(result.title,maxLines: 2,textAlign: TextAlign.start,style: TextStyle(
                                                fontSize: getProportionateScreenWidth(12)
                                            ),),
                                            SizedBox(height: getProportionateScreenHeight(5),),
                                            Row(
                                              children: [
                                                Text(
                                                  "₺ " + result.price.toString()+" ",
                                                  style: TextStyle(
                                                      color: AllColors.mainColor),
                                                ),
                                                Text(
                                                  "₺" + result.price.toString(),
                                                  style: TextStyle(
                                                      decoration: TextDecoration.lineThrough,
                                                      color: Colors.grey,fontSize: getProportionateScreenWidth(10)),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: getProportionateScreenHeight(5),),
                                            RatingBarIndicator(
                                              rating: result.rating,
                                              itemBuilder: (context, index) => const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                              ),
                                              itemCount: 5,
                                              itemSize: getProportionateScreenWidth(15),
                                              direction: Axis.horizontal,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      childCount: 4, // 1000 list items
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(10),
                  right: getProportionateScreenWidth(10),
                  top: getProportionateScreenWidth(10),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Colors.black,
                    width: 0.5
                  )
                )
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex:1,
                    child: Center(child: FaIcon(FontAwesomeIcons.heart)),
                  ),
                  Expanded(
                    flex: 4,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                              border: Border.all(color: AllColors.mainColor)
                          ),
                          child: TextButton.icon(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.cartShopping), label: Text("ADD To CART")))
                  ),
                  Expanded(
                    flex: 3,
                      child: Container(
                        height: getProportionateScreenHeight(40),
                        margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
                        decoration: BoxDecoration(
                          color: AllColors.mainColor,
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(5)),
                            border: Border.all(color: AllColors.mainColor)
                        ),
                        child: Center(child: Text("BUY NOW",style: TextStyle(
                          fontSize: getProportionateScreenWidth(15),
                          color: Colors.white
                        ),))
                      )
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
