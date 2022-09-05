import 'package:chardike/CommonData/user_data.dart';
import 'package:chardike/Service/ApiService/api_service.dart';
import 'package:chardike/screens/ProductDetails/model/review_model.dart';
import 'package:get/get.dart';
import 'package:new_version/new_version.dart';
import 'package:url_launcher/url_launcher.dart';

class UserController extends GetxController {
  var isLoading = false.obs;
  final UserDataController _dataController = Get.put(UserDataController());
  var version = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    //getVersion();
    super.onInit();
  }

  getVersion() async {
    final newVersion = NewVersion(
      iOSId: 'com.techdsf.chardike',
      androidId: 'com.techdsf.chardike',
    );
    final status = await newVersion.getVersionStatus();
    var v = status!.localVersion;
    version.value = v.toString();
    print(version.value);
  }

  Future<void> launchCustomUrl({required Uri url}) async {
    if (await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
    } else {
      throw 'Could not launch $url';
    }
  }

  var isMyReviewLoading = false.obs;
  List<ReviewModel> myReviewList = List<ReviewModel>.empty(growable: true).obs;
  Future<void> getMyReviews() async {
    isMyReviewLoading(true);
    try {
      var result = await ApiService.getALlReview();
      if (result.runtimeType == int) {
        isMyReviewLoading(false);
        print("Get my review is Error");
      } else {
        List<ReviewModel> list = result;
        myReviewList.clear();
        list.forEach((element) {
          if (element.profile.id.toString() ==
              _dataController.profileId.value) {
            myReviewList.add(element);
          }
        });
      }
    } on Exception catch (e) {
      isMyReviewLoading(false);
      print("Get my review is Error");
      // TODO
    } finally {
      isMyReviewLoading(false);
    }
  }
}
