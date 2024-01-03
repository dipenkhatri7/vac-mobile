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
  void setUser(Map<String, dynamic> user) {
    debugPrint("Inside setUser from userProvider");
    _user = User.fromMap(user);
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
