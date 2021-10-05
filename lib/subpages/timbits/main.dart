import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class TimbitsPage extends StatefulWidget {
  const TimbitsPage({Key? key}) : super(key: key);
    static const String routeName = '/timbits';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<TimbitsPage>
    with SingleTickerProviderStateMixin {
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
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: TabBarView(
        controller: controller,
        children: const <Widget>[
          RosterList(),
          ScheduleList()
        ],
      ),
    );
  }
}

class RosterList extends StatelessWidget {
  const RosterList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8), child: const Text('Timbits Page'));
  }
}

class ScheduleList extends StatelessWidget {
  const ScheduleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8), child: const Text('Timbits Page'));
  }
}