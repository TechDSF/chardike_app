import 'package:chardike/screens/ProductDetails/model/review_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  var isLoading = false.obs;
  var isProductReviewDataLoading = false.obs;
  var imageIndex = 1.obs;
  var quantityItem = 1.obs;
  List<ProductReviewModel> reviewList = List<ProductReviewModel>.empty(growable: true).obs;
  var isHaveCart = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getProductReview();
    super.onInit();
  }

  getProductReview(){
    isProductReviewDataLoading(true);
    var list = [
      ProductReviewModel(name: "Israt jahan chaity", reviewMessage: "Cosrx is one of the first product lines I tried when I got into Kbeauty brands a few years back. Their formula’s don’t irritate my sensitive skin or break the bank. I bought both this and the good morning PH balancing cleanser. Initially I loved the latter and found this to be very drying. Come to find out sometime later after switching from my summer routine into fall/ winter I realized I wasn’t giving my skin enough moisture the whole time and no cleanser was to blame. I love this now that I adjusted my routine to be more focused on moisture and barrier repair. My skin feels so smooth when I use this, especially helps with the blackheads in the nose area when followed by Paula’s choose BHA gel on top.", rating: 5
          , reviewDate: DateTime(2020,11,16)),
      ProductReviewModel(name: "Lisa moni", reviewMessage: "এত্তো এত্তো জোস এটা উফফ 😍😍😍😍😍", rating: 5
          , reviewDate: DateTime(2020,11,17)),
      ProductReviewModel(name: "Lutfa", reviewMessage: "Amazing product.suitable for all skin typ and help us to remove all the impurities within a minute . can’t thank enough to Chardike for these amazing service where no replica is allowed and we blindly believe on them and their service", rating: 5
          , reviewDate: DateTime(2020,11,21)),
      ProductReviewModel(name: "Shourav Hasan", reviewMessage: "It’s really amazing cleanser for oily and acne prone skin.I use it. It controls my sebum and face looks so glowing.", rating: 5
          , reviewDate: DateTime(2020,12,01)),
    ];
    reviewList = list;
    isProductReviewDataLoading(false);
  }
}