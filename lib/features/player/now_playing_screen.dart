import 'package:flutter/material.dart';
import '../../services/audio_service.dart';
import 'visualizer_widget.dart';

class NowPlayingScreen extends StatelessWidget {
  final AuroraAudioService audioService;
  const NowPlayingScreen({super.key, required this.audioService});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing')),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Icon(Icons.music_note, size: 128, color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(
            height: 120,
            child: VisualizerWidget(fftBins: List.filled(32, 0.3)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: const Icon(Icons.skip_previous), onPressed: () {}),
              IconButton(icon: const Icon(Icons.play_arrow), onPressed: () => audioService.player.play()),
              IconButton(icon: const Icon(Icons.pause), onPressed: () => audioService.player.pause()),
              IconButton(icon: const Icon(Icons.skip_next), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}
