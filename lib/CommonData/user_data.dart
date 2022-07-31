import 'package:chardike/CommonData/common_data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataController extends GetxController {
  var isLoading = false.obs;

  late SharedPreferences preferences;
  var fullName = "".obs;
  var userObjId = "".obs;
  var profileId = "".obs;
  var userName = "".obs;
  var phone = "".obs;
  var email = "".obs;
  var token = "".obs;
  var password = "".obs;
  var image = "".obs;
  var dob = "".obs;
  var gender = "".obs;
  var address = "".obs;
  var city = "".obs;
  var zipcode = "".obs;
  var country = "".obs;
  var bio = "".obs;

  getData() async {
    preferences = await SharedPreferences.getInstance();
    fullName.value = preferences.getString(CommonData.fullName) ?? "";
    email.value = preferences.getString(CommonData.email) ?? "";
    phone.value = preferences.getString(CommonData.phone) ?? "";
    userObjId.value = preferences.getString(CommonData.userObjId) ?? "";
    profileId.value = preferences.getString(CommonData.userProfileId) ?? "";
    userName.value = preferences.getString(CommonData.userName) ?? "";
    token.value = preferences.getString(CommonData.token) ?? "";
    password.value = preferences.getString(CommonData.password) ?? "";
    image.value = preferences.getString(CommonData.image) ?? "";
    dob.value = preferences.getString(CommonData.dob) ?? "";
    gender.value = preferences.getString(CommonData.gender) ?? "";
    address.value = preferences.getString(CommonData.address) ?? "";
    city.value = preferences.getString(CommonData.city) ?? "";
    zipcode.value = preferences.getString(CommonData.zipcode) ?? "";
    country.value = preferences.getString(CommonData.country) ?? "";
    bio.value = preferences.getString(CommonData.bio) ?? "";
  }

  setData(
      {required String fullNameData,
      required String emailData,
      required String mobileData,
      required String userObjIdData,
      required String profileIdData,
      required String userNameData,
      required String tokenData,
      required String passwordData,
      required String imageData,
      required String dobData,
      required String bioData,
      required String genderData,
      required String addressData,
      required String cityData,
      required String zipcodeData,
      required String countryData}) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(CommonData.fullName, fullNameData);
    preferences.setString(CommonData.email, emailData);
    preferences.setString(CommonData.phone, mobileData);
    preferences.setString(CommonData.userObjId, userObjIdData);
    preferences.setString(CommonData.userProfileId, profileIdData);
    preferences.setString(CommonData.userName, userNameData);
    preferences.setString(CommonData.token, tokenData);
    preferences.setString(CommonData.password, passwordData);
    preferences.setString(CommonData.image, imageData);
    preferences.setString(CommonData.dob, dobData);
    preferences.setString(CommonData.bio, bioData);
    preferences.setString(CommonData.gender, genderData);
    preferences.setString(CommonData.address, addressData);
    preferences.setString(CommonData.city, cityData);
    preferences.setString(CommonData.zipcode, zipcodeData);
    preferences.setString(CommonData.country, countryData);

    fullName.value = fullNameData;
    email.value = emailData;
    phone.value = mobileData;
    userObjId.value = userObjIdData;
    profileId.value = profileIdData;
    userName.value = userNameData;
    token.value = tokenData;
    password.value = passwordData;
    image.value = imageData;
    dob.value = dobData;
    bio.value = bioData;
    gender.value = genderData;
    address.value = addressData;
    city.value = cityData;
    zipcode.value = zipcodeData;
    country.value = countryData;
  }
}
