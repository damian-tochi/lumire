import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../utils/black_ripple_thin.dart';

class SizeSelectionButton extends StatefulWidget {
  final bool isSelected;
  final VoidCallback onTap;
  final String size;

  const SizeSelectionButton({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.size,
  });

  @override
  State<SizeSelectionButton> createState() => _SizeSelectionButtonState();
}

class _SizeSelectionButtonState extends State<SizeSelectionButton>
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
    const double buttonSize = 41.0;
    const double rippleSize = 35.0;
    const Offset centerOffset = Offset(buttonSize / 2, buttonSize / 2);

    return GestureDetector(
      onTap: _handleTap,
      child: SizedBox(
        width: buttonSize,
        height: buttonSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: rippleSize,
              height: rippleSize,
              padding: .zero,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? AppColors.backgroundBlack
                    : AppColors.textWhite,
                shape: BoxShape.circle,
                border: Border.all(
                  color: widget.isSelected
                      ? AppColors.backgroundBlack
                      : AppColors.borderLighter,
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                widget.size,
                style: TextStyle(
                  color: widget.isSelected
                      ? AppColors.textWhite
                      : AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _rippleController,
                builder: (context, child) {
                  return CustomPaint(
                    painter: BlackRipplePainterThin(
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
