import 'package:flutter/material.dart';
import 'package:new_ecommers_app/views/components/product_card.dart';

import '../../utills/product_utils.dart';

Widget categoryView({
  required Size size,
  required String category,
  required BuildContext context,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      //Title
      Text(
        category.replaceFirst(category[0], category[0].toUpperCase()),
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      //CategorySlide
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: allProducts
              .map(
                (e) => e['category'] == category
                    ? productCard(
                        context: context,
                        size: size,
                        product: e,
                      )
                    : Container(),
              )
              .toList(),
        ),
      ),
      SizedBox(
        height: size.height * 0.03,
      ),
    ],
  );
}
