import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';
import 'package:minorhockey_scheduler/widgets/roster.dart';
import 'package:minorhockey_scheduler/widgets/schedule.dart';
import 'package:minorhockey_scheduler/widgets/scores.dart';

class TimbitsPage extends StatefulWidget {
  const TimbitsPage({Key? key}) : super(key: key);
  static const String routeName = '/timbits';
  // static const String name = 'Timbits';
  // static const String division = 'timbits';

  @override
  TimbitsPageState createState() => TimbitsPageState();
}

class TimbitsPageState extends State<TimbitsPage>
    with TickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  late TabController controller;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        title: const Text(
          "Timbits Division",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20.0,
            fontWeight: FontWeight.w300,
            letterSpacing: 0.3,
          ),
        ),
        bottom: TabBar(
          controller: controller,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: const Color(0xFFFFFFFF),
          tabs: const <Tab>[
            Tab(text: 'Roster'),
            Tab(text: 'Schedule'),
            Tab(text: 'Scores'),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          Roster(name: 'Timbits', division: 'timbits'),
          Schedule(name: 'Timbits', division: 'timbits'),
          Scores(name: 'Timbits', division: 'timbits')
        ],
      ),
    );
  }
}
