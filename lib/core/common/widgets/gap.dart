import 'package:flutter/material.dart';

class HGap extends StatelessWidget {
  const HGap({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class VGap extends StatelessWidget {
  const VGap({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
