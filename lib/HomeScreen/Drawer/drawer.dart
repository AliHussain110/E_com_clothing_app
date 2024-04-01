import 'package:clothes_app/HomeScreen/addproduct/addproduct.dart';

import '/HomeScreen/Order/oderspage.dart';
import '/HomeScreen/favourate/favourate.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend!'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MyOrders.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('Favourites'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MyFav.routeName);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop_2),
            title: Text('Products'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AddProduct.routeName);
            },
          ),
        ],
      ),
    );
  }
}
