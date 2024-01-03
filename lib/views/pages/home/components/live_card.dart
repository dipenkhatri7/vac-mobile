// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/match_card.dart';

class LiveCard extends StatefulWidget {
  String img, gameName, userName, watchCount, userProfile;
  LiveCard({
    super.key,
    required this.img,
    required this.gameName,
    required this.userName,
    required this.watchCount,
    required this.userProfile,
  });

  @override
  State<LiveCard> createState() => _LiveCardState();
}

class _LiveCardState extends State<LiveCard> {
  double angle = 0;
  bool visible = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/streamPage');
      },
      child: Container(
        height: GlobalVariable.height * 0.2258,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            MatchCard(
              gameName: "CS:GO ESL league 2023",
              userName: "Dipen",
              watchCount: "1.2K",
              img: "clashofclan.jpeg",
              userProfile: "dipen.png",
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 14, 48, 243).withOpacity(.1),
                    Color.fromARGB(255, 50, 78, 235).withOpacity(.2),
                    Color.fromARGB(255, 14, 48, 243).withOpacity(.3),
                    Color(0xff7270FF).withOpacity(0.85)
                  ],
                ),
              ),
              width: double.infinity,
              height: GlobalVariable.height * 0.2258,
            ),
            Positioned(
              top: 12,
              left: 18,
              child: Container(
                height: 25,
                width: GlobalVariable.width * 0.18,
                // padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xffFF0000),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 5,
                      child: Image(
                        image: AssetImage('assets/images/trending.gif'),
                        height: 12,
                      ),
                    ),
                    horizontalSpace(5),
                    Text(
                      "Live",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: .85,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 18,
              child: SizedBox(
                width: GlobalVariable.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 24,
                          child: Image(
                            // userProfile
                            image: AssetImage(
                              'assets/images/${widget.userProfile}',
                            ),
                          ),
                        ),
                        horizontalSpace(8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.gameName,
                              style: TextStyle(
                                color: Color(0xffFBFBFF),
                                fontSize: 18,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            Text(
                              widget.userName,
                              style: TextStyle(
                                color: Color(0xffFBFBFF).withOpacity(.85),
                                fontSize: 12,
                                letterSpacing: .35,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                    horizontalSpace(5),
                    Text(
                      ' ${widget.watchCount} Watching',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        letterSpacing: .35,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
