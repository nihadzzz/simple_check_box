import 'package:flutter/material.dart';

class CardTexts extends StatelessWidget {
  const CardTexts({
    super.key,
    required this.category,
    required this.title,
    required this.price,
  });
  final String category;
  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 13, left: 13),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              'Category: $category',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              '\$$price',
              style: const TextStyle(
                color: Colors.brown,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
