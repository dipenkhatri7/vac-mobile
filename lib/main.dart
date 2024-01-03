import 'package:flutter/material.dart';
import 'package:vac/core/services/instances.dart';
import 'package:vac/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await init();
  runApp(const MyApp());
}
