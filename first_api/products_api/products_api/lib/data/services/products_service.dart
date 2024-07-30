import 'dart:convert';

import 'package:http/http.dart';

import '../models/product_model.dart';

class ProductsService {
  Future<List<ProductModel>> getProducts() async {
    final Uri productsUrl = Uri.parse('https://fakestoreapi.com/products');
    final Response response = await get(productsUrl);

    if (response.statusCode == 200) {
      final List products = jsonDecode(response.body);
      return products.map((product) => ProductModel.fromJson(product)).toList();
    }
    throw Exception();
  }

  Future<ProductModel> getProductById(int id) async {
    final Uri productUrl = Uri.parse('https://fakestoreapi.com/products/$id');
    final Response response = await get(productUrl);

    if (response.statusCode == 200) {
      final Map<String, dynamic> product = jsonDecode(response.body);
      return ProductModel.fromJson(product);
    }
    throw Exception();
  }
}
