import 'package:e_comm_front/pages/admin.dart';
import 'package:e_comm_front/pages/home.dart';
import 'package:flutter/material.dart';

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
      leading: Stack(
        alignment: Alignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: const Text(
              '5',
              style: TextStyle(
                backgroundColor: Colors.red,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      actions: [
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
