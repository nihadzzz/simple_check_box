import 'package:flutter/material.dart';
import '../../product_details_screen/products_details.dart';
import '../../widgets/add_button.dart';
import 'product_card_widget/card_image.dart';
import 'product_card_widget/card_texts.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.category,
    required this.title,
    required this.price,
    required this.productId,
  });

  final String image;
  final String category;
  final String title;
  final double price;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        int id = productId;
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsDetails(id: id),
          ),
        );
      },
      child:  Padding(
        padding: const EdgeInsets.only(left: 10, right: 10,),
        child: SizedBox(
          width: 300,
          height: 300,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                const Button(buttonIcon: Icons.add),
                CardImage(image: image),
                CardTexts(
                  category: category,
                  title: title,
                  price: price,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
