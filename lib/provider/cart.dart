import 'package:flutter/cupertino.dart';
import 'dart:math';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  int quantity;
  final double price;
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    this.quantity = 1,
    required this.price,
    required this.imageUrl,
  });

  void quantityTracker(String op) {
    if (op == 'plus') {
      quantity = quantity + 1;
    } else {
      quantity = max(quantity - 1, 1);
    }
    notifyListeners();
  }
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get total {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void totalAmount() {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    notifyListeners();
  }

  void addToCart(
      {required String productId,
      required String title,
      required int quantity,
      required double price,
      required String imageUrl}) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (existingItem) {
        return CartItem(
            id: existingItem.id,
            title: existingItem.title,
            quantity: existingItem.quantity + quantity,
            price: existingItem.price,
            imageUrl: existingItem.imageUrl);
      });
    } else {
      _items.putIfAbsent(productId, () {
        return CartItem(
            id: DateTime.now().toString(),
            title: title,
            quantity: quantity,
            price: price,
            imageUrl: imageUrl);
      });
    }
    notifyListeners();
  }

  void removeCartItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
