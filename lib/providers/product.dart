import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String discription;
  Map<String, List<String>> imageUrl;
  final String type;
  bool isFav;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.discription,
    required this.type,
    this.isFav = false,
  });
}
