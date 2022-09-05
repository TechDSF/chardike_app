import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/CheckOutPage/controller/check_out_controller.dart';
import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:chardike/size_config.dart';
import "package:flutter/material.dart";
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../CheckOutPage/model/address_model.dart';
import '../../model/city_model.dart';
import '../../model/region_model.dart';

class UpdateAddress extends StatelessWidget {
  UpdateAddress({Key? key, required this.addressModel}) : super(key: key);
  AddressModel addressModel;
  final AddressController _addressController = Get.put(AddressController());
  final CheckOutController _checkOutController = Get.put(CheckOutController());
  var formKey = GlobalKey<FormState>();

  Widget hintTitle({required String data}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(data),
    );
  }

  Widget customTextForm(
      {required String hintText,
      required TextEditingController controller,
      required String validateValue}) {
    return Container(
      color: Colors.white,
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: InputBorder.none),
        validator: (value) {
          if (value!.isEmpty) {
            return validateValue;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _addressController.setValue(addressModel: addressModel);
    return LoaderOverlay(
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          elevation: 1,
          title: Text("Edit Address"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.screenWidth * 0.03),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  hintTitle(data: "Contact"),
                  customTextForm(
                      hintText: "Full Name",
                      controller: _addressController.nameUpdateController,
                      validateValue: "Please provide Full Name"),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  customTextForm(
                      hintText: "Email",
                      controller: _addressController.emailUpdateController,
                      validateValue: "Please provide Email"),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  customTextForm(
                      hintText: "Phone Number",
                      controller: _addressController.phoneUpdateController,
                      validateValue: "Please provide Phone Number"),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  hintTitle(data: "Address"),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TypeAheadField<RegionModel>(
                        textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            controller:
                                _addressController.regionUpdateController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "Division",
                                border: InputBorder.none)),
                        suggestionsCallback: _addressController.getRegionList,
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.name),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _addressController.regionId.value = suggestion.id;
                          _addressController.regionController.text =
                              suggestion.name;
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TypeAheadField<CityModel>(
                        textFieldConfiguration: TextFieldConfiguration(
                            autofocus: true,
                            controller: _addressController.cityUpdateController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                hintText: "City", border: InputBorder.none)),
                        suggestionsCallback: _addressController.getCityList,
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            title: Text(suggestion.name),
                          );
                        },
                        onSuggestionSelected: (suggestion) {
                          _addressController.cityEditingController.text =
                              suggestion.name;
                        },
                      ),
                    ),
                  ),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight * 0.005,
                  ),
                  customTextForm(
                      hintText: "Post Code",
                      controller: _addressController.postCodeUpdateController,
                      validateValue: "Please provide your Post Code"),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight * 0.005,
                  ),
                  customTextForm(
                      hintText: "Area",
                      controller: _addressController.areaUpdateController,
                      validateValue: "Please provide your Area"),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight * 0.005,
                  ),
                  Container(
                    height: getProportionateScreenHeight(1),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight * 0.005,
                  ),
                  customTextForm(
                      hintText: "Address",
                      controller: _addressController.addressUpdateController,
                      validateValue: "Please provide your Address Details"),
                  Container(
                    color: Colors.white,
                    height: SizeConfig.screenHeight * 0.005,
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  hintTitle(data: "Select a label for effective delivery:"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              _addressController.isLabel.value = 1;
                            },
                            child: Obx(
                              () => Container(
                                width: SizeConfig.screenWidth * 0.3,
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(20)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            _addressController.isLabel.value ==
                                                    1
                                                ? AllColors.mainColor
                                                : Colors.grey),
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.badge,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Text(
                                      "OFFICE",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(14)),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          width: getProportionateScreenWidth(10),
                        ),
                        InkWell(
                            onTap: () {
                              _addressController.isLabel.value = 2;
                            },
                            child: Obx(
                              () => Container(
                                width: SizeConfig.screenWidth * 0.3,
                                padding: EdgeInsets.symmetric(
                                    vertical: getProportionateScreenHeight(20)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            _addressController.isLabel.value ==
                                                    2
                                                ? AllColors.mainColor
                                                : Colors.grey),
                                    color: Colors.grey.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(
                                        getProportionateScreenWidth(10))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.home_filled,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(5),
                                    ),
                                    Text(
                                      "HOME",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize:
                                              getProportionateScreenWidth(14)),
                                    )
                                  ],
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(20),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        if (_addressController.isLabel.value == 0) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please select your label!")));
                        } else {
                          context.loaderOverlay.show();
                          _checkOutController.editUserAddress(
                              nameData:
                                  _addressController.nameUpdateController.text,
                              id: addressModel.id.toString(),
                              emailData:
                                  _addressController.emailUpdateController.text,
                              phoneData:
                                  _addressController.phoneUpdateController.text,
                              regionData: _addressController
                                  .regionUpdateController.text,
                              cityData:
                                  _addressController.cityUpdateController.text,
                              areaData:
                                  _addressController.areaUpdateController.text,
                              postCodeData: _addressController
                                  .postCodeUpdateController.text,
                              addressData: _addressController
                                  .addressUpdateController.text,
                              type: addressModel.isBilling,
                              context: context);
                        }
                      }
                    },
                    child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10)),
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(12)),
                        color: Colors.grey.withOpacity(0.3),
                        child: Center(
                            child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(15)),
                        ))),
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(30),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
