class ScheduleModel {
  String date = "";
  String location = "";
  String time = "";
  String opponent = "";
  String title = "";

  ScheduleModel(
    {
      required this.title,
      required this.date,
      required this.time,
      required this.location,
      required this.opponent
    }
  );

  ScheduleModel.fromJson(Map<String, dynamic> json)
      : date = json['date'] as String,
        location = json['location'] as String,
        time = json['time'] as String,
        opponent = json['opponent'] as String,
        title = json['title'] as String;

}
