import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vac/constants/errorHandle.dart';
import 'package:vac/models/user.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/providers/userProvider.dart';

class AuthServices {
  void getUserData(
    BuildContext context,
  ) async {
    try {
      debugPrint("Inside getUserData from authService");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      if (token == null) {
        prefs.setString('x-auth-token', "");
      }

      var tokenRes = await http.post(
        Uri.parse('${GlobalVariable.uri}/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!,
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        http.Response userRes = await http.get(
          Uri.parse('${GlobalVariable.uri}/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token
          },
        );
        debugPrint("herer");
        debugPrint(userRes.statusCode.toString());
        // debugPrint(userRes.body);
        if (userRes.statusCode == 200) {
          // Provider.of<UserProvider>(context, listen: false)
          //     .setUser(userRes.body);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      debugPrint("email: $email");
      http.Response res = await http.post(
        Uri.parse('${GlobalVariable.uri}/api/v1/users/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      debugPrint("res: ${res.body}");
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () async {
          // SharedPreferences prefs = await SharedPreferences.getInstance();
          Provider.of<UserProvider>(context, listen: false)
              .setUser(jsonDecode(res.body)['data']['user']);
          // await prefs.setString('x-auth-token', jsonDecode(res.body)['token']);
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home',
            (route) => false,
          );
          debugPrint("success4");
        },
      );
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User not found!',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

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
      http.Response res = await http.post(
        Uri.parse('${GlobalVariable.uri}/api/v1/users/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            debugPrint(res.body.runtimeType.toString());
            // SharedPreferences prefs = await SharedPreferences.getInstance();
            // debugPrint(jsonDecode(res.body)['token']);
            // prefs.setString('token', jsonDecode(res.body)['token']);
            Provider.of<UserProvider>(context, listen: false)
                .setUser(jsonDecode(res.body)['data']['user']);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('User Created!'),
                backgroundColor: Colors.green,
              ),
            );
          });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Something went wrong!')),
      );
    }
  }
}
