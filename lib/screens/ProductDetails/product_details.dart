import 'package:carousel_slider/carousel_slider.dart';
import 'package:chardike/screens/CartPage/controller/cart_controller.dart';
import 'package:chardike/screens/HomePage/controller/home_controller.dart';
import 'package:chardike/screens/ProductDetails/components/widgets/fappbar.dart';
import 'package:chardike/screens/ProductDetails/controller/product_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:rect_getter/rect_getter.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import '../../CommonData/all_colors.dart';
import '../../CommonData/common_data.dart';
import '../../size_config.dart';
import '../CartPage/model/cart_model.dart';
import '../CartPage/screen/cart_screen.dart';
import '../HomePage/model/product_model.dart';


class ProductDetails extends StatefulWidget {
  static const String routeName = "/product_details";
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetails>
    with SingleTickerProviderStateMixin {
  bool isCollapsed = false;
  late AutoScrollController scrollController;
  late TabController tabController;
  final ProductDetailsController _detailsController =
      Get.put(ProductDetailsController());
  final HomeController _homeController = Get.put(HomeController());
  final CartController _cartController = Get.put(CartController());

  final listViewKey = RectGetter.createGlobalKey();
  Map<int, dynamic> itemKeys = {};

  // prevent animate when press on tab bar
  bool pauseRectGetterIndex = false;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    scrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    tabController.dispose();
    super.dispose();
  }

  List<int> getVisibleItemsIndex() {
    Rect? rect = RectGetter.getRectFromKey(listViewKey);
    List<int> items = [];
    if (rect == null) return items;
    itemKeys.forEach((index, key) {
      Rect? itemRect = RectGetter.getRectFromKey(key);
      if (itemRect == null) return;
      if (itemRect.top > rect.bottom) return;
      if (itemRect.bottom < rect.top) return;
      items.add(index);
    });
    return items;
  }

  void onCollapsed(bool value) {
    if (this.isCollapsed == value) return;
    setState(() => this.isCollapsed = value);
  }

  bool onScrollNotification(ScrollNotification notification) {
    if (pauseRectGetterIndex) return true;
    int lastTabIndex = tabController.length - 1;
    List<int> visibleItems = getVisibleItemsIndex();

    bool reachLastTabIndex = visibleItems.isNotEmpty &&
        visibleItems.length <= 2 &&
        visibleItems.last == lastTabIndex;
    if (reachLastTabIndex) {
      tabController.animateTo(lastTabIndex);
    } else if (visibleItems.isNotEmpty) {
      int sumIndex = visibleItems.reduce((value, element) => value + element);
      int middleIndex = sumIndex ~/ visibleItems.length;
      if (tabController.index != middleIndex)
        tabController.animateTo(middleIndex);
    }
    return false;
  }

  void animateAndScrollTo(int index) {
    pauseRectGetterIndex = true;
    tabController.animateTo(index);
    scrollController
        .scrollToIndex(index, preferPosition: AutoScrollPosition.begin)
        .then((value) => pauseRectGetterIndex = false);
  }

