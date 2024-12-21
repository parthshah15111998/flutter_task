import 'package:flutter/material.dart';

class DashboardProvider extends ChangeNotifier {
  int totalSales = 23569;
  int totalDeals = 1204;
  double avgSale = 12680.0;
  bool _keepLoggedIn = false;

  bool get keepLoggedIn => _keepLoggedIn;

  void toggleKeepLoggedIn(bool? value) {
    _keepLoggedIn = value ?? false;
    notifyListeners();
  }

  void updateTotalSales(int value) {
    totalSales = value;
    notifyListeners();
  }

  void updateTotalDeals(int value) {
    totalDeals = value;
    notifyListeners();
  }

  void updateAvgSale(double value) {
    avgSale = value;
    notifyListeners();
  }
}
