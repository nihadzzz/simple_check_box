import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  const CardImage({
    super.key,
    required this.image,
  });
  
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: 300,
      width: 300,
    );
  }
}
