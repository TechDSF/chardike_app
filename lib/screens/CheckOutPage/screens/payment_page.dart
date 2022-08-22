import 'dart:io';

import 'package:chardike/screens/CheckOutPage/screens/order_confirm.dart';
import 'package:chardike/screens/CheckOutPage/screens/payment_failed.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../Service/ApiService/api_components.dart';

class PaymentPage extends StatefulWidget {
  PaymentPage({Key? key, required this.url}) : super(key: key);
  String url;

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  var progressValue = true.obs;
  late WebViewController controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text("Payment Method"),
      ),
      body: Center(
          child: WebView(
        onWebViewCreated: (controller) {
          this.controller = controller;
        },
        initialUrl: widget.url,
        javascriptMode: JavascriptMode.unrestricted,
        onPageStarted: ((url) {
          print("New uerl $url");
          // if (url == baseUrl + "payment/pay/success/") {
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (_) => OrderConfirm()));
          // } else if (url ==
          //     "https://oyster-app-7ulvb.ondigitalocean.app/payment/failed/") {
          //   Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //           builder: (_) => PaymentFailed(
          //                 url: widget.url,
          //               )));
          // }
        }),
        onProgress: (int progress) {
          print("work");
          if (progress == 100) {
            progressValue.value = false;
          }
          print('WebView is loading (progress : $progress%)');
        },
      )),
    );
  }
}
