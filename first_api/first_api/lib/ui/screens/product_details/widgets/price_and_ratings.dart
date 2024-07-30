import 'package:flutter/material.dart';

class PriceAndRatings extends StatelessWidget {
  const PriceAndRatings({
    super.key,
    required this.price,
    required this.rate,
  });

  final num price;
  final num rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            const Text('Price'),
            Text(
              '\$$price',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        const SizedBox(width: 20),
        const Icon(
          Icons.star,
          color: Colors.orange,
        ),
        Text(
          '$rate',
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
