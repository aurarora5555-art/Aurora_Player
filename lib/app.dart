import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/player/now_playing_screen.dart';
import 'features/video/video_screen.dart';
import 'services/audio_service.dart';

class AuroraApp extends StatefulWidget {
  const AuroraApp({super.key});

  @override
  State<AuroraApp> createState() => _AuroraAppState();
}

class _AuroraAppState extends State<AuroraApp> {
  final audioService = AuroraAudioService();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      NowPlayingScreen(audioService: audioService),
      const VideoScreen(),
    ];

    return MaterialApp(
      title: 'Aurora Player',
      theme: AuroraTheme.light,
      darkTheme: AuroraTheme.dark,
      home: Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (i) => setState(() => _selectedIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Music"),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: "Video"),
          ],
        ),
      ),
    );
  }
}
