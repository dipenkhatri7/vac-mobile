import 'package:flutter/material.dart';
import 'package:vac/views/commentary.dart';
import 'package:vac/views/pages/auth/login.dart';
import 'package:vac/views/pages/auth/signup.dart';
import 'package:vac/views/pages/home.dart';
import 'package:vac/views/pages/home/home_page.dart';
import 'package:vac/views/pages/settings/settings.dart';
import 'package:vac/views/pages/stats/stats.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case '/stats':
      return MaterialPageRoute(
        builder: (context) => const Stats(),
      );
    case '/login':
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case '/signup':
      return MaterialPageRoute(
        builder: (context) => const SignupScreen(),
      );
    case '/settings':
      return MaterialPageRoute(
        builder: (context) => const Settings(),
      );
    case '/home':
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
    case '/commentary':
      return MaterialPageRoute(builder: (context) => const Commentary());
    default:
      return MaterialPageRoute(
        builder: (context) => const Home(),
      );
  }
}
