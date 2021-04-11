import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductInCart extends StatelessWidget {
  final ProductModel model;

  const ProductInCart({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        tileColor: Colors.blueGrey[300],
        leading: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: model.imageUrl,
          placeholder: (_, __) => const CircularProgressIndicator(),
          errorWidget: (_, __, ___) => const FlutterLogo(
            style: FlutterLogoStyle.stacked,
            size: 50,
          ),
        ),
        title: Text(model.title),
        subtitle: Text('${model.price}\$'),
        trailing: IconButton(
          tooltip: 'Remove item from cart',
          icon: const Icon(Icons.remove_circle),
          onPressed: () {
            context.read(cartProvider).removeFromCart(model);
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
