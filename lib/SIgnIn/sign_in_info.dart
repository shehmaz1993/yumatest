import 'package:flutter/material.dart';

class SignInInfo extends ChangeNotifier{

  String _userName='';
  String get userName => _userName;
  setUserName(String phoneNumber) {
    _userName = phoneNumber;
    notifyListeners();
  }
  String _password='';
  String get password => _password;
  setPassword(String pass) {
    _password = pass;
    notifyListeners();
  }

}