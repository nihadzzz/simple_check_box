import 'package:flutter/material.dart';
import '../../../data/models/product_model.dart';
import '../../../data/services/products_service.dart';
import 'widgets/pics_and_see_all_texts.dart';
import 'widgets/product_card_widget.dart';
import '../../widgets/bottom_nav_bar.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  late Future<List<ProductModel>> getProducts;

  @override
  void initState() {
    getProducts = ProductsService().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        leading: const Icon(
          Icons.album_outlined,
          size: 35,
        ),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 15),
          Icon(Icons.chat_bubble_outline_rounded),
          SizedBox(width: 20),
        ],
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      ),
      body: Column(
        children: [
          const PicsAndSeeAll(),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: FutureBuilder(
              future: getProducts,
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                List<ProductModel> products = snapshot.data!;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    ProductModel product = products[index];
                    return ProductCardWidget(
                      image: product.image,
                      category: product.category,
                      title: product.title,
                      price: product.price,
                      productId: product.id,
                    );
                  },
                );
              },
            ),
          ),
          const Spacer(),
          const BottomNavBar()
        ],
      ),
    );
  }
}
