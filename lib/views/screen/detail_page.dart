import 'package:flutter/material.dart';

import '../../utills/product_utils.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    Map<String, dynamic> product =
        (ModalRoute.of(context)?.settings.arguments ?? allProducts[0])
            as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          //ThumbNailView
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                product['images'].length,
                (index) => Container(
                  height: size.height * 0.3,
                  width: size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(product['images'][index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: const EdgeInsets.all(
                    10,
                  ),
                ),
              ),
            ),
          ),
          const Spacer(),
          //DetailsCard
          Container(
            height: size.height * 0.5,
            width: size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 6,
                  spreadRadius: 3,
                  offset: Offset(0, -2),
                ),
              ],
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['title'],
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          late SnackBar snackBar;
          if (cartItems.contains(product)) {
            cartItems.remove(product);
            snackBar = SnackBar(
              content: Text("${product['title']} removed from the CART !!"),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            );
          } else {
            cartItems.add(product);
            snackBar = SnackBar(
              content: Text("${product['title']} added to the CART !!"),
              backgroundColor: Colors.green,
              behavior: SnackBarBehavior.floating,
            );
          }

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        icon: const Icon(Icons.shopping_cart),
        label: const Text("Add to cart"),
      ),
    );
  }
}
