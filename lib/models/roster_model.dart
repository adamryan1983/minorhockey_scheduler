class RosterModel {
  String name = "";
  String dob = "";
  String? jersey;
  String status = "";

  RosterModel.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        dob = json['dob'],
        jersey = json['jersey'],
        status = json['status'] ?? "N/A";
}
