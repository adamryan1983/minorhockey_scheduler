class ScheduleModel {
  String name = "";
  String dob = "";
  String? jersey;
  String status = "";

  ScheduleModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dob = json['dob'],
        jersey = json['jersey'],
        status = json['status'] ?? "N/A";
}
