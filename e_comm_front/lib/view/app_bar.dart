import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/pages/admin.dart';
import 'package:e_comm_front/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      leading: Builder(
        builder: (context) => InkWell(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              const Icon(Icons.shopping_cart_outlined),
              Positioned(
                left: 3,
                top: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red[600],
                  ),
                  child: Consumer(
                    builder: (_, watch, __) {
                      final int count =
                          watch(cartProvider).getCurrentCart.length;
                      return Text(
                        '$count',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
