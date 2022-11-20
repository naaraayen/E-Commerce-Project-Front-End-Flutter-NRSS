import 'package:flutter/material.dart';
import 'dart:math';

class QuantityHandler with ChangeNotifier {
  var currentQuantity = 1;
  void changeQuantity(String getOp) {
    if (getOp == 'plus') {
      currentQuantity = (currentQuantity + 1);
    } else {
      currentQuantity = max((currentQuantity - 1), 1);
    }
    notifyListeners();
  }

  void resetQuantity() {
    currentQuantity = 1;
    notifyListeners();
  }
}
