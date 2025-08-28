import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../services/ads_service.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
    )..initialize().then((_) => setState(() {}));

    _banner = AdsService.createBanner()..load();
  }

  @override
  void dispose() {
    _controller.dispose();
    _banner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Video Player")),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : const CircularProgressIndicator(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
              ),
            ],
          ),
          if (_banner != null)
            SizedBox(
              height: _banner!.size.height.toDouble(),
              width: _banner!.size.width.toDouble(),
              child: AdWidget(ad: _banner!),
            ),
        ],
      ),
    );
  }
}
