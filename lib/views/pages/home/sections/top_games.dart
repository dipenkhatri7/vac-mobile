import 'package:flutter/material.dart';
import 'package:vac/constants/consts.dart';
import 'package:vac/constants/spaces.dart';

import '../components/game_card.dart';

class TopGames extends StatelessWidget {
  const TopGames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: GlobalVariable.width * 0.0585),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const IntrinsicHeight(
                    child: Row(
                      children: [
                        Text(
                          "Vāc",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: VerticalDivider(
                            color: Colors.grey,
                            thickness: 1,
                            width: 20,
                          ),
                        ),
                        Text(
                          "वाच",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.45),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xeff323755), width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const CircleAvatar(
                          radius: 2.45,
                          backgroundColor: Colors.red,
                        ),
                        Image(
                          image: AssetImage("assets/images/Notification.png"),
                          color: Colors.white,
                          height: 24,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const Text(
                "Esports like never before",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(251, 251, 255, 0.75),
                  fontWeight: FontWeight.w500,
                ),
              ),
              verticalSpace(10),
            ],
          ),
          verticalSpace(15),
          SizedBox(
            width: GlobalVariable.width - 20,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GameCard(
                    imageURI: "valorant.jpeg",
                    name: "Valorant",
                  ),
                  GameCard(
                    imageURI: "dota2.jpeg",
                    name: "Dota 2",
                  ),
                  GameCard(
                    imageURI: "fortnite.jpeg",
                    name: "Fortntie",
                  ),
                  GameCard(
                    imageURI: "overwatch.jpeg",
                    name: "Overwatch 2",
                  ),
                  GameCard(
                    imageURI: "csgo.jpeg",
                    name: "CS:GO",
                  ),
                  GameCard(
                    imageURI: "pubg.jpeg",
                    name: "PUBG ",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
