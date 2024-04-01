import 'package:clothes_app/HomeScreen/addproduct/editproduct.dart';
import '/HomeScreen/addproduct/addproduct.dart';
import '/HomeScreen/Order/oderspage.dart';
import '/HomeScreen/favourate/favourate.dart';
import '/providers/order_provider.dart';
import '/providers/category.dart';
import '/HomeScreen/HomePage/productpage.dart';
import '/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/HomeScreen/homescreen.dart';
import 'providers/product_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => CartItem()),
        ChangeNotifierProvider(create: (ctx) => CategoryItem()),
        ChangeNotifierProvider(create: (ctx) => OrderItem()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        title: 'Clothes App',
        home: HomeScreen(),
        routes: {
          ProductScreen.routeName: (ctx) => ProductScreen(),
          MyOrders.routeName: (ctx) => MyOrders(),
          MyFav.routeName: (ctx) => MyFav(),
          AddProduct.routeName: (ctx) => AddProduct(),
          EditProductPage.routeName: (ctx) => EditProductPage(),
        },
      ),
    );
  }
}
