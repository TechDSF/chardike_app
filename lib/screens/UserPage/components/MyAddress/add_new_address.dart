

import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddNewAddress extends StatelessWidget {
  AddNewAddress({Key? key}) : super(key: key);
  static const String routeName = "/add_new_address";
  var formKey = GlobalKey<FormState>();
  final AddressController _addressController = Get.put(AddressController());

  Widget hintTitle({required String data}){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(data),
    );
  }

  Widget customTextForm({required String hintText, required TextEditingController controller,required String validateValue}){
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            border: InputBorder.none,
            enabledBorder: InputBorder.none
        ),
        validator: (value){
          if(value!.isEmpty){
            return validateValue;
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        title: Text("New Address"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: getProportionateScreenHeight(10),),
              hintTitle(data: "Contact"),
              customTextForm(hintText: "Full Name", controller: _addressController.fullNameController, validateValue: "Please provide Full Name"),
              Container(height: getProportionateScreenHeight(1),color: Colors.grey.withOpacity(0.5),),
              customTextForm(hintText: "Phone Number", controller: _addressController.phoneNumberController, validateValue: "Please provide Phone Number"),
              SizedBox(height: getProportionateScreenHeight(10),),
              hintTitle(data: "Address"),
              customTextForm(hintText: "Region", controller: _addressController.regionController, validateValue: "Please provide your Region"),
              Container(height: getProportionateScreenHeight(1),color: Colors.grey.withOpacity(0.5),),
              customTextForm(hintText: "City", controller: _addressController.cityController, validateValue: "Please provide your City"),
              Container(height: getProportionateScreenHeight(1),color: Colors.grey.withOpacity(0.5),),
              customTextForm(hintText: "Area", controller: _addressController.areaCodeController, validateValue: "Please provide your Area"),
              Container(height: getProportionateScreenHeight(1),color: Colors.grey.withOpacity(0.5),),
              customTextForm(hintText: "Address", controller: _addressController.addressDetailsController, validateValue: "Please provide your Address Details"),
              SizedBox(height: getProportionateScreenHeight(10),),
              hintTitle(data: "Select a label for effective delivery:"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        _addressController.isLabel.value = 1;
                      },
                      child: Obx(()=>Container(
                        width: SizeConfig.screenWidth * 0.3,
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                        decoration: BoxDecoration(
                            border: Border.all(color: _addressController.isLabel.value == 1?AllColors.mainColor:Colors.grey),
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.local_post_office,color: Colors.grey,),
                            SizedBox(width: getProportionateScreenWidth(5),),
                            Text("OFFICE",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(14)),)
                          ],
                        ),
                      ),)
                    ),
                    SizedBox(width: getProportionateScreenWidth(10),),
                    InkWell(
                      onTap: (){
                        _addressController.isLabel.value = 2;
                      },
                      child: Obx(()=>Container(
                        width: SizeConfig.screenWidth * 0.3,
                        padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(20)),
                        decoration: BoxDecoration(
                            border: Border.all(color: _addressController.isLabel.value == 2?AllColors.mainColor:Colors.grey),
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(getProportionateScreenWidth(10))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.home_filled,color: Colors.grey,),
                            SizedBox(width: getProportionateScreenWidth(5),),
                            Text("HOME",style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(14)),)
                          ],
                        ),
                      ),)
                    ),
                  ],
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              InkWell(
                onTap: (){
                  if(formKey.currentState!.validate()){
                    if(_addressController.isLabel.value == 0){
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please select your label!")));
                    }else{
                      var model = AddressModel(id: DateTime.now().microsecondsSinceEpoch.toString(), fullName: _addressController.fullNameController.text, phoneNumber: _addressController.phoneNumberController.text, region: _addressController.regionController.text, city: _addressController.cityController.text, area: _addressController.areaCodeController.text, address: _addressController.addressDetailsController.text, label: _addressController.isLabel.value==1?"OFFICE":"HOME");
                      _addressController.addAddress(addressModel: model,context: context);
                    }

                  }
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
                  padding: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(12)),
                    color: Colors.grey.withOpacity(0.3),
                  child: Center(child: Text("SUBMIT",style: TextStyle(fontSize: getProportionateScreenWidth(15)),))
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30),),
            ],
          ),
        ),
      ),
    );
  }
}
