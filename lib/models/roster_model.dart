class RosterModel {
  String name = "";
  String dob = "";
  int? jersey;
  String status = "";
  int? goals;
  int? assists;
  int? points;
  int? pim;

  RosterModel(
      {required this.name,
      required this.dob,
      required this.jersey,
      required this.status,
      required this.goals,
      required this.assists,
      required this.points,
      required this.pim});

  RosterModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String,
        dob = json['dob'] as String,
        jersey = json['jersey'] as int,
        status = json['status'] as String,
        goals = json['goals'] as int,
        assists = json['assists'] as int,
        points = json['points'] as int,
        pim = json['pim'] as int;
}
