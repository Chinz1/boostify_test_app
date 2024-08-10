import 'package:flutter/material.dart';
import 'dart:math';

class CircularIconButton extends StatelessWidget {
  final VoidCallback onPressed; // Callback function for onPressed

  const CircularIconButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed, // Trigger the callback when tapped
      child: Container(
        width: 60,
        height: 60,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(60, 60),
              painter: CircularBorderPainter(),
            ),
            Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                color: Color(0xFF003366),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3; // Reduced thickness of the border

    double radius = min(size.width / 2, size.height / 2) - 1; // Increased distance from the container
    Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the blue part of the border
    borderPaint.color = const Color(0xFF003366);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      3 * pi / 2,
      false,
      borderPaint,
    );

    // Draw the grey part of the border
    borderPaint.color = Colors.grey[100]!;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi / 2,
      false,
      borderPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
