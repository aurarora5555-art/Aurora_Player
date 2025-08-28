import 'package:flutter/material.dart';

class VisualizerWidget extends StatelessWidget {
  final List<double> fftBins;

  const VisualizerWidget({super.key, required this.fftBins});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.infinite,
      painter: _VisualizerPainter(fftBins),
    );
  }
}

class _VisualizerPainter extends CustomPainter {
  final List<double> bins;
  _VisualizerPainter(this.bins);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blueAccent;
    final barWidth = size.width / bins.length;
    for (int i = 0; i < bins.length; i++) {
      final barHeight = bins[i] * size.height;
      canvas.drawRect(
        Rect.fromLTWH(i * barWidth, size.height - barHeight, barWidth, barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _VisualizerPainter oldDelegate) => true;
}
