import 'dart:ui';
import 'package:flutter/material.dart';

class GradientBorderPainter extends CustomPainter {
  final double strokeWidth;
  final Radius borderRadius;
  final Gradient gradient;

  GradientBorderPainter({
    required this.strokeWidth,
    required this.borderRadius,
    required this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final outerRect = RRect.fromRectAndCorners(
      Rect.fromLTWH(
        -strokeWidth / 2,
        -strokeWidth / 2,
        size.width + strokeWidth,
        size.height + strokeWidth,
      ),
      topRight: borderRadius,
      bottomRight: borderRadius,
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawRRect(outerRect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
