import 'dart:convert';

import 'package:e_comm_front/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:e_comm_front/models/product_model.dart';

class ProductsProvider extends ChangeNotifier {
  final List<ProductModel> _products = [];
  ProductsProvider() {
    _getData();
  }

  // Future<void> addToCart(ProductModel product) async {
  //   final result = await http.post(
  //     dServerUrl.replace(path: 'api/product/get_all'),
  //     body: {'oid': product.objectId},
  //   );
  //   _getData();
  // }

  Future<void> _getData() async {
    _products.clear();
    final _url = dServerUrl.replace(path: 'api/product/get_all');
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

  Future<void> removeFromStore(ProductModel product) async {
    final _url = dServerUrl.replace(path: 'api/product/remove');
    await http.delete(
      _url,
      body: {'oid': product.objectId},
    );
    _getData();
  }

  Future<void> updateProduct(ProductModel product) async {
    final body = product.toMapAll();
    final _url =
        dServerUrl.replace(path: 'api/product/update', queryParameters: body);
    final result = await http.post(
      _url,
      // headers: {"Access-Control-Allow-Origin": "*"},
      // body: body,
    );
    _getData();
  }

  List<ProductModel> get getCurrentCart => _products;

  Future<void> createNewProduct(ProductModel product) async {
    final body = product.toMapOnlyData();
    final _url = dServerUrl.replace(path: 'api/product/create');
    await http.post(
      _url,
      body: body,
    );
    _getData();
  }

  void refresh() {
    _getData();
  }
}
