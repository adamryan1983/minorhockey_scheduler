class RosterModel {
  String name = "";
  String dob = "";
  int? jersey;
  String status = "";

  RosterModel(
      {required this.name,
      required this.dob,
      required this.jersey,
      required this.status});

  RosterModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        dob = json['dob'] as String,
        jersey = json['jersey'] as int,
        status = json['status'] as String;
}
