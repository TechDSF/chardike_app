import 'package:chardike/screens/UserPage/model/city_model.dart';
import 'package:chardike/screens/UserPage/model/region_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../CommonData/user_data.dart';
import '../../CheckOutPage/model/address_model.dart';

class AddressController extends GetxController {
  var isLoading = false.obs;

  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postCodeTextController = TextEditingController();
  TextEditingController areaCodeController = TextEditingController();
  TextEditingController addressDetailsController = TextEditingController();
  final UserDataController _userDataController = Get.put(UserDataController());
  
  var isLabel = 0.obs;
  Rx<List<AddressModel>> userAddress = Rx<List<AddressModel>>([]);
  List<String> regionList = List<String>.empty(growable: true).obs;

  var isBilling = true.obs;
  var regionEditingController = TextEditingController();
  var cityEditingController = TextEditingController();
  var regionId = 0.obs;

  List<RegionModel> region = <RegionModel>[
    RegionModel(id: 1, name: "Barishal"),
    RegionModel(id: 2, name: "Chattogram"),
    RegionModel(id: 3, name: "Dhaka"),
    RegionModel(id: 4, name: "Khulna"),
    RegionModel(id: 5, name: "Rajshahi"),
    RegionModel(id: 6, name: "Rangpur"),
    RegionModel(id: 7, name: "Mymensingh"),
    RegionModel(id: 8, name: "Sylhet")
  ];

  var city = <CityModel>[
    ///Barishal
    CityModel(regionId: 1, cityId: 1, name: "Barisal"),
    CityModel(regionId: 1, cityId: 2, name: "Barguna"),
    CityModel(regionId: 1, cityId: 3, name: "Bhola"),
    CityModel(regionId: 1, cityId: 4, name: "Jhalokathi"),
    CityModel(regionId: 1, cityId: 5, name: "Patuakhali"),
    CityModel(regionId: 1, cityId: 6, name: "Pirojpur"),

    ///chittagong
    CityModel(regionId: 2, cityId: 7, name: "Brahmanbaria"),
    CityModel(regionId: 2, cityId: 8, name: "Comilla"),
    CityModel(regionId: 2, cityId: 9, name: "Chandpur"),
    CityModel(regionId: 2, cityId: 10, name: "Lakshmipur"),
    CityModel(regionId: 2, cityId: 11, name: "Noakhali"),
    CityModel(regionId: 2, cityId: 12, name: "Feni"),
    CityModel(regionId: 2, cityId: 13, name: "Khagrachhari"),
    CityModel(regionId: 2, cityId: 14, name: "Rangamati"),
    CityModel(regionId: 2, cityId: 15, name: "Bandarban"),
    CityModel(regionId: 2, cityId: 16, name: "Chittagong"),
    CityModel(regionId: 2, cityId: 17, name: "Cox's Bazar"),

    ///Dhaka
    CityModel(regionId: 3, cityId: 18, name: "Dhaka"),
    CityModel(regionId: 3, cityId: 19, name: "Gazipur"),
    CityModel(regionId: 3, cityId: 20, name: "Kishoreganj"),
    CityModel(regionId: 3, cityId: 21, name: "Manikganj"),
    CityModel(regionId: 3, cityId: 22, name: "Munshiganj"),
    CityModel(regionId: 3, cityId: 23, name: "Narsingdi"),
    CityModel(regionId: 3, cityId: 24, name: "Narayanganj"),
    CityModel(regionId: 3, cityId: 25, name: "Tangail"),
    CityModel(regionId: 3, cityId: 26, name: "Faridpur"),
    CityModel(regionId: 3, cityId: 27, name: "Gopalganj"),
    CityModel(regionId: 3, cityId: 28, name: "Madaripur"),
    CityModel(regionId: 3, cityId: 29, name: "Rajbari"),
    CityModel(regionId: 3, cityId: 30, name: "Shariatpur"),

    ///khulna
    CityModel(regionId: 4, cityId: 31, name: "Bagerhat"),
    CityModel(regionId: 4, cityId: 32, name: "Chuadanga"),
    CityModel(regionId: 4, cityId: 33, name: "Jashore"),
    CityModel(regionId: 4, cityId: 34, name: "Jhenaidah"),
    CityModel(regionId: 4, cityId: 35, name: "Khulna"),
    CityModel(regionId: 4, cityId: 36, name: "Kushtia"),
    CityModel(regionId: 4, cityId: 37, name: "Magura"),
    CityModel(regionId: 4, cityId: 38, name: "Meherpur"),
    CityModel(regionId: 4, cityId: 39, name: "Narail"),
    CityModel(regionId: 4, cityId: 40, name: "Satkhira"),

    ///Rajshahi
    CityModel(regionId: 5, cityId: 41, name: "Rajshahi"),
    CityModel(regionId: 5, cityId: 42, name: "Sirajganj"),
    CityModel(regionId: 5, cityId: 43, name: "Pabna"),
    CityModel(regionId: 5, cityId: 44, name: "Bogura"),
    CityModel(regionId: 5, cityId: 45, name: "Chapainawabganj"),
    CityModel(regionId: 5, cityId: 46, name: "Naogaon"),
    CityModel(regionId: 5, cityId: 47, name: "Joypurhat"),
    CityModel(regionId: 5, cityId: 48, name: "Natore"),

    ///Rangpur
    CityModel(regionId: 6, cityId: 49, name: "Rangpur"),
    CityModel(regionId: 6, cityId: 50, name: "Gaibandha"),
    CityModel(regionId: 6, cityId: 51, name: "Nilphamari"),
    CityModel(regionId: 6, cityId: 52, name: "Kurigram"),
    CityModel(regionId: 6, cityId: 53, name: "Lalmonirhat"),
    CityModel(regionId: 6, cityId: 54, name: "Dinajpur"),
    CityModel(regionId: 6, cityId: 55, name: "Thakurgaon"),
    CityModel(regionId: 6, cityId: 56, name: "Panchagarh"),

    ///Mymensingh
    CityModel(regionId: 7, cityId: 57, name: "Mymensingh"),
    CityModel(regionId: 7, cityId: 58, name: "Jamalpur"),
    CityModel(regionId: 7, cityId: 59, name: "Netrokona"),
    CityModel(regionId: 7, cityId: 60, name: "Sherpur"),

    ///	Sylhet
    CityModel(regionId: 8, cityId: 61, name: "Sylhet"),
    CityModel(regionId: 8, cityId: 62, name: "Habiganj"),
    CityModel(regionId: 8, cityId: 63, name: "Moulvibazar"),
    CityModel(regionId: 8, cityId: 64, name: "Sunamganj"),
  ];

