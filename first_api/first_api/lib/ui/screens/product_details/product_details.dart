import 'widgets/detail_buttons.dart';
import 'widgets/image_card.dart';
import 'widgets/price_and_ratings.dart';
import 'widgets/title_and_description.dart';
import 'package:flutter/material.dart';

import '../../../data/services/product_service.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  final ProductService productService = ProductService();

  late Future<Map<String, dynamic>?> getProductsById;

  @override
  void initState() {
    getProductsById = productService.getProductById(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: FutureBuilder(
        future: getProductsById,
        builder: (_, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          Map productById = snapshot.data!;
          return Column(
            children: [
              ImageCard(
                image: productById['image'],
              ),
              TitleAndDescription(
                category: productById['category'],
                title: productById['title'],
                description: productById['description'],
              ),
              const SizedBox(height: 23),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    PriceAndRatings(
                      price: productById['price'],
                      rate: productById['rating']['rate'],
                    ),
                    const SizedBox(width: 10),
                    const DetailButtons()
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
