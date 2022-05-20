import 'package:flutter/material.dart';

import '../../../CommonData/all_colors.dart';

class DeviceInformation extends StatelessWidget {
  const DeviceInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(onTap: (){
          Navigator.pop(context);
        },child: Icon(Icons.arrow_back,color: AllColors.mainColor,)),
        title: Text("Device Information",style: TextStyle(color: Colors.black),),
        centerTitle: false,
      ),
    );
  }
}
