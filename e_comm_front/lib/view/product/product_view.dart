import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductView extends StatelessWidget {
  final ProductModel model;

  const ProductView({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 340,
      width: 300,
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(model.title),
              subtitle: Text('${model.price}\$'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CachedNetworkImage(
                height: 150,
                fit: BoxFit.fill,
                imageUrl: model.imageUrl,
                placeholder: (_, __) => const CircularProgressIndicator(),
                errorWidget: (_, __, ___) => const FlutterLogo(
                  style: FlutterLogoStyle.stacked,
                  size: 50,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                model.description,
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButton(
                onPressed: () {
                  context.read(cartProvider).addToCart(model);
                },
                child: const Text('Buy'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
