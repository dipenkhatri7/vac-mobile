import 'package:flutter/material.dart';

class GlobalVariable {
  static String uri = "http://localhost:3000";
  static late double width;
  static late double height;
  GlobalVariable(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }
}
