import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewHomeController extends GetxController {
  var isLoading = false.obs;
  List<TopLinkModel> topLinkList = List<TopLinkModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getTopLinkData();
    super.onInit();
  }

  getTopLinkData() {
    var list = [
      TopLinkModel(
          title: "60% OFF Everything", color: Colors.teal.withOpacity(0.3)),
      TopLinkModel(
          title: "All Offers",
          color: Colors.orange.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.deepOrange,
          )),
      TopLinkModel(
          title: "Top Ranking",
          color: Colors.blue.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.blue,
          )),
      TopLinkModel(
          title: "Top Brands",
          color: Colors.purpleAccent.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.purpleAccent,
          )),
      TopLinkModel(
          title: "New Arrival",
          color: Colors.cyanAccent.withOpacity(0.3),
          icon: Icon(
            Icons.settings,
            color: Colors.cyanAccent,
          )),
    ];

    topLinkList = list;
  }
}

class TopLinkModel {
  String title;
  Color color;
  Icon? icon;

  TopLinkModel({required this.title, required this.color, this.icon});
}
