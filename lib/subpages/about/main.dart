import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = '/about';

  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text("About Us"),
        ),
        body: const ContactList()
      );
  }
}

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Text('About Page'));
  }
}