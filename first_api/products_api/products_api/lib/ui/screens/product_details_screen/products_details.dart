import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import '../../../data/services/products_service.dart';
import 'widgets/rating_widget.dart';
import '../../widgets/bottom_nav_bar.dart';

import '../widgets/add_button.dart';

class ProductsDetails extends StatefulWidget {
  const ProductsDetails({super.key, required this.id});
  final int id;

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  late Future<ProductModel> getProductById;

  @override
  void initState() {
    getProductById = ProductsService().getProductById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        actions: const [
          Button(buttonIcon: Icons.add),
        ],
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      ),
      body: FutureBuilder(
        future: ProductsService().getProductById(widget.id),
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          ProductModel product = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Column(
                children: [
                  Image.network(
                    product.image,
                    width: 300,
                    height: 300,
                  ),
                  const SizedBox(height: 30),
                  Text('Category: ${product.category}'),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RatingWidget(rating: product.rating.rate),
                      const SizedBox(width: 10),
                      Text(
                        '${product.rating.count} reviews',
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  const BottomNavBar()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
