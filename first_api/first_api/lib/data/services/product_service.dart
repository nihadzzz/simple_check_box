import 'dart:convert';

import 'package:http/http.dart';

class ProductService {
  Future<List?> getProducts() async {
    final Uri productsUrl = Uri.parse("https://fakestoreapi.com/products");
    final Response response = await get(productsUrl);

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data;
    }
    throw Exception();
  }

  Future<Map<String, dynamic>?> getProductById(int id) async {
    final Uri productUrl = Uri.parse("https://fakestoreapi.com/products/$id");
    final Response productDataById = await get(productUrl);

    if (productDataById.statusCode == 200) {
      final Map<String, dynamic> productData = jsonDecode(productDataById.body);
      return productData;
    }
    throw Exception();
  }
}
