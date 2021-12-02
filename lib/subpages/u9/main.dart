import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';
import 'package:minorhockey_scheduler/widgets/roster.dart';
import 'package:minorhockey_scheduler/widgets/schedule.dart';
import 'package:minorhockey_scheduler/widgets/scores.dart';

class U9Page extends StatefulWidget {
  const U9Page({Key? key}) : super(key: key);
  static const String routeName = '/u9';
  // static const String name = 'U9';
  // static const String division = 'u9';

  @override
  _U9PageState createState() => _U9PageState();
}

class _U9PageState extends State<U9Page> with TickerProviderStateMixin {
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
          "Under 9 Division",
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
          Roster(name: 'Under 9', division: 'u9'),
          Schedule(name: 'Under 9', division: 'u9'),
          Scores(name: 'Under 9', division: 'u9')
        ],
      ),
    );
  }
}
