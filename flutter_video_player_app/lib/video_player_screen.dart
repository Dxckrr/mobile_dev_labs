import 'package:flutter/material.dart';
import 'package:flutter_video_player_app/info_video.dart';
import 'package:flutter_video_player_app/video.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final Video video;

  const VideoPlayerScreen({Key? key, required this.video}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.video.videoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.video.name)),
      body: Column(
        children: [
          SizedBox(height: 100),
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(_controller),

                          VideoProgressIndicator(
                            _controller,
                            allowScrubbing: true,
                            padding: EdgeInsets.symmetric(vertical: 10),
                          ),

                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: IconButton(
                                icon: Icon(
                                  _controller.value.isPlaying
                                      ? Icons.pause
                                      : Icons.play_arrow,
                                  color: Colors.white,
                                  size: 50,
                                ),
                                onPressed: () {
                                  if (_controller.value.isPlaying) {
                                    _controller.pause();
                                  } else {
                                    _controller.play();
                                  }
                                  setState(() {});
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : LinearProgressIndicator(),
            ),
          ),
          InfoVideo(video: widget.video),
        ],
      ),
    );
  }
}
