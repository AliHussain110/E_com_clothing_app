import '/HomeScreen/Drawer/drawer.dart';
import '/HomeScreen/HomePage/Components/productlist.dart';
import '/providers/product_providers.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyFav extends StatelessWidget {
  static const routeName = 'myfavpage';
  @override
  Widget build(BuildContext context) {
    final favProduct = Provider.of<Products>(context).favFilter;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'basket.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Favorite',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
              child: favProduct.isEmpty
                  ? const Center(
                      child: Text('No Fav'),
                    )
                  : Padding(
                      padding: EdgeInsets.all(10),
                      child: GridView.builder(
                          itemCount: favProduct.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height),
                            crossAxisSpacing: 2.4,
                            mainAxisSpacing: 2.5,
                          ),
                          itemBuilder: (context, i) {
                            return ProductPageList(
                              favProduct[i].id,
                              favProduct[i].title,
                              favProduct[i].price,
                              favProduct[i].imageUrl.keys.single,
                              favProduct[i].discription,
                            );
                          }),
                    ))
        ],
      ),
      drawer: MyDrawer(),
    );
  }
}
