import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';
import 'package:minorhockey_scheduler/widgets/roster.dart';
import 'package:minorhockey_scheduler/widgets/schedule.dart';

class U18Page extends StatefulWidget {
  const U18Page({Key? key}) : super(key: key);
    static const String routeName = '/u18';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<U18Page>
    with TickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 2, vsync: this);
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFFFFFFFF),
        ),
        title: const Text(
          "Under 18 Division",
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
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
        Roster(name: 'Under 18', division: 'u18'),
        Schedule(name: 'Under 18', division: 'u18')
        ],
      ),
    );
  }
}