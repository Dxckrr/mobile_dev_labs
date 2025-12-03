import 'package:flutter/material.dart';
import 'package:flutter_video_player_app/video.dart';

class InfoVideo extends StatelessWidget {
  final Video video;

  const InfoVideo({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.name,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Duración: ${video.duration}',
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
          Text(
            'Tamaño: ${video.size}',
            style: TextStyle(fontSize: 24, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
