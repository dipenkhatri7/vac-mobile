import 'package:flutter/material.dart';
import 'package:vac/core/constants/colors.dart';
import 'package:vac/core/extensions/ctx_extensions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: context.height * 0.25,
            decoration: BoxDecoration(color: CustomColors.profileBg),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned(
                  child: CircleAvatar(
                    radius: 100,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
