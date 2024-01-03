import 'dart:ui';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  GameCard({super.key, required this.imageURI, required this.name});

  String imageURI;
  String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xff323755),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              Image(
                fit: BoxFit.cover,
                width: 70,
                height: 70,
                image: AssetImage("assets/images/games/" + imageURI),
              ),
              Container(
                color: Colors.black26,
                width: 70,
                height: 70,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 4, right: 4),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300,
              fontSize: 12,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ],
    );
  }
}
