import 'package:flutter/material.dart';
import 'package:vac/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    id: '',
    name: '',
    email: '',
    password: '',
    address: '',
    type: '',
    token: '',
  );
  User get user => _user;
  void setUser(String user) {
    debugPrint("JERe");
    _user = User.fromJson(user);
    notifyListeners();
  }

  logout() {
    return _user = User(
      id: '',
      name: '',
      email: '',
      password: '',
      address: '',
      type: '',
      token: '',
    );
  }
}
