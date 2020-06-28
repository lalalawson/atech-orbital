import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinData extends ChangeNotifier {
  int _coins = 0;

  int get numOfCoins {
    return _coins;
  }

  void addCoins(int num) {
    _coins += num;
    notifyListeners();
  }
}
