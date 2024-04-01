import 'dart:convert';

import 'package:http/http.dart' as http;

import './cart_provider.dart';
import 'package:flutter/material.dart';

class Order {
  final String id;
  final List<Cart> orderData;
  final double totalAmount;
  final DateTime dateTime;
  Order({
    required this.id,
    required this.orderData,
    required this.dateTime,
    required this.totalAmount,
  });
}

class OrderItem with ChangeNotifier {
  List<Order> _item = [];

  List<Order> get item {
    return [..._item];
  }

  Future<void> addOrder(List<Cart> cartProducts, double amount) async {
    final realTime = DateTime.now();
    final url = Uri.parse(
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/orders.json');
    try {
      final response = await http.post(url,
          body: json.encode({
            'amount': amount,
            'datatime': realTime.toIso8601String(),
            'orderData': cartProducts
                .map(
                  (e) => {
                    'id': e.id,
                    'title': e.title,
                    'price': e.price,
                    'imageUrl': e.imageUrl,
                    'quantity': e.quantity,
                    'type': e.type,
                  },
                )
                .toList(),
          }));
      _item.insert(
        0,
        Order(
            id: response.body,
            orderData: cartProducts,
            dateTime: realTime,
            totalAmount: amount),
      );
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> fetchOrders() async {
    Map<String, dynamic>? getOrderData;
    final url = Uri.parse(
        'https://ecomproject-8ccb9-default-rtdb.firebaseio.com/orders.json');
    try {
      final response = await http.get(url);
      final List<Order> loadOrder = [];

      if (response.statusCode <= 400) {
        getOrderData = json.decode(response.body) != null
            ? json.decode(response.body) as Map<String, dynamic>
            : null;

        getOrderData?.forEach((orderId, orderData) {
          loadOrder.add(
            Order(
                id: orderId,
                dateTime: DateTime.parse(orderData['datatime']),
                totalAmount: orderData['amount'],
                orderData: (orderData['orderData'] as List<dynamic>)
                    .map(
                      (item) => Cart(
                        id: item['id'],
                        title: item['title'],
                        price: item['price'],
                        type: item['type'],
                        imageUrl: item['imageUrl'],
                        quantity: item['quantity'],
                      ),
                    )
                    .toList()),
          );
        });
        _item = loadOrder;
        print(_item.length);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print('error');
      print(e);
      rethrow;
    }
  }
}
