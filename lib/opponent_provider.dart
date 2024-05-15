import 'package:flutter/material.dart';
import 'package:hci_03/models/friend.dart';
import 'package:hci_03/constants/image_assets.dart';

class OpponentProvider with ChangeNotifier {
  Friend? _currentOpponent;

  Friend? get currentOpponent => _currentOpponent;

  void setCurrentOpponent(Friend opponent) {
    _currentOpponent = opponent;
    notifyListeners();
  }
}
