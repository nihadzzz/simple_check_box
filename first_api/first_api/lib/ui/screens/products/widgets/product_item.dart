import 'package:flutter/material.dart';

import '../../product_details/product_details.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    this.products,
    required this.image,
    required this.title,
    required this.productId,
  });

  final dynamic products;
  final String image;
  final String title;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int id = productId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(id: id),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 51, 50, 50),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image.network(
                  image,
                  height: 200,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
