import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 350,
        child: Card(
          color: Colors.white,
          shadowColor: Colors.grey.shade300,
          elevation: 50,
          child: Image.network(image),
        ),
      ),
    );
  }
}
