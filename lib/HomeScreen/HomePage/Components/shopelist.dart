// import 'package:clothes_app/HomeScreen/HomePage/productpage.dart';
import '/HomeScreen/HomePage/Components/productlist.dart';
import '/providers/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopeList extends StatelessWidget {
  final String filterVariable;
  ShopeList(this.filterVariable);
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).fliterItem(filterVariable);
    return Container(
      // padding: const EdgeInsets.only(
      //   top: 15,
      //   bottom: 15,
      //   // right: 10,
      // ),
      margin: const EdgeInsets.only(
        top: 10,
        left: 20,
        bottom: 10,
        right: 20,
      ),
      height: 300,
      // width: 440,
      // color: Colors.amber,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return ProductPageList(
            products[i].id,
            products[i].title,
            products[i].price,
            products[i].imageUrl.keys.single,
            products[i].discription,
          );
        },
      ),
    );
  }
}
