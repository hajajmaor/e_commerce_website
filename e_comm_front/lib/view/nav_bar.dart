import 'package:e_comm_front/pages/admin.dart';
import 'package:e_comm_front/pages/home.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  Tooltip buildBtn({
    required BuildContext context,
    required String name,
    required String route,
    required String tooltip,
  }) =>
      Tooltip(
        message: tooltip,
        child: TextButton(
          onPressed: () => Navigator.pushReplacementNamed(context, route),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildBtn(
          context: context,
          name: 'Home',
          route: HomePage.name,
          tooltip: 'Home Page',
        ),
        buildBtn(
          context: context,
          name: 'Admin',
          route: AdminPage.name,
          tooltip: 'Admin Page',
        ),
        buildBtn(
          context: context,
          name: 'Stats',
          route: 'Stats',
          tooltip: 'Stats Page - not yet',
        ),
      ],
    );
  }
}
