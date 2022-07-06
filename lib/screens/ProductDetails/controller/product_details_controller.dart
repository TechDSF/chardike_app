import 'package:chardike/screens/ProductDetails/model/review_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  var isLoading = false.obs;
  var isProductReviewDataLoading = false.obs;
  var imageIndex = 0.obs;
  var quantityItem = 1.obs;
  var isHaveCart = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
