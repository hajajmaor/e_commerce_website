import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:e_comm_front/view/nav_bar.dart';
import 'package:e_comm_front/view/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static const name = 'home';
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<ProductModel> _products = watch(productsProvider).getCurrentCart;
    return Scaffold(
      appBar: AppBar(
        actions: [NavBar()],
      ),
      body: Center(
        child: Wrap(
          runSpacing: 5,
          spacing: 10,
          children: _products
              .map(
                (ProductModel element) => ProductView(model: element),
              )
              .toList(),
        ),
      ),
    );
  }
}
