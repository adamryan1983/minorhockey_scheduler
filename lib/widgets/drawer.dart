import 'package:flutter/material.dart';
import 'package:minorhockey_scheduler/routes/routes.dart';
import 'package:minorhockey_scheduler/constants/colors.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container (
        color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'TimBits',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.timbits)),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'Under 9',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.u9)),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'Under 11',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.u11)),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'Under 13',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.u13)),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'Under 15',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.u15)),
          _createDrawerItem(
              icon: Icons.sports_hockey,
              text: 'Under 18',
              onTap: () => Navigator.pushReplacementNamed(context, Routes.u18)),
          const Divider(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Contact Info',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.contacts)),
          _createDrawerItem(
              icon: Icons.info,
              text: 'About',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.about)),
          const Divider(),
          _createDrawerItem(
              icon: Icons.home,
              text: 'Home',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.home)),
        ],
      ),
    )
  );
}

  Widget _createHeader() {
    return DrawerHeader(
        margin: const EdgeInsets.fromLTRB(4, 50, 4, 10),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.scaleDown,
                image: AssetImage("assets/images/logo-trans.png"))),
        child: Stack());
  }

  Widget _createDrawerItem(
      {IconData? icon, String? text, GestureTapCallback? onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon, color: AppColors.primaryColor),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text!),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
