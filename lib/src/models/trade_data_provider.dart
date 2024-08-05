import 'package:flutter/material.dart';

class TradeDataProvider with ChangeNotifier {
  String _latestPrice = 'No price data';

  String get latestPrice => _latestPrice;

  void updatePrice(String newPrice) {
    // if newPrice and prevPrice are same no need to update the UI
    if (_latestPrice != newPrice) {
      _latestPrice = newPrice;
      notifyListeners();
    }
  }
}
