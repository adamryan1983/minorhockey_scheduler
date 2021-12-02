import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/constants/colors.dart';
import 'package:minorhockey_scheduler/models/score_model.dart';
import 'package:minorhockey_scheduler/services/roster_http.dart';

class Scores extends StatefulWidget {
  final String division;
  final String name;
  const Scores({Key? key, required this.name, required this.division})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ScheduleState createState() => _ScheduleState(division, name);
}

class _ScheduleState extends State<Scores> {
  late String name;
  late String division;
  _ScheduleState(this.division, this.name);
  late Future<List<ScoreModel>> _futureScores;

  @override
  void initState() {
    super.initState();
    _futureScores = RosterRepository().getScores(division);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildListItem(BuildContext context, docs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 60,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.date ?? '',
            style: const TextStyle(fontSize: 11),
          ),
        ),
        Container(
          width: 45,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.team1 ?? '',
            style: docs.scoreTeam1 > docs.scoreTeam2
                ? const TextStyle(fontSize: 12, color: Colors.red)
                : const TextStyle(fontSize: 12, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 20,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.scoreTeam1.toString(),
            style:
                const TextStyle(fontSize: 12, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 45,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.team2 ?? '',
            style: docs.scoreTeam2 > docs.scoreTeam2
                ? const TextStyle(fontSize: 12, color: Colors.red)
                : const TextStyle(fontSize: 12, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 20,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.scoreTeam2.toString(),
            style:
                const TextStyle(fontSize: 12, color: AppColors.mainTextBlack),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Scores for $name",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.amber,
            ),
          )),
      Container(
          height: 60.0,
          color: AppColors.fifthColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 60,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Date",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 45,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Team 1",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Score",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 45,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Team 2",
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Score",
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          )),
      Expanded(
        child: FutureBuilder<List<ScoreModel>>(
          future: _futureScores,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildListItem(context, items[index]));
            } else if (snapshot.hasError) {
              // Show failure error message.
              return const Center(child: Text('failed to load'));
            }
            // Show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    ]);
  }
}
