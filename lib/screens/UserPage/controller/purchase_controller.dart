import 'dart:math';

import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/UserPage/model/order_status_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../CommonData/user_data.dart';

class PurchaseController extends GetxController {
  var isLoading = false.obs;

  var tabIndex = 0.obs;
  final UserDataController _userDataController = Get.put(UserDataController());

  List<OrderStatusModel> statusList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusReciveList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusCancelList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusCompleteList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusOnTheWayList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusProcessingList =
      List<OrderStatusModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getMyOrders();
    super.onInit();
  }

  getMyOrders() async {
    var tokenResult = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (tokenResult.runtimeType == int) {
      // Fluttertoast.showToast(
      //     msg: "Error to set Location", toastLength: Toast.LENGTH_LONG);
      print("Error to get Refresh token");
    } else {
      Map d = tokenResult;
      var result = await ApiService.getOrderStatus(accessToken: d['access']);
      if (result.runtimeType == int) {
        Fluttertoast.showToast(msg: "Status get Error");
      } else {
        statusList.clear();
        statusReciveList.clear();
        statusProcessingList.clear();
        statusOnTheWayList.clear();
        statusCompleteList.clear();
        statusCancelList.clear();
        statusList = result;
        print(statusList.length);
        statusList.forEach((element) {
          if (element.orderStatus == "Order Received") {
            statusReciveList.add(element);
          } else if (element.orderStatus == "Order Processing") {
            statusProcessingList.add(element);
          } else if (element.orderStatus == "On the way") {
            statusOnTheWayList.add(element);
          } else if (element.orderStatus == "Order Completed") {
            statusCompleteList.add(element);
          } else if (element.orderStatus == "Order Canceled") {
            statusCancelList.add(element);
          }
        });
      }
    }
  }
}
