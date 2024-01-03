import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';
import 'package:vac/views/pages/home/components/live_card.dart';

import '../components/game_card.dart';

class TopLive extends StatelessWidget {
  const TopLive({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalVariable.width * 0.0585),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Trending",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Image(
                image: AssetImage('assets/images/trending.gif'),
                height: 16,
              ),
            ],
          ),
          verticalSpace(15),
          LiveCard(
            gameName: "Clash of Clans",
            img: "dota2.png",
            userName: "Killer Dipen",
            userProfile: "Ellipse 2.png",
            watchCount: "1.2M",
          ),
          verticalSpace(15),
          LiveCard(
            gameName: "Clash of Clans",
            img: "dota2.png",
            userName: "Dipen",
            userProfile: "Ellipse 2.png",
            watchCount: "1.3K",
          ),
          verticalSpace(15),
          LiveCard(
            gameName: "Clash of Clans",
            img: "dota2.png",
            userName: "Dipen",
            userProfile: "Ellipse 2.png",
            watchCount: "4.2K",
          ),
        ],
      ),
    );
  }
}
