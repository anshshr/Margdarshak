// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors, camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class youtube_player extends StatefulWidget {
  String url;
  youtube_player({
    super.key,
    required this.url,
  });

  @override
  State<youtube_player> createState() => _youtube_playerState();
}

class _youtube_playerState extends State<youtube_player> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags: YoutubePlayerFlags(
          autoPlay: true,
          hideControls: false,
          mute: false,
          controlsVisibleAtStart: true,
          loop: true,
          hideThumbnail: true,
        disableDragSeek: true,
        isLive: false,
        ));
    print(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 70, left: 10, right: 10,bottom: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blueGrey[100]!,
                  Colors.blueGrey[200]!,
                  Colors.blueGrey[300]!,
                  Colors.blueGrey[200]!,
                  Colors.blueGrey[100]!,
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.topCenter,
              child: AspectRatio(
                aspectRatio:
                    orientation == Orientation.portrait ? 16 / 9 : 16 / 9,
                child: YoutubePlayer(
                  controller: controller,
                  progressIndicatorColor: Colors.black87,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
