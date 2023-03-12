import 'dart:math';
import 'package:flutter/material.dart';

class SpinViewModel with ChangeNotifier {
  final List _discount = [];
  bool _loading = false;
  bool get loading => _loading;
  bool _confettiLoading = false;
  bool get confettiLoading => _confettiLoading;
  bool _leverLoading = false;
  bool get leverLoading => _leverLoading;
  bool _slotMachineLoading = true;
  bool get slotMachineLoading => _slotMachineLoading;
  List get discount => _discount;
  List get list => [
        {'position': 0.87, 'value': 4},
        {'position': 0.75, 'value': 3},
        {'position': 0.63, 'value': 2},
        {'position': 0.51, 'value': 1},
        {'position': 0.39, 'value': 0},
        {'position': 0.27, 'value': 5},
        {'position': 0.157, 'value': 4},
        {'position': 0.04, 'value': 3},
        {'position': -0.08, 'value': 2},
        {'position': -0.2, 'value': 1},
        {'position': -0.32, 'value': 0},
        {'position': -0.44, 'value': 5},
        {'position': -0.56, 'value': 4},
        {'position': -0.68, 'value': 3},
        {'position': -0.8, 'value': 2},
        {'position': -0.912, 'value': 1},
        {'position': -1.03, 'value': 0},
      ];

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  showConfetti(bool value) {
    _confettiLoading = value;
    notifyListeners();
  }

  showLever(bool value) {
    _leverLoading = value;
    notifyListeners();
  }

  showSlotMachine(bool value) {
    _slotMachineLoading = value;
    notifyListeners();
  }

  double random() {
    final random = Random();
    int index = random.nextInt(list.length);
    var element = list[index]['position'];
    discount.add(list[index]['value']);
    return element;
  }
}
