import 'package:flutter/material.dart';
import 'package:flutter_video_player_app/video.dart';

class VideoItem extends StatelessWidget {
  final Video video;
  final VoidCallback? onTap;

  const VideoItem({super.key, required this.video, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          IconButton(
            padding: EdgeInsets.zero, 
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: onTap,
            icon: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                video.image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                video.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(video.duration, style: const TextStyle(fontSize: 18)),
              Text(video.size, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
