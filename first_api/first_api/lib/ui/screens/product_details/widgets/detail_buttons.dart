import 'package:flutter/material.dart';

class DetailButtons extends StatelessWidget {
  const DetailButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Icon(
            Icons.favorite,
            color: Colors.grey,
          ),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black,
          ),
          child: const Text('ADD TO CART'),
        ),
      ],
    );
  }
}
