import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/constants/colors.dart';
import 'package:minorhockey_scheduler/models/schedule_model.dart';
import 'package:minorhockey_scheduler/services/roster_http.dart';

class Schedule extends StatefulWidget {
  final String division;
  final String name;
  const Schedule({Key? key, required this.name, required this.division})
      : super(key: key);

  @override
    // ignore: no_logic_in_create_state
  _ScheduleState createState() => _ScheduleState(division,name);
}

class _ScheduleState extends State<Schedule> {
  late String name;
  late String division;
  _ScheduleState(this.division,this.name);
  late Future<List<ScheduleModel>> _futureGames;

  @override
  void initState() {
    super.initState();
    _futureGames = RosterRepository().getGames(division);
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
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 45,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.time ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 70,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.location ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 75,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.opponent ?? '',
            style:
                const TextStyle(fontSize: 12, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 70,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.title ?? '',
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
            "Schedule for $name",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: Colors.amber,
            ),
          )),
      Container(
          height: 40.0,
          color: AppColors.fifthColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 60,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Date",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 50,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Time",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Location",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 85,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Opponent",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 80,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Title",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          )),
      Expanded(
        child: FutureBuilder<List<ScheduleModel>>(
          future: _futureGames,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) =>
                  _buildListItem(context, items[index])
              );
            } else if (snapshot.hasError) {
              // Show failure error message.
              return const Center(child: Text('fail'));
            }
            // Show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    ]);
  }
}