import 'package:e_comm_front/main.dart';
import 'package:e_comm_front/view/product/product_in_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final cartData = watch(cartProvider);
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
            child: ListView(
              children: cartData.getCurrentCart
                  .map(
                    (e) => ProductInCart(
                      model: e,
                    ),
                  )
                  .toList(),
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
