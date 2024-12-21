import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/login_view/login_view.dart';

class WorkspaceProvider extends ChangeNotifier {
  bool _subscribeToUpdates = false;
  bool _isSecondScreen = false;
  bool _isThirdScreen = false;
  String _currentStep = "1/3";
  Set<String> _selectedOptions = {};

  bool get subscribeToUpdates => _subscribeToUpdates;
  bool get isSecondScreen => _isSecondScreen;
  bool get isThirdScreen => _isThirdScreen;
  String get currentStep => _currentStep;
  Set<String> get selectedOptions => _selectedOptions;

  void toggleSubscribe(bool value) {
    _subscribeToUpdates = value;
    notifyListeners();
  }

  void nextScreen(BuildContext context) {
    if (_isSecondScreen) {
      _isThirdScreen = true;
      _isSecondScreen = false;
      _currentStep = "3/3";
    } else if (_isThirdScreen) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      _isSecondScreen = true;
      _currentStep = "2/3";
    }
    notifyListeners();
  }

  void toggleOption(String option) {
    if (_selectedOptions.contains(option)) {
      _selectedOptions.remove(option);
    } else {
      _selectedOptions.add(option);
    }
    notifyListeners();
  }
}
