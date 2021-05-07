import 'package:flutter/material.dart';

import 'package:e_comm_front/pages/admin.dart' show AdminPage;
import 'package:e_comm_front/pages/home.dart' show HomePage;
import 'package:e_comm_front/view/cart_icon.dart' show CartIcon;

import 'toggle_backend.dart' show ToggleBackend;

Tooltip _buildNavBarBtn({
  required BuildContext context,
  required String name,
  required String route,
  required String tooltip,
}) =>
    Tooltip(
      message: tooltip,
      child: TextButton(
        onPressed: () => Navigator.pushReplacementNamed(
          context,
          route,
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

AppBar getAppBar(
  BuildContext context,
) =>
    AppBar(
      leading: CartIcon(),
      actions: [
        const ToggleBackend(),
        _buildNavBarBtn(
          context: context,
          name: 'Home',
          route: HomePage.name,
          tooltip: 'Home Page',
        ),
        _buildNavBarBtn(
          context: context,
          name: 'Admin',
          route: AdminPage.name,
          tooltip: 'Admin Page',
        ),
        _buildNavBarBtn(
          context: context,
          name: 'Stats',
          route: 'Stats',
          tooltip: 'Stats Page - not yet',
        ),
      ],
    );
