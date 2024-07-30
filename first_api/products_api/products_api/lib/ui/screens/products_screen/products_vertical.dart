import 'package:flutter/material.dart';

import '../../../data/models/product_model.dart';
import '../../../data/services/products_service.dart';
import '../../widgets/bottom_nav_bar.dart';
import '../product_details_screen/products_details.dart';

class ProductsVertical extends StatefulWidget {
  const ProductsVertical({super.key});

  @override
  State<ProductsVertical> createState() => _ProductsVerticalState();
}

class _ProductsVerticalState extends State<ProductsVertical> {
  
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
          Expanded(
            child: FutureBuilder(
              future: getProducts,
              builder: (_, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
                List<ProductModel> products = snapshot.data!;
                return ListView.separated(
                  separatorBuilder: (_, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: products.length,
                  itemBuilder: (_, index) {
                    ProductModel product = products[index];
                    return GestureDetector(
                      onTap: () {
                        int id = product.id;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductsDetails(id: id),
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
                                  product.image,
                                  height: 200,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  product.title,
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
                  },
                );
              },
            ),
          ),
          const Stack(
            children: [BottomNavBar()],
          )
        ],
      ),
    );
  }
}
