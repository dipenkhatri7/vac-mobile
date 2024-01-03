import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vac/core/constants/colors.dart';
import 'package:vac/core/extensions/ctx_extensions.dart';
import 'package:vac/features/chat/presentation/views/chat.dart';

import 'package:vac/features/stream/presentation/widgets/commentary.dart';
import 'package:vac/features/stream/presentation/widgets/stream_info.dart';
import 'package:video_player/video_player.dart';

/// Stateful widget to fetch and then display video content.
class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  _StreamPageState createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/video/match.mp4',
    )..initialize().then((value) => _controller.play());
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  bool isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(color: CustomColors.profilePrimaryBg),
      padding: EdgeInsets.only(
          top: context.padding.top, bottom: context.padding.bottom),
      child: Column(
        children: [
          Stack(
            children: [
              AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Colors.white,
                        size: 50,
                      )),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.subtitles),
                        color: Colors.white,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        color: Colors.white,
                      )
                    ],
                  )
                ],
              ),
              Positioned(
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 2,
                            backgroundColor: Colors.red,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            "Live",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  if (isPlaying) {
                                    _controller.pause();
                                    isPlaying = false;
                                  } else {
                                    _controller.play();
                                    isPlaying = true;
                                  }
                                });
                              },
                              icon: isPlaying
                                  ? Icon(Icons.pause)
                                  : Icon(Icons.play_arrow))
                        ],
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(
                      //     Icons.fullscreen,
                      //     size: 33,
                      //     color: Colors.white,
                      //   ),
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
          const StreamInfo(
            title: 'CS:Go World Championship',
            waching: 1000,
          ),
          TabBar(controller: _tabController, tabs: const [
            Tab(
              text: 'Chat',
            ),
            Tab(
              text: 'Commentary',
            ),
          ]),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              Chat(),
              Commentary(),
            ]),
          )
        ],
      ),
    ));
  }
}
