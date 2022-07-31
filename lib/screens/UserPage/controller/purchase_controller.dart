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

  var isOrderStausLoading = false.obs;
  List<OrderStatusModel> statusList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusPendingList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusReciveList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusShippedList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusHoldList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusCompleteList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusCancelList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusRefundedList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusFailedList =
      List<OrderStatusModel>.empty(growable: true).obs;

  List<OrderStatusModel> statusDeletedList =
      List<OrderStatusModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getMyOrders();
    super.onInit();
  }

  getMyOrders() async {
    isOrderStausLoading(true);
    var tokenResult = await ApiService.getUserToken(
        userName: _userDataController.userName.value,
        password: _userDataController.password.value);
    if (tokenResult.runtimeType == int) {
      isOrderStausLoading(false);
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
        statusPendingList.clear();
        statusReciveList.clear();
        statusShippedList.clear();
        statusHoldList.clear();
        statusCompleteList.clear();
        statusCancelList.clear();
        statusRefundedList.clear();
        statusFailedList.clear();
        statusDeletedList.clear();
        statusList = result;

        statusList.forEach((element) {
          print(element.orderStatus);
          if (element.orderStatus == "Pending") {
            statusPendingList.add(element);
          } else if (element.orderStatus == "Received") {
            statusReciveList.add(element);
          } else if (element.orderStatus == "Shipped") {
            statusShippedList.add(element);
          } else if (element.orderStatus == "On Hold") {
            statusHoldList.add(element);
          } else if (element.orderStatus == "Completed") {
            statusCompleteList.add(element);
          } else if (element.orderStatus == "Canceled") {
            statusCancelList.add(element);
          } else if (element.orderStatus == "Refunded") {
            statusRefundedList.add(element);
          } else if (element.orderStatus == "Failed") {
            statusFailedList.add(element);
          } else if (element.orderStatus == "Deleted") {
            statusDeletedList.add(element);
          }
        });
      }
      isOrderStausLoading(false);
    }
  }
}
