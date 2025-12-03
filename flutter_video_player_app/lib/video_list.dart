import 'package:flutter/material.dart';
import 'package:flutter_video_player_app/video.dart';
import 'package:flutter_video_player_app/video_item_.dart';
import 'package:flutter_video_player_app/video_player_screen.dart';

class VideoList extends StatelessWidget {
  const VideoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Video List App!',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListView(children: _initializeItems(context)),
    );
  }

  List<VideoItem> _initializeItems(BuildContext context) {
    List<VideoItem> items = [];

    for (var item in videosAvailabe) {
      items.add(
        VideoItem(
          video: item,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerScreen(video: item),
              ),
            );
          },
        ),
      );
    }
    return items;
  }
}
