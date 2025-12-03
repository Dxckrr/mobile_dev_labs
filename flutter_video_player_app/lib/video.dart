class Video {
  final String name;
  final String duration;
  final String size;
  final String videoPath;
  final String image;

  const Video({
    required this.name,
    required this.duration,
    required this.size,
    required this.videoPath,
    this.image = 'assets/image/default.jpg',
  });
}

const List<Video> videosAvailabe = [
  Video(
    name: 'PI1',
    duration: '1m 02s',
    size: '58,5 MB',
    videoPath: 'assets/video/pi1.mp4',
  ),
  Video(
    name: 'Estructura de Datos - PI',
    duration: '1 m 01s',
    size: '37,6 MB',
    videoPath: 'assets/video/estructuras_video.mp4',
  ),
  Video(
    name: 'Bounsic - PI',
    duration: '2m 12s',
    size: '128 MB',
    videoPath: 'assets/video/bounsic.mp4',
    image: 'assets/image/soundbar_21.jpg',
  ),
];
