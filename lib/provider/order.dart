import 'package:e_commerce_project/provider/cart.dart';
import 'package:flutter/material.dart';

class OrderItem with ChangeNotifier {
  String id;
  List<CartItem> cartProducts;
  double total;

  DateTime dateTime;
  String orderStatus;
  OrderItem(
      {required this.id,
      required this.cartProducts,
      required this.total,
      required this.dateTime,
      required this.orderStatus});
}

class Order with ChangeNotifier {
  final List<OrderItem> _items = [];
  List<OrderItem> get items {
    return _items;
  }

  void addToOrder(List<CartItem> cartProducts, double total) {
    _items.insert(
        0,
        OrderItem(
          id: DateTime.now().toIso8601String(),
          cartProducts: cartProducts,
          total: total,
          dateTime: DateTime.now(),
          orderStatus: 'Pending'
        ));
    notifyListeners();
  }

  OrderItem findOrderById(String orderId) {
    return _items.firstWhere((orderItem) => orderItem.id == orderId);
  }
}
