// ignore_for_file: file_names, equal_keys_in_map
import 'dart:ui';
import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/drawer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:minorhockey_scheduler/routes/routes.dart';
import 'package:minorhockey_scheduler/subpages/about/main.dart';
import 'package:minorhockey_scheduler/subpages/contact/main.dart';
import 'package:minorhockey_scheduler/subpages/covid/main.dart';
import 'package:minorhockey_scheduler/subpages/timbits/main.dart';
import 'package:minorhockey_scheduler/subpages/u9/main.dart';
import 'package:minorhockey_scheduler/subpages/u11/main.dart';
import 'package:minorhockey_scheduler/subpages/u13/main.dart';
import 'package:minorhockey_scheduler/subpages/u15/main.dart';
import 'package:minorhockey_scheduler/subpages/u18/main.dart';

Future main() async {
  dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'NotoSansDisplay',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.secondaryColor,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      primaryVariant: Colors.white38,
      secondary: Colors.blue,
    ),
    cardTheme: const CardTheme(
      color: Colors.blue,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.fifthColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'NotoSansDisplay',
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: AppColors.secondaryColor,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      primaryVariant: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: AppColors.fifthColor,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String routeName = '/home';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BIMHA 2021-22 Season Database',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */

      home: Scaffold(
        appBar: AppBar(title: const Text('BIMHA Info Hub')),
        drawer: const AppDrawer(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Welcome to the 2021-22 Season',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              Image.asset('assets/images/logo-trans.png',
                  fit: BoxFit.cover, width: 250),
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
        ),
      ),
      routes:  {
        Routes.contacts: (context) => const ContactsPage(),
        Routes.about: (context) => const AboutPage(),
        Routes.covid: (context) => const CovidPage(),
        Routes.timbits: (context) => const TimbitsPage(),
        Routes.u9: (context) => const U9Page(),
        Routes.u11: (context) => const U11Page(),
        Routes.u13: (context) => const U13Page(),
        Routes.u15: (context) => const U15Page(),
        Routes.u18: (context) => const U18Page(),
        Routes.home: (context) => const MyApp(),
      },
    );
  }
}