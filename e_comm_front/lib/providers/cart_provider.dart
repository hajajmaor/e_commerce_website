import 'dart:convert';

import 'package:e_comm_front/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:e_comm_front/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductModel> _products = [];
  CartProvider() {
    _getData();
  }
  Future<void> addToCart(ProductModel product) async {
    final result = await http.post(
      dServerUrl.replace(path: 'api/cart/add_to_cart'),
      body: {'oid': product.objectId},
    );
    _getData();
  }

  Future<void> _getData() async {
    _products.clear();
    final _url = dServerUrl.replace(path: 'api/cart/get_all');
    final result = await http.get(
      _url,
    );
    final data = jsonDecode(result.body);
    for (final item in data) {
      final temp = Map<String, dynamic>.from(item as Map);
      // temp['_id'] = Map<String, dynamic>.from(temp['_id'] as Map);
      _products.add(ProductModel.fromJsonMap(temp));
    }
    notifyListeners();
  }

  Future<void> removeFromCart(ProductModel product) async {
    final _url = dServerUrl.replace(path: 'api/cart/remove_from_cart');
    await http.delete(
      _url,
      body: {'oid': product.objectId},
    );
    _getData();
  }

  List<ProductModel> get getCurrentCart => _products;
  void refresh() {
    _getData();
  }

  Future<void> buyCart() async {
    final _url = dServerUrl.replace(path: 'api/cart/buy');
    await http.get(_url);
    _getData();
  }

  double get getCartPrice {
    double sum = 0;
    for (final item in _products) {
      sum += item.price;
    }
    return sum;
  }
}
