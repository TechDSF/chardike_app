import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CheckOutPage/controller/check_out_controller.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/add_new_address.dart';
import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../CheckOutPage/model/address_model.dart';

class MyAddress extends StatelessWidget {
  MyAddress({Key? key}) : super(key: key);
  static const String routeName = "/my_address";
  final AddressController _addressController = Get.put(AddressController());
  final CheckOutController _checkOutController = Get.put(CheckOutController());

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as int;
    _addressController.isBilling.value = true;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.97),
        appBar: AppBar(
          title: Text("My Address"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddNewAddress.routeName);
                },
                child: Text("Add New"))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(color: Colors.grey),
                ),
              ),
              child: TabBar(
                indicatorColor: AllColors.mainColor,
                labelStyle: const TextStyle(fontWeight: FontWeight.normal),
                indicatorWeight: getProportionateScreenWidth(2),
                labelColor: AllColors.mainColor,
                onTap: (value) {
                  if (value == 0) {
                    _addressController.isBilling.value = true;
                  } else {
                    _addressController.isBilling.value = false;
                  }
                },
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(
                    text: "Billing",
                  ),
                  Tab(
                    text: "Shipping",
                  )
                ],
              ),
            ),
            Obx(() {
              if (_addressController.isBilling.value) {
                return Expanded(
                  child: Obx(() {
                    if (_checkOutController.userAddress.value.isEmpty) {
                      return SizedBox();
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              _checkOutController.userAddress.value.length,
                          itemBuilder: (context, index) {
                            AddressModel model =
                                _checkOutController.userAddress.value[index];
                            return InkWell(
                              onTap: () {
                                if (args == 1) {
                                  _checkOutController.addressId.value =
                                      model.id;
                                  _checkOutController.firstAddressValue.value =
                                      "${model.area},${model.city},${model.region}";
                                  Navigator.pop(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: AllColors.mainColor,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              model.area,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      3),
                                            ),
                                            Text(
                                              model.city,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      7),
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getProportionateScreenWidth(
                                                                  10)),
                                                      color: Colors.teal),
                                                  child: Text(
                                                    model.region,
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                12),
                                                        color: Colors.white),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          getProportionateScreenWidth(
                                                              5),
                                                      vertical:
                                                          getProportionateScreenWidth(
                                                              2)),
                                                ),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          5),
                                                ),
                                                Text(model.address +
                                                    "," +
                                                    model.area +
                                                    "," +
                                                    model.city +
                                                    "," +
                                                    model.region)
                                              ],
                                            )
                                          ],
                                        )),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Edit"))
                                      ],
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
                );
              } else {
                return Expanded(
                  child: Obx(() {
                    if (_checkOutController.userAddress.value.isEmpty) {
                      return SizedBox(
                        child: Text("Shipping"),
                      );
                    } else {
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: _checkOutController
                              .userShippingAddress.value.length,
                          itemBuilder: (context, index) {
                            AddressModel model = _checkOutController
                                .userShippingAddress.value[index];
                            return InkWell(
                              onTap: () {
                                if (args == 2) {
                                  _checkOutController.firstBillingId.value =
                                      model.id;
                                  _checkOutController
                                          .firstBillingAddress.value =
                                      "${model.area},${model.city},${model.region}";
                                  print(
                                      "${model.area},${model.city},${model.region}");
                                  Navigator.pop(context);
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on_rounded,
                                          color: AllColors.mainColor,
                                        ),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        Expanded(
                                            child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              model.area,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      3),
                                            ),
                                            Text(
                                              model.city,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize:
                                                      getProportionateScreenWidth(
                                                          14)),
                                            ),
                                            SizedBox(
                                              height:
                                                  getProportionateScreenHeight(
                                                      7),
                                            ),
                                            Wrap(
                                              direction: Axis.horizontal,
                                              children: <Widget>[
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              getProportionateScreenWidth(
                                                                  10)),
                                                      color: Colors.teal),
                                                  child: Text(
                                                    model.region,
                                                    style: TextStyle(
                                                        fontSize:
                                                            getProportionateScreenWidth(
                                                                12),
                                                        color: Colors.white),
                                                  ),
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          getProportionateScreenWidth(
                                                              5),
                                                      vertical:
                                                          getProportionateScreenWidth(
                                                              2)),
                                                ),
                                                SizedBox(
                                                  width:
                                                      getProportionateScreenWidth(
                                                          5),
                                                ),
                                                Text(model.address +
                                                    "," +
                                                    model.area +
                                                    "," +
                                                    model.city +
                                                    "," +
                                                    model.region)
                                              ],
                                            )
                                          ],
                                        )),
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(10),
                                        ),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Edit"))
                                      ],
                                    ),
                                    Divider()
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  }),
                );
              }
            })
          ],
        ),
      ),
    );
  }
}
