import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_list_view/flutter_list_view.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:vac/core/constants/colors.dart';
import 'package:vac/core/extensions/ctx_extensions.dart';
import 'package:vac/features/chat/data/models/user_message.dart';
import 'package:vac/features/chat/presentation/widgets/single_message.dart';
import 'package:vac/features/stream/data/commentaries.dart';
import 'package:vac/features/stream/presentation/widgets/single_commentary.dart';
import 'package:web_socket_channel/io.dart';

class Commentary extends StatefulWidget {
  const Commentary({super.key});

  @override
  State<Commentary> createState() => _CommentaryState();
}

class _CommentaryState extends State<Commentary> {
  List<Comments> commentaries = [
    Comments(
        "What a stunning play by Alex!", DateTime.parse("2023-01-25 10:15:00")),
    Comments("Emily's tactics are on point today.",
        DateTime.parse("2023-01-25 12:30:00")),
    Comments("James with a game-changing move!",
        DateTime.parse("2023-01-25 15:45:00")),
    Comments("Claire's clutch play seals the round.",
        DateTime.parse("2023-01-25 18:20:00")),
    Comments("Michael dominates with precision shots.",
        DateTime.parse("2023-01-25 20:05:00")),
    Comments("Olivia's grenade catches everyone off guard.",
        DateTime.parse("2023-01-25 22:40:00")),
    Comments("Sophia shines in the eco round victory.",
        DateTime.parse("2023-01-26 09:10:00")),
    Comments("Daniel's flashbang controls the battlefield.",
        DateTime.parse("2023-01-26 11:25:00")),
    Comments("Emma leads the team with flawless coordination.",
        DateTime.parse("2023-01-26 14:00:00")),
    Comments("A sniper showdown by Sophie and Jack.",
        DateTime.parse("2023-01-26 16:35:00")),
    Comments("Ethan calls a strategic timeout for Team K.",
        DateTime.parse("2023-01-26 19:15:00")),
    Comments("Benjamin's ninja defuse shocks the opponents.",
        DateTime.parse("2023-01-26 21:50:00")),
    Comments("Zoe's AWP shot echoes through the arena.",
        DateTime.parse("2023-01-27 08:30:00")),
    Comments("Dylan's fake bomb plant turns the tide.",
        DateTime.parse("2023-01-27 10:55:00")),
    Comments("Mia's 1v2 clutch secures the victory.",
        DateTime.parse("2023-01-27 13:20:00")),
    Comments("Noah taps heads with the AK-47.",
        DateTime.parse("2023-01-27 15:45:00")),
    Comments("Aiden's well-timed smoke creates chaos.",
        DateTime.parse("2023-01-27 18:10:00")),
    Comments("Natalie pulls off an unexpected eco round win.",
        DateTime.parse("2023-01-27 20:35:00")),
    Comments("Isabella's silenced pistol takes down two.",
        DateTime.parse("2023-01-27 22:50:00")),
    Comments("Well-coordinated mid control by Team Liam.",
        DateTime.parse("2023-01-28 09:20:00")),
    Comments("Harper's precision play turns the tide.",
        DateTime.parse("2023-01-28 11:45:00")),
    Comments("Aiden's Deagle shots leave the opponents in awe.",
        DateTime.parse("2023-01-28 14:10:00")),
    Comments("Mason executes a flawless B bombsite takeover.",
        DateTime.parse("2023-01-28 16:35:00")),
    Comments("Grace's wallbang changes the course of the round.",
        DateTime.parse("2023-01-28 19:00:00")),
    Comments("Liam's entry frag sparks a momentum shift.",
        DateTime.parse("2023-01-28 21:25:00")),
    Comments("Ava's AWP shot denies the bomb plant.",
        DateTime.parse("2023-01-29 08:50:00")),
    Comments("Sophie's quickscopes showcase unparalleled skill.",
        DateTime.parse("2023-01-29 11:15:00")),
    Comments("Benjamin's lurking play catches the enemies off guard.",
        DateTime.parse("2023-01-29 13:40:00")),
    Comments("Ethan's tactical call leads to a successful retake.",
        DateTime.parse("2023-01-29 16:05:00")),
    Comments("Oliver's mid-air headshot leaves the crowd in disbelief.",
        DateTime.parse("2023-01-29 18:30:00")),
    Comments("Natalie secures the round with a well-timed Molotov.",
        DateTime.parse("2023-01-29 20:55:00")),
    Comments("Daniel's aggressive peek results in a triple kill.",
        DateTime.parse("2023-01-29 23:20:00")),
    Comments("Zoe's no-scope is a highlight reel moment.",
        DateTime.parse("2023-01-30 09:45:00")),
    Comments("Noah's tactical smoke leads to a successful bomb plant.",
        DateTime.parse("2023-01-30 12:10:00")),
    Comments("Emily's ninja defuse attempt keeps the audience on edge.",
        DateTime.parse("2023-01-30 14:35:00")),
    Comments("Team Mia executes a synchronized fake to perfection.",
        DateTime.parse("2023-01-30 17:00:00")),
    Comments("Jacob's spray control secures a crucial round.",
        DateTime.parse("2023-01-30 19:25:00")),
    Comments("Aiden's well-timed flashbang blinds the entire enemy team.",
        DateTime.parse("2023-01-30 21:50:00")),
    Comments("Claire's positioning leads to a successful round win.",
        DateTime.parse("2023-01-31 10:15:00")),
    Comments("Epic 1v1 battle between James and Isabella.",
        DateTime.parse("2023-01-31 12:40:00")),
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
      'http://localhost:8000',
      OptionBuilder().setTransports([
        'websocket'
      ]) // for Flutter or Dart VM // disable auto-connection
          .setExtraHeaders({'foo': 'bar'}) // optional
          .build(),
    );
    socket
      ..onError((data) {
        print("here");
        debugPrint(data.toString());
      })
      ..connect()
      ..onConnect((data) {
        print('asdf');
        debugPrint('connected to the socket in commentary');
      })
      ..on('new_commentary', (data) {
        setState(() {
          print(data);
          // commentaries.add(Comments(data, DateTime.now()));
        });
      })
      ..onDisconnect((data) => debugPrint('disconnected'));
    controller.sliverController.jumpToIndex(commentaries.length);
  }

  _scrollToEnd() async {
    controller.animateTo(
      controller.position.maxScrollExtent,
      duration: Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    socket.dispose();
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
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  controller: controller,
                  itemCount: commentaries.length,
                  itemBuilder: (context, index) {
                    return SingleCommentary(comment: commentaries[index]);
                  }));
        }));
  }
}
