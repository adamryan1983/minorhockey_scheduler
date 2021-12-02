import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/constants/colors.dart';
import 'package:minorhockey_scheduler/models/roster_model.dart';
import 'package:minorhockey_scheduler/services/roster_http.dart';

class Roster extends StatefulWidget {
  final String division;
  final String name;
  const Roster({Key? key, required this.division, required this.name})
      : super(key: key);

  @override
    // ignore: no_logic_in_create_state
  _RosterState createState() => _RosterState(division,name);
}

class _RosterState extends State<Roster> {
    late String name;
    late String division;
    _RosterState(this.division,this.name);
  late Future<List<RosterModel>> _futurePlayers;

  @override
  void initState() {
    super.initState();
    _futurePlayers = RosterRepository().getPlayers(division);
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
          width: 80,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.name ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 70,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.dob ?? '',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 70,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.jersey.toString(),
            style: const TextStyle(fontSize: 12),
          ),
        ),
        Container(
          width: 80,
          padding: const EdgeInsets.all(4.0),
          child: Text(
            docs.status ?? '',
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
            "Roster for $name",
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
                width: 80,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Name",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "DOB",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Number",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                width: 80,
                padding: const EdgeInsets.all(4.0),
                child: const Text(
                  "Status",
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ],
          )),
      Expanded(
        child: FutureBuilder<List<RosterModel>>(
          future: _futurePlayers,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final items = snapshot.data!;
              return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) =>
                      _buildListItem(context, items[index]));
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
