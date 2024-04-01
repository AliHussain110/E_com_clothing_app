import 'package:flutter/material.dart';

class Category {
  final String name;

  Category(this.name);
}

class CategoryItem with ChangeNotifier {
  List<Category> _item = [
    Category('Men'),
    Category('Boys'),
    Category('Women'),
    Category('Kids'),
  ];
  List<Category> get item {
    return [..._item];
  }
}
