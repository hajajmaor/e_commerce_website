import 'package:e_comm_front/pages/admin.dart';
import 'package:e_comm_front/providers/cart_provider.dart';
import 'package:e_comm_front/pages/home.dart';
import 'package:e_comm_front/providers/products_provider.dart';
import 'package:e_comm_front/providers/server_provider.dart';
import 'package:e_comm_front/view/undefined_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

final cartProvider = ChangeNotifierProvider(
  (ref) => CartProvider(),
);
final productsProvider = ChangeNotifierProvider(
  (ref) => ProductsProvider(),
);
final serverProvider = ChangeNotifierProvider((ref) => ServerProvider());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Comm Front',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.name,
      routes: {
        "/": (context) => const HomePage(),
        HomePage.name: (context) => const HomePage(),
        AdminPage.name: (context) => const AdminPage(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UndefinedView(
          name: settings.name!,
        ),
      ),
    );
  }
}
