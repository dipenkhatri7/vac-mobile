import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:vac/constants/errorHandle.dart';
import 'package:vac/models/user.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/providers/userProvider.dart';

class AuthServices {
  Future<void> singnUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      debugPrint(user.toJson().toString());
      http.Response res = await http.post(
        Uri.parse('${GlobalVariable.uri}/api/v1/users/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint(res.statusCode.toString());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            debugPrint("JHERERE");
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong!')),
      );
    }
  }
}
