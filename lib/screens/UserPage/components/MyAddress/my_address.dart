import 'package:chardike/CommonData/all_colors.dart';
import 'package:chardike/screens/UserPage/components/MyAddress/add_new_address.dart';
import 'package:chardike/screens/UserPage/controller/address_controller.dart';
import 'package:chardike/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAddress extends StatelessWidget {
  MyAddress({Key? key}) : super(key: key);
  static const String routeName = "/my_address";
  final AddressController _addressController = Get.put(AddressController());

  @override
  Widget build(BuildContext context) {
    print("address--------------------");
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.97),
      appBar: AppBar(
        title: Text("My Address"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: getProportionateScreenHeight(10),),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, AddNewAddress.routeName);
              },
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenHeight(10)
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Text("Add a new address")),
                    Icon(Icons.add,color: Colors.grey,)
                  ],
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
            Divider(),
            Obx((){
              if(_addressController.addressList.isEmpty){
                return SizedBox();
              }else{
                return ListView.builder(
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _addressController.addressList.length,itemBuilder: (context , index){
                    AddressModel model = _addressController.addressList[index];
                    print("work address");
                    return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.location_on_rounded,color: AllColors.mainColor,),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            Expanded(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(model.fullName,style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(14)),),
                                SizedBox(height: getProportionateScreenHeight(3),),
                                Text(model.phoneNumber,style: TextStyle(color: Colors.black,fontSize: getProportionateScreenWidth(14)),),
                                SizedBox(height: getProportionateScreenHeight(7),),
                                Wrap(
                                  direction: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(getProportionateScreenWidth(10)),
                                        color: Colors.teal
                                      ),
                                      child: Text(model.label,style: TextStyle(fontSize: getProportionateScreenWidth(12),color: Colors.white),),
                                      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5),vertical: getProportionateScreenWidth(2)),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(5),),
                                    Text(model.address+","+model.region+","+model.city+","+model.area)
                                  ],
                                )

                              ],
                            )),
                            SizedBox(width: getProportionateScreenWidth(10),),
                            TextButton(onPressed: (){}, child: Text("Edit"))
                          ],
                        ),
                        Divider()
                      ],
                    ),
                  );
                });
              }
            })
          ],
        ),
      ),
    );
  }
}