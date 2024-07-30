import '../../../data/services/product_service.dart';
import 'widgets/product_item.dart';
import 'package:flutter/material.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  // final ProductService productService = ProductService();

  late Future<List<dynamic>?> getProducts;

  @override
  void initState() {
    getProducts = ProductService().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: FutureBuilder(
        future: getProducts,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          List products = snapshot.data!;
          return ListView.separated(
            separatorBuilder: (_, index) {
              return const SizedBox(height: 10);
            },
            itemCount: products.length,
            itemBuilder: (_, index) {
              Map<String, dynamic> product = products[index];
              return ProductItem(
                image: product['image'],
                title: product['title'],
                productId: product['id'],
              );
            },
          );
        },
      ),
    );
  }
}
