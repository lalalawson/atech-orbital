import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinData extends ChangeNotifier {
  int _coins = 0;
  List<String> _pets = ['cat'];
  String _currentPet = 'cat';

  int get numOfCoins {
    return _coins;
  }

  List<String> get allPets {
    return _pets;
  }

  String get currentPet {
    return _currentPet;
  }

  void addCoins(int num) {
    _coins += num;
    notifyListeners();
  }

  void removeCoins(int num) {
    _coins -= num;
    notifyListeners();
  }

  void addPet(String petName) {
    _pets.add(petName);
    notifyListeners();
  }

  void changePet(String petName) {
    _currentPet = petName;
    notifyListeners();
  }
}
