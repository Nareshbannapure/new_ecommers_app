import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../utills/route_utils.dart';

Widget productCard({
  required Size size,
  required Map<String, dynamic> product,
  required BuildContext context,
}) {
  return Stack(
    alignment: Alignment.topRight,
    children: [
      //ProductCard
      GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(
            MyRoutes.detailPage,
            arguments: product,
          );
        },
        child: Container(
          height: size.height * 0.25,
          width: size.width * 0.3,
          margin: const EdgeInsets.only(
            right: 5,
            bottom: 10,
          ),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 5,
                offset: Offset(3, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.13,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: NetworkImage(
                      product['thumbnail'],
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                product['title'],
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                product['category'],
              ),
              Row(
                children: [
                  Text(
                    "${product['price']}/",
                    style: const TextStyle(
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.red,
                      decorationThickness: 1.5,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.02,
                  ),
                  Text(
                      "\$ ${((product['price'] - (product['price'] * product['discountPercentage'] / 100)).toString().split('.')[0])}"),
                ],
              ),
              const Spacer(),
              RatingBarIndicator(
                rating: double.parse(product['rating'].toString()),
                itemCount: 5,
                itemSize: 15,
                itemBuilder: (context, index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
              ),
            ],
          ),
        ),
      ),
      //Label
      Positioned(
        right: 5,
        child: Container(
          height: size.height * 0.03,
          width: size.width * 0.11,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
            ),
          ),
          alignment: const Alignment(1, 0),
          child: Text(
            "-${product['discountPercentage']}%",
            style: const TextStyle(
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
      ),
    ],
  );
}
