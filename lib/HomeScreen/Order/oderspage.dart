import '/HomeScreen/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/providers/order_provider.dart';
import 'package:intl/intl.dart';

// import '..../providers/order_providers.dart';
class MyOrders extends StatelessWidget {
  static const routeName = 'orderPage';
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderItem>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'basket.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                order.fetchOrders();
              },
              icon: Icon(Icons.save))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<OrderItem>(context, listen: false).fetchOrders(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (dataSnapshot.error != null) {
            return Center(
              child: Text('No Internet :('),
            );
          } else {
            return Column(
              children: [
                Container(
                  child: Text('Orders'),
                ),
                Expanded(
                    child: order.item.isEmpty
                        ? const Center(
                            child: Text('No Orders Yet'),
                          )
                        : ListView.builder(
                            itemCount: order.item.length,
                            itemBuilder: (context, i) {
                              return Card(
                                margin: EdgeInsets.all(10),
                                child: ExpansionTile(
                                    collapsedShape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide.none,
                                    ),
                                    title: Text(
                                        '\$${order.item[i].totalAmount.toStringAsFixed(2)}'),
                                    subtitle: Text(
                                        DateFormat('dd/MM/yyyy hh:mm')
                                            .format(order.item[i].dateTime)),
                                    children: order.item[i].orderData
                                        .map(
                                          (prod) => Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Container(
                                                width: 200,
                                                child: Text(
                                                  prod.title,
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                '${prod.quantity}x \$${prod.price}',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.grey,
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                        .toList()),
                              );
                            },
                          )),
              ],
            );
          }
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
