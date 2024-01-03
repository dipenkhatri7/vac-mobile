import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:vac/core/constants/colors.dart';

import 'package:vac/features/chat/data/models/user_message.dart';
import 'package:vac/features/chat/presentation/widgets/single_message.dart';


class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final String currentUser = 'Bikraj';
  List<Message> message = [
    Message(
        "1",
        "Exciting moments in the Valorant live match! Join the action as Team A and Team B face off for supremacy.",
        DateTime.now(),
        "EsportsFan123"),
    Message(
        "2",
        "Incredible plays from PlayerX with those precise headshots! #Valorant",
        DateTime.now(),
        "GameWatcher"),
    Message(
        "3",
        "Team B is making a comeback! Can they turn the tide and secure victory in this intense round?",
        DateTime.now(),
        "ProGamer88"),
    Message(
        "4",
        "The crowd is going wild for that clutch play from Team A! #ValorantEsports",
        DateTime.now(),
        "EsportsEnthusiast"),
    Message(
        "5",
        "Don't miss the tactical strategies unfolding in this Valorant match. Who will emerge as the MVP?",
        DateTime.now(),
        "StrategyMaster"),
    Message(
        "1",
        "Spectacular double kill from PlayerY! The momentum is shifting. #FPSAction",
        DateTime.now(),
        "FPSFanatic"),
    Message(
        "2",
        "Epic showdown between the top fraggers! This is Valorant at its best. #EsportsArena",
        DateTime.now(),
        "ArenaWatcher"),
    Message(
        "3",
        "Tense moments as Team B attempts a surprise strategy. Can they catch Team A off guard?",
        DateTime.now(),
        "StrategicObserver"),
    Message(
        "4",
        "Insane flick shot by SniperZ! The audience is on the edge of their seats. #EsportsExcitement",
        DateTime.now(),
        "SniperExpert"),
    Message(
        "5",
        "High-level coordination from both teams. The communication is key in this match. #TeamworkWins",
        DateTime.now(),
        "TeamPlayer"),
    Message(
        "1",
        "Fast-paced action in the Valorant arena! Every second counts in this intense battle. #ValorantFever",
        DateTime.now(),
        "FeverishGamer"),
    Message(
        "2",
        "Precision shooting and quick reflexes on display. These players are at the top of their game. #EsportsElite",
        DateTime.now(),
        "EliteGamer"),
    Message(
        "3",
        "Team A secures an eco-round win! The economy game is crucial in Valorant. #EcoStrats",
        DateTime.now(),
        "EcoMastermind"),
    Message(
        "4",
        "Amazing AWP shot from AWPPro! The sniper skills are unmatched. #SniperSupremacy",
        DateTime.now(),
        "AWPEnthusiast"),
    Message(
        "5",
        "Flawless retake by Team B! Their defensive strategies are paying off. #DefendTheSite",
        DateTime.now(),
        "DefensiveStrategist"),
    Message(
        "1",
        "Nail-biting overtime! Both teams refuse to back down. Who will emerge victorious in this extended battle?",
        DateTime.now(),
        "OvertimeWatcher"),
    Message(
        "2",
        "Critical round for Team A. Can they break Team B's economy and gain a lead? #EconomicPressure",
        DateTime.now(),
        "EconomicAnalyst"),
    Message(
        "3",
        "Unpredictable plays are making this match a rollercoaster of emotions. #EsportsThrills",
        DateTime.now(),
        "ThrillSeeker"),
    Message(
        "4",
        "The audience is chanting for their favorite players. The energy in the arena is electrifying. #FanSupport",
        DateTime.now(),
        "UltimateFan"),
    Message(
        "5",
        "Final round of the match! Who will be the MVP? Share your predictions! #ValorantMVP",
        DateTime.now(),
        "PredictionMaster"),
  ];

  late TextEditingController textController;
  late Socket socket;
  bool needScroll = true;
  late FlutterListViewController controller;
  @override
  void initState() {
    super.initState();

    controller = FlutterListViewController();
    textController = TextEditingController();

    socket = io(
      'http://localhost:3000',
      OptionBuilder()
          .setTransports(['websocket']) // for Flutter or Dart VM
          .disableAutoConnect() // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build(),
    );
    socket
      ..onError((data) => debugPrint(data.toString()))
      ..connect()
      ..onConnect((data) {
        debugPrint('connected to the socket');
      })
      ..on('receivedMessage', (data) {
        final msg = jsonDecode(data as String);
        setState(() {
          needScroll = true;
          message.add(Message(
            msg['userId'] as String,
            msg['message'] ?? "",
            DateTime.parse(msg['date'] as String),
            msg['username'] as String,
          ));
        });
      })
      ..onDisconnect((data) => debugPrint('disconnected'));
    controller.sliverController.jumpToIndex(message.length);
  }

  _scrollToEnd() async {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void sendMessage(
    String message,
  ) {
    socket.emit(
      'sendMessage',
      jsonEncode(
        {
          'message': message,
          'userId': '12',
          'username': currentUser,
          'date': DateTime.now().toString(),
        },
      ),
    );
  }

  @override
  void dispose() {
    socket.dispose();
    controller.dispose();
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (needScroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToEnd());
      needScroll = false;
    }
    socket.connect();
    return Container(
        decoration: BoxDecoration(color: CustomColors.profileBg),
        child: LayoutBuilder(builder: (context, constr) {
          return Column(
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: constr.maxHeight * 0.88,
                  width: constr.maxWidth - 20,
                  child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      controller: controller,
                      itemCount: message.length,
                      itemBuilder: (context, index) {
                        return UserMessage(message: message[index]);
                      })
                  // child: ListView.builder(
                  //   padding: EdgeInsets.all(0),
                  //   controller: controller,
                  //   shrinkWrap: true,
                  //   itemCount: message.length,
                  //   itemBuilder: (context, index) {
                  //     return UserMessage(message: message[index]);
                  //   },
                  // )),
                  ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                height: constr.maxHeight * 0.12,
                decoration: BoxDecoration(color: CustomColors.profileBg),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      height: constr.maxHeight * 0.1,
                      width: constr.maxWidth * 0.7,
                      child: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: textController,
                        textInputAction: TextInputAction.newline,
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.transparent,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3, color: CustomColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.resolveWith((states) =>
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.resolveWith(
                              (states) => CustomColors.primaryColor),
                        ),
                        onPressed: () {
                          if (textController.text != "") {
                            sendMessage(textController.text.trim());
                            textController.clear();
                          }
                        },
                        child: const Text(
                          'Send',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                ),
              )
            ],
          );
        }));
  }
}
