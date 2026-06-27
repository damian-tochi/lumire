import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../utils/black_ripple_smaller.dart';

class ImageSelectionButton extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String imgLink;

  const ImageSelectionButton({super.key, required this.isSelected, required this.onTap, required this.imgLink});

  @override
  State<ImageSelectionButton> createState() => _ImageSelectionButtonState();
}

class _ImageSelectionButtonState extends State<ImageSelectionButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _rippleController;

  @override
  void initState() {
    super.initState();
    _rippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _rippleController.dispose();
    super.dispose();
  }

  void _handleTap() {
    if (_rippleController.isAnimating) return;

    _rippleController.forward(from: 0.0);
    widget.onTap();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 56.0;
    const double rippleSize = 53.0;
    const Offset centerOffset = Offset(buttonSize / 1.7, buttonSize / 2.2);

    return GestureDetector(
      onTap: _handleTap,
      child: SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [
            Container(
              height: rippleSize,
              width: rippleSize,
              decoration: BoxDecoration(
                color: AppColors.overlayWhite24,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: widget.isSelected ? AppColors.textPrimary : Colors.transparent,
                  width: 1.4,
                ),
                image: DecorationImage(
                  image: NetworkImage(widget.imgLink),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _rippleController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BlackRipplePainterSmall(
                      animationValue: _rippleController.value,
                      tapPosition: centerOffset,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
