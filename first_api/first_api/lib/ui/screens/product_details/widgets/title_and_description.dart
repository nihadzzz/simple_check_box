import 'package:flutter/material.dart';

class TitleAndDescription extends StatelessWidget {
  const TitleAndDescription({
    super.key,
    required this.category,
    required this.title,
    required this.description,
  });

  final String category;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Category: $category',
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text('Description'),
              const SizedBox(height: 5),
              Text(description)
            ],
          ),
        ),
      ),
    );
  }
}
