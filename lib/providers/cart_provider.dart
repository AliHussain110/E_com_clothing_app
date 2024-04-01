import 'package:flutter/material.dart';

class Cart {
  final String id;
  final String title;
  final double price;
  final String type;
  final String imageUrl;
  int quantity;
  Cart({
    required this.id,
    required this.title,
    required this.price,
    required this.type,
    required this.imageUrl,
    this.quantity = 1,
  });
}

class CartItem with ChangeNotifier {
  final Map<String, Cart> _item = {};
  Map<String, Cart> get item {
    return {..._item};
  }

  bool addItem(
    String prodId,
    String prodTitle,
    double prodPrice,
    String prodType,
    int prodQuantity,
    String url,
  ) {
    if (_item.containsKey(prodId)) {
      _item.remove(prodId);
      notifyListeners();

      return false;
    } else {
      _item.putIfAbsent(
        prodId,
        () => Cart(
            id: prodId,
            title: prodTitle,
            price: prodPrice,
            type: prodType,
            imageUrl: url,
            quantity: prodQuantity),
      );
      notifyListeners();

      return true;
    }
  }

  void removeItemFromCart(String id) {
    _item.remove(id);
    notifyListeners();
  }

  double get totalAmount {
    double amount = 0.0;
    _item.forEach((key, value) {
      amount += value.price * value.quantity;
    });
    return amount;
  }

  void addQuantity(String id) {
    if (_item.containsKey(id)) {
      _item.update(
        id,
        (ele) => Cart(
          id: ele.id,
          title: ele.title,
          price: ele.price,
          type: ele.type,
          imageUrl: ele.imageUrl,
          quantity: ele.quantity + 1,
        ),
      );
    }
    notifyListeners();
  }

  void clear() {
    _item.clear();
    notifyListeners();
  }

  void removeQuantity(String id) {
    if (_item.containsKey(id)) {
      _item.update(
        id,
        (ele) => Cart(
          id: ele.id,
          title: ele.title,
          price: ele.price,
          type: ele.type,
          imageUrl: ele.imageUrl,
          quantity: ele.quantity - 1,
        ),
      );
    }
    notifyListeners();
  }
}
