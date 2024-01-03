import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vac/core/constants/colors.dart';
import 'package:vac/features/chat/data/models/user_message.dart';

class UserMessage extends StatelessWidget {
  const UserMessage({super.key, required this.message});
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
      ),
      child: AutoSizeText.rich(
          TextSpan(
            text: "${DateFormat.Hm().format(message.date)} ",
            children: [
              TextSpan(
                text: message.username,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.1,
                  color: CustomColors
                      .listOfUserNameColors[int.parse(message.userId) % 6],
                ),
              ),
              const TextSpan(text: ':'),
              TextSpan(
                  text: message.message,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5)),
            ],
          ),
          style: TextStyle(color: Colors.grey)),
    );
  }
}
