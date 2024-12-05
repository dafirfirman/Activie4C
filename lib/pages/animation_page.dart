import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();
    // Inisialisasi VideoPlayerController
    _videoController = VideoPlayerController.asset(
      'assets/videos/animation.mp4', // Path untuk video animasi
    )
      ..initialize().then((_) {
        setState(() {}); // Untuk memperbarui UI setelah video diinisialisasi
      })
      ..setLooping(true); // Video akan mengulang secara otomatis
  }

  @override
  void dispose() {
    // Membersihkan VideoPlayerController
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Video Animasi 3D',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          // Video Player
          Container(
            height: 250,
            width: double.infinity,
            color: Colors.black,
            child: _videoController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoController.value.aspectRatio,
                    child: VideoPlayer(_videoController),
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          SizedBox(height: 16),
          // Tombol Play/Pause
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  _videoController.value.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow,
                ),
                color: Colors.black,
                iconSize: 40,
                onPressed: () {
                  setState(() {
                    if (_videoController.value.isPlaying) {
                      _videoController.pause();
                    } else {
                      _videoController.play();
                    }
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          // Teks Audio
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: SingleChildScrollView(
                child: Text(
                  'Animasi ini menunjukkan pentingnya kebugaran jasmani dalam kehidupan sehari-hari. '
                  'Melalui visualisasi 3D, Anda dapat memahami bagaimana tubuh bekerja untuk mencapai performa optimal. '
                  'Audio ini menjelaskan unsur-unsur kebugaran jasmani seperti kekuatan, daya tahan, dan fleksibilitas.',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
