import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../CheckOutPage/model/address_model.dart';

class AddressController extends GetxController {
  var isLoading = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController areaCodeController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  var isLabel = 0.obs;

  @override
  onInit() {
    getAddressList();
    super.onInit();
  }

  getAddressList() async {}

  List<AddressModel> addressList = List<AddressModel>.empty(growable: true).obs;

  addAddress(
      {required AddressModel addressModel, required BuildContext context}) {
    addressList.add(addressModel);
    clearTextField();
    Navigator.pop(context);
  }

  clearTextField() {
    fullNameController.clear();
    phoneNumberController.clear();
    regionController.clear();
    cityController.clear();
    areaCodeController.clear();
    addressDetailsController.clear();
    isLabel.value = 0;
  }

}
