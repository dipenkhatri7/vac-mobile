import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vac/my_app.dart';
import 'package:vac/providers/userProvider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}
