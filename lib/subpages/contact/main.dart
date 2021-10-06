import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';

class ContactsPage extends StatelessWidget {
  static const String routeName = '/contacts';

  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text("Contacts"),
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
      child: const Text('Contacts Page'));
  }
}