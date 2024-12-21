import 'package:flutter/material.dart';
import 'package:parth_shah_task_1/dashboard_screen/dashboard_screen.dart';

class LoginProvider extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _keepLoggedIn = false;
  bool isObscure = false;

  String get email => _email;
  String get password => _password;
  bool get keepLoggedIn => _keepLoggedIn;

  void visibilityPassword(){
    isObscure = !isObscure;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void toggleKeepLoggedIn(bool? value) {
    _keepLoggedIn = value ?? false;
    notifyListeners();
  }

  void signIn(BuildContext context) {
    if (_email.isNotEmpty && _password.isNotEmpty) {

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Successful!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter all details!")),
      );
    }
  }
}
