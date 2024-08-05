import 'package:flutter/material.dart';

class TradeDataProvider with ChangeNotifier {
  String _latestPrice = 'No price data';

  String get latestPrice => _latestPrice;

  void updatePrice(String newPrice) {
    _latestPrice = newPrice;
    notifyListeners();
  }
}
