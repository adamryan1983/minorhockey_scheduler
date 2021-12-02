import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/widgets/drawer.dart';

class CovidPage extends StatelessWidget {
  static const String routeName = '/covid';

  const CovidPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
        appBar: AppBar(
          title: const Text("Covid Info"),
        ),
        body: const CovidInfo()
      );
  }
}

class CovidInfo extends StatelessWidget {
  const CovidInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            const Center(
            child: Text('BIMHA Covid Policy',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            
            ),
            const Center(
              
              child: Icon(Icons.info, size: 50, color: Colors.blue),
              ),
            
            Container (
              padding: const EdgeInsets.all(10),
              child: const Text('Effective: October 22, 2021',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600),),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: const Text('Under the new policy, patrons entering non-essential businesses, such as arenas, now have to provide proof that they are fully vaccinated against COVID-19, either through a QR code on their mobile devices or a printed copy of the QR code, or have an approved medical exemption. Along with vaccination proof, identification is also required.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500),),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: const Text('In some cases, visitors without a digital or paper QR code can present the vaccination record issued to them by the provincial government',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500)),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: const Text('Patrons that do not meet the requirements or fail to present the required measures will be prohibited entry and will be asked to leave. Any further questions regarding this policy can be addressed to the Government of Newfoundland',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500)),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: const Text('This is required to ALL individuals over the age of 18',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w600)),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text('For more information, please visit:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500)),
                  Text('https://www.gov.nl.ca/coronavirus/',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            Container (
              padding: const EdgeInsets.all(10),
              child: Column(
                children: const [
                  Text('Please Note:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w600)),
                  Text('Masks/approved face coverings are still required on site.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500)),
                  Text('Players/bench staff are required masks/approved face coverings while on the bench.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
