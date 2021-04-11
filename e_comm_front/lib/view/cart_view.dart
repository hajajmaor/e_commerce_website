import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:e_comm_front/main.dart' show cartProvider;
import 'package:e_comm_front/models/product_model.dart' show ProductModel;
import 'package:e_comm_front/view/product/product_in_cart.dart'
    show ProductInCart;

class CartView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    /// ref to the state of the cart
    final cartData = watch(cartProvider);

    /// Map the items to show in groups
    final Map<ProductModel, int> mapProductCoud = {};

    for (final element in cartData.getCurrentCart) {
      if (!mapProductCoud.containsKey(element)) {
        mapProductCoud[element] = 1;
      } else {
        mapProductCoud[element] = mapProductCoud[element]! + 1;
      }
    }

    return Container(
      color: Theme.of(context).cardColor,
      height: MediaQuery.of(context).size.height,
      width: 300,
      child: Column(
        children: [
          Text(
            'Cart',
            style: Theme.of(context).textTheme.headline2,
          ),
          const Divider(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: mapProductCoud.keys.length,
              itemBuilder: (_, index) => ProductInCart(
                model: mapProductCoud.keys.elementAt(index),
                quantity: mapProductCoud[mapProductCoud.keys.elementAt(index)]!,
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            // height: 100,
            padding: const EdgeInsets.only(
              bottom: 20,
            ),
            color: Theme.of(context).highlightColor,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Total:',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      '${cartData.getCartPrice}\$',
                      style: Theme.of(context).textTheme.headline4,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.monetization_on),
                    onPressed: () => cartData.buyCart(),
                    label: Text(
                      'Buy Now',
                      style: Theme.of(context).textTheme.button!.apply(
                            fontSizeDelta: 10,
                            // fontSize: 20,
                          ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
