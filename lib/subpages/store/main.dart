import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';

class StorePage extends StatelessWidget {
  static const String routeName = '/store';

  const StorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text("Miners Merch"),
        ),
        body: const MinersMerch());
  }
}

class MinersMerch extends StatelessWidget {
  const MinersMerch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container (
        padding: const EdgeInsets.all(50),
        alignment: Alignment.center,
        child: const Text("Miners Merch",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 180, 26, 26),
        ),
        ),
        ),
        Container (alignment: Alignment.center,
        child: const Text("Coming Soon!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 224, 198, 3),
        ),
        ),
        ),
    ]);
  }}