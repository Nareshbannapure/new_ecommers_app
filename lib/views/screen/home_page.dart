import 'package:flutter/material.dart';

import '../../utills/product_utils.dart';
import '../../utills/route_utils.dart';
import '../components/category_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(
                MyRoutes.cartPage,
              );
            },
            icon: const Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: allCategories
                .map(
                  (e) => categoryView(
                    context: context,
                    size: size,
                    category: e,
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
