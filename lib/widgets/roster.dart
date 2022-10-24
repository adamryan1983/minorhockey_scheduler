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
  RosterState createState() => RosterState(division, name);
}

class RosterState extends State<Roster> {
  late String name;
  late String division;
  RosterState(this.division, this.name);
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

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Roster for $name",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.amber,
            ),
          ),),
          Container(
          height: 40.0,
          color: AppColors.fifthColor,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 70,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 70,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "DOB",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 60,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "Number",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 60,
                padding:const EdgeInsets.all(2.0),
                child: const Text(
                  "Status",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "Goals",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "Assists",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "Points",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
              Container(
                width: 40,
                padding: const EdgeInsets.all(2.0),
                child: const Text(
                  "PIM",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 10),
                ),
              ),
            ],
          ),),
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
              return const Center(child: Text('error, try again'));
            }
            // Show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      )
    ]);
  }

  
  Widget _buildListItem(BuildContext context, docs) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          width: 70,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.name ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 8),
          ),
        ),
        Container(
          width: 60,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.dob ?? '',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 8),
          ),
        ),
        Container(
          width: 50,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.jersey.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 8),
          ),
        ),
        Container(
          width: 60,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.status ?? '',
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 8, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 40,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.goals.toString() ?? '0',
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 8, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 40,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.assists.toString() ?? '0',
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 8, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 40,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            (docs.goals + docs.assists).toString(),
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 8, color: AppColors.mainTextBlack),
          ),
        ),
        Container(
          width: 30,
          height: 30,
          padding: const EdgeInsets.all(2.0),
          child: Text(
            docs.pim.toString() ?? '0',
            textAlign: TextAlign.center,
            style:
                const TextStyle(fontSize: 8, color: AppColors.mainTextBlack),
          ),
        ),
      ],
    );
  }

}
