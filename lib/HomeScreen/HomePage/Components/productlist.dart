import 'package:clothes_app/HomeScreen/HomePage/productpage.dart';
import 'package:flutter/material.dart';

class ProductPageList extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  final String discription;
  ProductPageList(
    this.id,
    this.title,
    this.price,
    this.imageUrl,
    this.discription,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductScreen.routeName,
          arguments: id,
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 150,
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: 200,
                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage(
                //       imageUrl,
                //     ),
                //     fit: BoxFit.cover,
                //   ),
                // ),
                child: Hero(
                  tag: id,
                  child: FadeInImage(
                    placeholder: AssetImage('assets/imgp.png'),
                    // image: AssetImage('assets/imgp.png'),
                    image: NetworkImage(
                      imageUrl,
                    ),
                    fit: BoxFit.cover,
                    imageErrorBuilder: (ctx, child, error) {
                      return Image.asset(
                        'assets/imgp.png',
                        // height: 220,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                '\$$price',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                title.toString(),
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
