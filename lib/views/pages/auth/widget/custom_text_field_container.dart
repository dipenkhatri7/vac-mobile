import 'package:flutter/material.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/auth/widget/custom_text_field.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String text;
  final CustomTextField textField;
  const CustomTextFieldContainer(
      {super.key, required this.text, required this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpace(5),
        textField,
      ],
    );
  }
}
