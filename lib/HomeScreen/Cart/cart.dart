import 'package:clothes_app/providers/order_provider.dart';
// import 'package:clothes_app/providers/product_providers.dart';
import 'package:provider/provider.dart';
import '/providers/cart_provider.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final products = Provider.of<Products>(context);
    final CartObj = Provider.of<CartItem>(context);
    return Container(
      margin: const EdgeInsets.all(5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: [
                Container(
                  child: const Text(
                    'Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  // height: 300,
                  // color: Colors.orange,

                  child: CartObj.item.isEmpty
                      ? const Expanded(
                          child: Center(
                            child: Text('Empty Cart'),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemCount: CartObj.item.length,
                            itemBuilder: (ctx, i) => Dismissible(
                              key: ValueKey(CartObj.item.values.toList()[i].id),
                              direction: DismissDirection.startToEnd,
                              background: Container(
                                // alignment: Alignment.centerLeft,
                                color: Colors.red,
                                child: const Icon(
                                  Icons.delete,
                                  size: 25,
                                ),
                              ),
                              onDismissed: (direction) {
                                CartObj.removeItemFromCart(
                                    CartObj.item.keys.toList()[i]);
                              },
                              child: Container(
                                margin: const EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 220,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(CartObj
                                              .item.values
                                              .toList()[i]
                                              .imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      // child: Text('Image'),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: Text(
                                            CartObj.item.values
                                                .toList()[i]
                                                .title,
                                            style: const TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          CartObj.item.values.toList()[i].type,
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        Text(
                                          '\$${CartObj.item.values.toList()[i].price}',
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          child: Row(
                                            children: [
                                              IconButton(
                                                iconSize: 20,
                                                onPressed: () {
                                                  if (CartObj.item.values
                                                          .toList()[i]
                                                          .quantity !=
                                                      1) {
                                                    CartObj.removeQuantity(
                                                        CartObj.item.values
                                                            .toList()[i]
                                                            .id);
                                                  }
                                                },
                                                icon:
                                                    const Icon(Icons.minimize),
                                              ),
                                              Text(
                                                  '${CartObj.item.values.toList()[i].quantity}'),
                                              IconButton(
                                                iconSize: 20,
                                                onPressed: () {
                                                  CartObj.addQuantity(CartObj
                                                      .item.values
                                                      .toList()[i]
                                                      .id);
                                                },
                                                icon: const Icon(Icons.add),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: 120,
            color: Colors.black12,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$${CartObj.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 26,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Consumer<OrderItem>(
                  builder: (ctx, order, ch) => ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[700],
                      minimumSize: const Size(250, 50),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    onPressed: CartObj.item.isEmpty
                        ? null
                        : () {
                            if (CartObj.item.isNotEmpty) {
                              print(CartObj.item.values.toList());
                              order.addOrder(CartObj.item.values.toList(),
                                  CartObj.totalAmount);
                              CartObj.clear();
                            }
                          },
                    child: ch,
                  ),
                  child: const Text(
                    'Proceed to checkout',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
