import 'package:chardike/screens/FeedPage/model/timeline_model.dart';
import 'package:get/get.dart';

class FeedController extends GetxController{
  var isLoading = false.obs;
  List<TimeLineModel> timeLineList = List<TimeLineModel>.empty(growable: true).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    getTimeLinneData();
    super.onInit();
  }

  getTimeLinneData(){
    var list = [
      TimeLineModel(image: ["asset/images/topProduct/tp_1.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "Say annyeong to this daebak giveway...like this post and comment.", totalLike: 216, totalComment: 472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_8.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "6 DAYS UNTIL AKINSE: count down to payday with wireless products", totalLike: 2016, totalComment: 7472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_6.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "Say annyeong to this daebak giveway...like this post and comment.", totalLike: 216, totalComment: 472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_4.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "6 DAYS UNTIL AKINSE: count down to payday with wireless products", totalLike: 2016, totalComment: 7472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_1.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "Say annyeong to this daebak giveway...like this post and comment.", totalLike: 216, totalComment: 472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_6.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "6 DAYS UNTIL AKINSE: count down to payday with wireless products", totalLike: 2016, totalComment: 7472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_2.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "Say annyeong to this daebak giveway...like this post and comment.", totalLike: 216, totalComment: 472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_3.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "6 DAYS UNTIL AKINSE: count down to payday with wireless products", totalLike: 2016, totalComment: 7472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_5.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "Say annyeong to this daebak giveway...like this post and comment.", totalLike: 216, totalComment: 472, postHour: DateTime(2022,4,10)),
      TimeLineModel(image: ["asset/images/topProduct/tp_8.jpeg","asset/images/topProduct/tp_2.jpeg"], title: "6 DAYS UNTIL AKINSE: count down to payday with wireless products", totalLike: 2016, totalComment: 7472, postHour: DateTime(2022,4,10)),
      ];

    timeLineList = list;
  }
}