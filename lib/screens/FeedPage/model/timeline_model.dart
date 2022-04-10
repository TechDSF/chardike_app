class TimeLineModel{
  List<String> image;
  String title;
  int totalLike;
  int totalComment;
  DateTime postHour;

  TimeLineModel({
    required this.image,
    required this.title, required this.totalLike,
    required this.totalComment, required this.postHour
});
}