  @override
  Widget build(BuildContext context) {
    final productModel =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        height: getProportionateScreenWidth(65),
        padding: EdgeInsets.all(
          getProportionateScreenWidth(10),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            border:
            Border(top: BorderSide(color: Colors.black.withOpacity(0.4), width: 0.5))),
        child: Row(
          children: <Widget>[
            const Expanded(
              flex: 1,
              child: Center(child: FaIcon(FontAwesomeIcons.heart,color: Colors.grey,)),
            ),
            Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () {
                    try {
                      _cartController.cartList.add(CartModel(
                          title: productModel.title,
                          image: productModel.image[0],
                          quantity:
                          _detailsController.quantityItem.value,
                          price: productModel.price,
                          totalPrice:
                          _detailsController.quantityItem.value *
                              productModel.price));
                    } finally {
                      // TODO
                      _detailsController
                          .isHaveCart.value = _cartController.cartList
                          .where((element) =>
                      element.title == productModel.title)
                          .isEmpty
                          ? false
                          : true;
                      Fluttertoast.showToast(
                          msg: "Added Successfully",
                          toastLength: Toast.LENGTH_LONG);
                    }
                  },
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(3),vertical: getProportionateScreenWidth(7)),
                      margin: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(5)),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(5)),
                          border:
                          Border.all(color: AllColors.mainColor)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CommonData.icon(
                              icon: "asset/icons/cart.png",
                              color: Colors.blue),
                          SizedBox(
                            width: getProportionateScreenWidth(5),
                          ),
                          Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize:
                                getProportionateScreenWidth(13)),
                          )
                        ],
                      )),
                )
            ),
            Expanded(
                flex: 3,
                child: Container(
                    height: getProportionateScreenHeight(40),
                    margin: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(5)),
                    decoration: BoxDecoration(
                        color: AllColors.mainColor,
                        borderRadius: BorderRadius.circular(
                            getProportionateScreenWidth(5)),
                        border: Border.all(color: AllColors.mainColor)),
                    child: Center(
                        child: Text(
                          "BUY NOW",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(13),
                              color: Colors.white),
                        ))))
          ],
        ),
      ),
      body: SafeArea(
        child: RectGetter(
          key: listViewKey,
          child: NotificationListener<ScrollNotification>(
            child: buildSliverScrollView(productModel: productModel),
            onNotification: onScrollNotification,
          ),
        ),
      ),
    );
  }

  Widget buildSliverScrollView({required ProductModel productModel}) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: true,
          expandedHeight: getProportionateScreenHeight(310 + kToolbarHeight),
          flexibleSpace: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                AppBar(
                  actions: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(20)),
                      child: Center(
                          child: InkWell(
                            onTap: (){

                            },
                            child: CommonData.icon(
                                icon: "asset/icons/home.png",
                                color: Colors.grey),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          right: getProportionateScreenWidth(20)),
                      child: Center(
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, CartScreen.routeName);
                              },
                              child: CommonData.icon(
                                  icon: "asset/icons/cart.png",
                                  color: Colors.grey))),
                    ),
                  ],
                ),
                Container(
                  height: getProportionateScreenHeight(310),
                  margin: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(10)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          getProportionateScreenWidth(7))),
                  child: Stack(
                    children: [
                      CarouselSlider.builder(
                        itemCount: productModel.image.length,
                        options: CarouselOptions(
                          height: getProportionateScreenHeight(300),
                          viewportFraction: 1,
                          initialPage: 0,
                          onPageChanged: (value, reason) {
                            _detailsController.imageIndex.value =
                                value + 1;
                          },
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlayCurve: Curves.linear,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                        ),
                        itemBuilder: (BuildContext context,
                            int itemIndex, int pageViewIndex) =>
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      getProportionateScreenWidth(10)),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          productModel.image[itemIndex]),
                                      fit: BoxFit.fill)),
                              width: double.infinity,
                            ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Container(
                                width:
                                getProportionateScreenWidth(50),
                                height:
                                getProportionateScreenWidth(20),
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                    getProportionateScreenWidth(
                                        5)),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(
                                            10)),
                                    color: Colors.grey),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Obx(() => Text(_detailsController
                                        .imageIndex.value
                                        .toString())),
                                    Text("/"),
                                    Text(productModel.image.length
                                        .toString())
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
          title: TabBar(
            labelColor: AllColors.mainColor,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: DotIndicator(
              color: AllColors.mainColor,
              distanceFromCenter: 16,
              radius: 3,
              paintingStyle: PaintingStyle.fill,
            ),
            isScrollable: true,
            controller: tabController,
            tabs: const [
              Tab(
                text: "Description",
              ),
              Tab(text: "Product Reviews"),
              Tab(text: "Product Inquiry"),
              Tab(text: "Shipping/Return/Exchange"),
            ],
            onTap: (index) => animateAndScrollTo(index),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              itemKeys[index] = RectGetter.createGlobalKey();
              return index == 0
                  ? RectGetter(
                      key: itemKeys[index],
                      child: AutoScrollTag(
                        key: ValueKey(index),
                        index: index,
                        controller: scrollController,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  CommonData.takaSign +
                                      " " +
                                      productModel.price.toString(),
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(16),
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: RichText(
                                  text: TextSpan(
                                    text: '',
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: CommonData.takaSign +
                                            productModel.cutPrice.toString(),
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color:
                                                Colors.black.withOpacity(0.6)),
                                      ),
                                      TextSpan(
                                          text: "  -" +
                                              productModel.discount.toString() +
                                              "%"),
                                    ],
                                  ),
                                ),
                                trailing: Icon(Icons.share),
                                contentPadding: EdgeInsets.all(0),
                              ),
                              Text(
                                productModel.title,
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18)),
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(5),
                              ),
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
                                  SizedBox(
                                    width: getProportionateScreenWidth(5),
                                  ),
                                  Text(productModel.rating.toString())
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Shipping"),
                                  SizedBox(
                                    width: getProportionateScreenWidth(15),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text("Free Shipping"),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Shipping Form"),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(15),
                                          ),
                                          Text("Mainland Korea")
                                        ],
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text("Shipping Fee"),
                                          SizedBox(
                                            width:
                                                getProportionateScreenWidth(20),
                                          ),
                                          Text("90-120")
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: getProportionateScreenHeight(20),
                              ),
                              Row(
                                children: <Widget>[
                                  Text("Quantity"),
                                  SizedBox(
                                    width: getProportionateScreenWidth(20),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height:
                                              getProportionateScreenWidth(25),
                                          width:
                                              getProportionateScreenWidth(25),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      getProportionateScreenWidth(
                                                          5)),
                                                  bottomLeft: Radius.circular(
                                                      getProportionateScreenWidth(
                                                          5)))),
                                          child: Center(child: Text("-")),
                                        ),
                                      ),
                                      Container(
                                        height: getProportionateScreenWidth(25),
                                        width: getProportionateScreenWidth(45),
                                        decoration: const BoxDecoration(
                                            border: Border.symmetric(
                                                horizontal: BorderSide(
                                          color: Colors.grey,
                                        ))),
                                        child: Center(child: Text("dfjk")),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height:
                                              getProportionateScreenWidth(25),
                                          width:
                                              getProportionateScreenWidth(25),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      getProportionateScreenWidth(
                                                          5)),
                                                  bottomRight: Radius.circular(
                                                      getProportionateScreenWidth(
                                                          5)))),
                                          child: Center(child: const Text("+")),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : index == 1
                      ? RectGetter(
                          key: itemKeys[index],
                          child: AutoScrollTag(
                            key: ValueKey(index),
                            index: index,
                            controller: scrollController,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: getProportionateScreenWidth(15)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: getProportionateScreenHeight(20),
                                  ),
                                  Text(
                                    "Product Review",
                                    style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: getProportionateScreenHeight(10),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        _detailsController.reviewList.length,
                                    itemBuilder: (context, index) {
                                      var result =
                                          _detailsController.reviewList[index];
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical:
                                                getProportionateScreenHeight(
                                                    10)),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height:
                                                  getProportionateScreenHeight(
                                                      50),
                                              width:
                                                  getProportionateScreenHeight(
                                                      50),
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.grey
                                                      .withOpacity(0.5)),
                                            ),
                                            SizedBox(
                                              width:
                                                  getProportionateScreenWidth(
                                                      10),
                                            ),
                                            Expanded(
                                                child: Column(
                                              children: <Widget>[
                                                Row(
                                                  children: [
                                                    Text(
                                                      result.name,
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        "${result.reviewDate.day}/${result.reviewDate.month}}/${result.reviewDate.year}")
                                                  ],
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                ),
                                                SizedBox(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          3),
                                                ),
                                                RatingBarIndicator(
                                                  rating:
                                                      result.rating.toDouble(),
                                                  itemBuilder:
                                                      (context, index) =>
                                                          const Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  itemCount: 5,
                                                  itemSize:
                                                      getProportionateScreenWidth(
                                                          15),
                                                  direction: Axis.horizontal,
                                                ),
                                                SizedBox(
                                                  height:
                                                      getProportionateScreenHeight(
                                                          3),
                                                ),
                                                Text(result.reviewMessage)
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ))
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : index == 2
                          ? RectGetter(
                              key: itemKeys[index],
                              child: AutoScrollTag(
                                key: ValueKey(index),
                                index: index,
                                controller: scrollController,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      Text(
                                        "SHIPPING & DELIVERY",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      const Text(
                                        "প্রোডাক্ট নষ্ট কিংবা ভাঙা হলে",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(3),
                                      ),
                                      const Text(
                                          "প্রোডাক্ট ডেলিভারি করার সময় যদি ভাঙা কিংবা ড্যামেজ অবস্থায় পেয়ে থাকেন তাহলে অবশ্যই ডেলিভারিম্যান সামনে থাকা অবস্থায় আমাদেরকে কল করে জানাতে হবে। আমাদেরকে কল করতে পারেন 01790 270066 এই নাম্বার এ ।কোন কারণে আপনি নিজে প্রোডাক্ট রিসিভ না করতে পারলে যিনি আপনার পরিবর্তে প্রোডাক্ট টি বুঝে নিবেন তাকে অবশ্যই এই ব্যাপারে অবহিত করবেন ।ডেলিভারি ম্যান চলে যাবার পর এই ধরনের কোন অভিযোগ গ্রহণযোগ্য হবে না ।"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      const Text(
                                        "ভুল প্রোডাক্ট কিংবা সংখ্যা ঠিক না হলে",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(3),
                                      ),
                                      const Text(
                                          "প্রোডাক্ট রিসিভ করার সময় যদি আপনার অর্ডারকৃত অর্ডার সংখ্যা এবং রিসিভ করা প্রোডাক্ট এক না হয় তাহলে আমাদেরকে কল করে জানাতে হবে ডেলিভারিম্যান সামনে থাকা অবস্থায় ।আমরা মিসিং প্রোডাক্ট গুলো ৪৮-৭২ ঘন্টার মধ্যে আপনাকে পৌঁছে দেবো এবং এর জন্য আপনাকে অতিরিক্ত কোন ও ডেলিভারি চার্জ দিতে হবে না ।"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      const Text(
                                        "প্রোডাক্ট রিটার্ন করতে চাইলে",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(3),
                                      ),
                                      const Text(
                                          "প্রোডাক্ট রিসিভ করার সর্বোচ্চ ৭২ ঘন্টার মধ্যে প্রোডাক্টটি রিটার্ন করতে পারবেন যদি প্রোডাক্টে কোনও ফল্ট থাকে । সে ক্ষেত্রে আমাদেরকে অবশ্যই প্রোডাক্টটি ব্যবহারের ভিডিও কিংবা পিকচার পাঠাতে হবে।আপনার অভিযোগ গ্রহনের ১-২ কর্মদিবসের মধ্যে আমরা আপনার সাথে যোগাযোগ করবো এবং প্রোডাক্ট রিটার্ন, রিপ্লেসমেন্ট কিংবা টাকা ফেরত দেয়ার ব্যবস্থা নেব।"),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(10),
                                      ),
                                      const Text(
                                        "প্রোডাক্ট অর্ডার করার পর ক্যান্সেল করতে চাইলে",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(3),
                                      ),
                                      const Text(
                                          "প্রোডাক্ট অর্ডার করার পর ক্যান্সেল করতে চাইলে, যেদিন অর্ডার করেছেন সেদিন বিকাল ৫ টার পূর্বে আমাদের কে জানাতে হবে। প্রোডাক্ট আপনার এরিয়া কিংবা বাসায় নিচে গিয়ে ডেলিভারি ম্যান কল করার পর ক্যান্সেল করতে চাইলে সে ক্ষেত্রে ক্যান্সেলেশন চার্জ দিয়ে দিতে হবে । ( ঢাকার মধ্যে ৯০ টাকা, ঢাকার বাইরে ১২০ টাকা)।")
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : RectGetter(
                              key: itemKeys[index],
                              child: AutoScrollTag(
                                key: ValueKey(index),
                                index: index,
                                controller: scrollController,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          getProportionateScreenWidth(15)),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(20),
                                      ),
                                      Text(
                                        "RELATED PRODUCT",
                                        style: TextStyle(
                                            fontSize:
                                                getProportionateScreenWidth(15),
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: getProportionateScreenHeight(5),
                                      ),
                                      SizedBox(
                                        height:
                                            getProportionateScreenHeight(220),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: _homeController
                                              .productList.length,
                                          itemBuilder: (context, index) {
                                            var result = _homeController
                                                .productList[index];
                                            return InkWell(
                                              onTap: () {},
                                              child: Container(
                                                width:
                                                    getProportionateScreenWidth(
                                                        150),
                                                padding: EdgeInsets.all(
                                                    getProportionateScreenWidth(
                                                        8)),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.grey)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Expanded(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    result.image[
                                                                        0]),
                                                                fit: BoxFit
                                                                    .fill),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        getProportionateScreenWidth(
                                                                            5))),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Text(
                                                      result.title,
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: TextStyle(
                                                          fontSize:
                                                              getProportionateScreenWidth(
                                                                  12)),
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          "₺ " +
                                                              result.price
                                                                  .toString() +
                                                              " ",
                                                          style: TextStyle(
                                                              color: AllColors
                                                                  .mainColor),
                                                        ),
                                                        Text(
                                                          "₺" +
                                                              result.price
                                                                  .toString(),
                                                          style: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .lineThrough,
                                                              color:
                                                                  Colors.grey,
                                                              fontSize:
                                                                  getProportionateScreenWidth(
                                                                      10)),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          getProportionateScreenHeight(
                                                              5),
                                                    ),
                                                    RatingBarIndicator(
                                                      rating: result.rating,
                                                      itemBuilder:
                                                          (context, index) =>
                                                              const Icon(
                                                        Icons.star,
                                                        color: Colors.amber,
                                                      ),
                                                      itemCount: 5,
                                                      itemSize:
                                                          getProportionateScreenWidth(
                                                              15),
                                                      direction:
                                                          Axis.horizontal,
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
                                ),
                              ),
                            );
            },
            childCount: 4, // 1000 list items
          ),
        ),
      ],
    );
  }

  SliverAppBar buildAppBar({required ProductModel productModel}) {
    return FAppBar(
      context: context,
      productModel: productModel,
      detailsController: _detailsController,
      scrollController: scrollController,
      expandedHeight: getProportionateScreenWidth(400),
      collapsedHeight: getProportionateScreenWidth(50),
      isCollapsed: isCollapsed,
      onCollapsed: onCollapsed,
      tabController: tabController,
      onTap: (index) => animateAndScrollTo(index),
    );
  }
}
