import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vac/features/stream/data/commentaries.dart';

class SingleCommentary extends StatelessWidget {
  const SingleCommentary({super.key, required this.comment});
  final Comments comment;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${DateFormat.Hm().format(comment.date)}  ',
            style: TextStyle(color: Colors.grey),
          ),
          Expanded(
            child: Text(
              comment.comment,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
