class ScoreModel {
  String team1 = "";
  String team2 = "";
  int? scoreTeam1;
  int? scoreTeam2;
  String date = "";
  String divisionName = "";

  ScoreModel(
      {required this.team1,
      required this.team2,
      required this.scoreTeam1,
      required this.scoreTeam2,
      required this.date,
      required this.divisionName});

  ScoreModel.fromJson(Map<String, dynamic> json)
      : team1 = json['Team1Name'] as String,
        team2 = json['Team2Name'] as String,
        scoreTeam1 = json['Team1Score'] as int,
        scoreTeam2 = json['Team2Score'] as int,
        date = json['date'] as String,
        divisionName = json['division'] as String;
}
