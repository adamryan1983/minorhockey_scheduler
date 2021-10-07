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
        body: const ContactList());
  }
}

class ContactList extends StatelessWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Bell Island Minor Hockey Association',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          const Text('Board of Directors',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const Text('President: John Smith',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),  
          const Text('Vice President: John Smith'),
          const Text('Second Vice President: John Smith'),
          const Text('Secretary: John Smith'),
          const Text('Treasurer: John Smith'),
          Row(
           children: const [
             Column(
               children: [
                 const Text('President: John Smith'),
                 const Text('Vice President: John Smith'),
                 const Text('Secretary: John Smith'),
                 const Text('Treasurer: John Smith'),
               ],
             ),
            Text('IHL Rep: '),
            Text('John Doe')]),
          const Text('John Smith'),
          const Text('John Smith'),
          const Text('John Smith'),
          const Text('John Smith'),
          const Text('John Smith'),
          const Text('John Smith'),
          Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: const Text(
              "This is an app for viewing the current roster, schedule, and contact information for the Bell Island Minor Hockey Association/teams",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w300),
            ),
          ),
          const Text(
            "V 1.0 - created by Adam Ryan",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w300),
          ),
        ],
      ),
    );
  }
}
