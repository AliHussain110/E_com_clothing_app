import 'package:clothes_app/HomeScreen/addproduct/editproduct.dart';

import '/providers/product_providers.dart';
import '/HomeScreen/Drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddProduct extends StatelessWidget {
  static const routeName = 'addproductpage';
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'basket.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         product.uploadItem();
        //       },
        //       icon: Icon(Icons.save)),
        // ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
            EditProductPage.routeName,
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          const Text('Your Products'),
          product.item.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text('No Product Found'),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: product.item.length,
                    itemBuilder: (context, i) {
                      return Dismissible(
                        key: ValueKey(product.item[i].id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          padding: const EdgeInsets.all(8),
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          child: const Icon(Icons.delete),
                        ),
                        onDismissed: (direction) {
                          print(product.item[i].id);
                          product.removeProduct(product.item[i].id);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: ListTile(
                                title: Text(product.item[i].title),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    product.item[i].imageUrl.keys.single,
                                  ),
                                  onBackgroundImageError: (context, error) {
                                    const NetworkImage('assets/img10.jpg');
                                  },
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed(
                                      EditProductPage.routeName,
                                      arguments: product.item[i].id,
                                    );
                                  },
                                  color: Theme.of(context).primaryColor,
                                ),
                              )),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
