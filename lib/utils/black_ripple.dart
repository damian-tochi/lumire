// Custom morphing outline ring shape
import 'package:flutter/cupertino.dart';

import '../core/constants/app_colors.dart';

class BlackRipplePainter extends CustomPainter {
  final double animationValue;
  final Offset tapPosition;

  BlackRipplePainter({required this.animationValue, required this.tapPosition});

  @override
  void paint(Canvas canvas, Size size) {
    if (animationValue == 0.0 || animationValue == 1.0) return;

    // 1. Calculate dynamic progressive size radius based on the container length
    double maxRadius = size.width * 0.11;
    double currentRadius = maxRadius * animationValue;

    // 2. Drive the opacity decay (Fade out gracefully towards the end)
    double opacity = 1.0;
    if (animationValue > 0.6) {
      opacity = 1.0 - ((animationValue - 0.6) / 0.4);
    }

    final Paint paint = Paint()
      ..color = AppColors.backgroundBlack.withValues(alpha: opacity.clamp(0.0, 1.0))
      ..isAntiAlias = true;

    // 3. Interpolation Logic: Morphing from Solid Fill to Outlined Ring
    if (animationValue < 0.4) {
      // Early Stage: Pure solid black growing circle
      paint.style = PaintingStyle.fill;
    } else {
      // Late Stage: Dynamic stroke calculation simulating an expanding shell ring
      paint.style = PaintingStyle.stroke;

      // Gradually thin down the ring stroke as it expands outward
      double maxStrokeWidth = 30.0;
      double normalizedProgress = (animationValue - 0.4) / 0.6;
      paint.strokeWidth = maxStrokeWidth * (1.0 - (normalizedProgress * 0.9));
    }

    // Render the vector sequence centered perfectly over user coordinate inputs
    canvas.drawCircle(tapPosition, currentRadius, paint);
  }

  @override
  bool shouldRepaint(covariant BlackRipplePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.tapPosition != tapPosition;
  }
}