  @override
  onInit() {
    super.onInit();
  }

  List<AddressModel> addressList = List<AddressModel>.empty(growable: true).obs;

  addAddress(
      {required AddressModel addressModel, required BuildContext context}) {
    addressList.add(addressModel);
    clearTextField();
    Navigator.pop(context);
  }

  Future<List<RegionModel>> getRegionList(String query) async {
    if (query.isEmpty) {
      return [];
    } else {
      return region
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  Future<List<CityModel>> getCityList(String query) async {
    if (query.isEmpty) {
      return [];
    } else {
      return city
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()) &&
              element.regionId == regionId.value)
          .toList();
    }
  }

  ///update address
  final TextEditingController nameUpdateController = TextEditingController();
  final TextEditingController emailUpdateController = TextEditingController();
  final TextEditingController phoneUpdateController = TextEditingController();
  final TextEditingController regionUpdateController = TextEditingController();
  final TextEditingController cityUpdateController = TextEditingController();
  final TextEditingController areaUpdateController = TextEditingController();
  final TextEditingController addressUpdateController = TextEditingController();
  final TextEditingController postCodeUpdateController =
      TextEditingController();

  setValue({required AddressModel addressModel}) async {
    nameUpdateController.text = addressModel.name;
    emailUpdateController.text = addressModel.email;
    phoneUpdateController.text = addressModel.phone;
    regionUpdateController.text = addressModel.region;
    cityUpdateController.text = addressModel.city;
    areaUpdateController.text = addressModel.area;
    addressUpdateController.text = addressModel.address;
    postCodeUpdateController.text = addressModel.postCode;
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
