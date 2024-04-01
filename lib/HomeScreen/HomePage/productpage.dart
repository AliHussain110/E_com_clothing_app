import 'package:clothes_app/providers/cart_provider.dart';
import '/providers/product_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  static const routeName = 'productScreen';
  @override
  Widget build(BuildContext context) {
    final String productId =
        ModalRoute.of(context)?.settings.arguments as String;
    final product = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);

    final List<String> allItems =
        product.imageUrl.values.expand((value) => value).toList();

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                Hero(
                  tag: productId,
                  child: Container(
                    height: 470,
                    width: double.infinity,

                    // decoration: BoxDecoration(
                    //   image: DecorationImage(
                    //       image: AssetImage(
                    //         product.imageUrl.keys.single,
                    //       ),
                    //       fit: BoxFit.cover,
                    //       onError: (ctx, error) {
                    //         NetworkImage(product.imageUrl.keys.single);
                    //       }),
                    // ),
                    child: Image.network(
                      product.imageUrl.keys.single,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        'assets/img10.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[350],
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 15,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[350],
                    child: IconButton(
                      iconSize: 18,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.switch_access_shortcut_outlined,
                        color: Colors.black,
                        // weight: 1000,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 1,
                  right: 30,
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.orange[700],
                    child: Consumer<Products>(
                      builder: (context, prod, _) => IconButton(
                        iconSize: 30,
                        onPressed: () {
                          prod.toggleFavStatus(product);
                        },
                        icon: Icon(
                          product.isFav
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Famous Brand',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    '\$${product.price}',
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ExpansionTile(
            initiallyExpanded: true,
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: const Text(
              'Images',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            children: [
              Container(
                // color: Colors.amber,
                // padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 15, right: 10),
                height: 300,
                child: ListView.builder(
                  itemCount: allItems.length,
                  itemBuilder: (context, i) {
                    return Container(
                        margin: const EdgeInsets.only(
                          left: 5,
                          right: 5,
                        ),
                        height: 150,
                        width: 200,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     image: AssetImage(allItems[i],),
                        //     fit: BoxFit.cover,
                        //     onError: (ctx, error) {
                        //       NetworkImage(allItems[i]);
                        //     },
                        //   ),
                        // ),
                        child: Image.network(
                          allItems[i],
                          fit: BoxFit.cover,
                        ));
                  },
                  scrollDirection: Axis.horizontal,
                ),
              )
            ],
          ),
          ExpansionTile(
            collapsedShape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            shape: const RoundedRectangleBorder(
              side: BorderSide.none,
            ),
            title: const Text(
              'Info',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            children: [
              Text(product.discription),
              // Text('data'),
              // Text('data'),
              // Text('data'),
              // Text('data'),
              // Text('data'),
            ],
          ),
          const ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              title: Text(
                'Delivery and Return',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              childrenPadding: EdgeInsets.all(15),
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Free delivery for all orders above \$200'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Free delivery for all orders above \$200'),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      color: Colors.orange,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Free delivery for all orders above \$200'),
                  ],
                ),
              ]),
          const ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              title: Text(
                'Reviews',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ]),
          const ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              title: Text(
                'Material',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ]),
          const ExpansionTile(
              collapsedShape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              shape: RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              title: Text(
                'Additional information',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              children: [
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ]),
          const SizedBox(
            height: 25,
          ),
          UnconstrainedBox(
            child: Consumer<CartItem>(
              builder: (context, cartObject, _) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange[700],
                  minimumSize: Size(300, 60),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                child: const Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  bool isCart = cartObject.addItem(
                      product.id,
                      product.title,
                      product.price,
                      product.type,
                      1,
                      product.imageUrl.keys.single);
                  // print(product.isCart);
                  // product.toggleCartItem();
                  // print(product.isCart);

                  isCart
                      ? ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text('Added to cart'),
                          duration: Duration(seconds: 2),
                        ))
                      : ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                          content: Text('Removed to cart'),
                          duration: Duration(seconds: 2),
                        ));
                  print('added to cart');
                },
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
