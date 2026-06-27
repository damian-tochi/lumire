import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../utils/black_ripple_smaller.dart';

class LikeButton extends StatefulWidget {
  final bool isLiked;
  final VoidCallback onTap;

  const LikeButton({super.key, required this.isLiked, required this.onTap});

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton>
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
    const double buttonSize = 45.0;
    const double rippleSize = 30.0;
    const Offset centerOffset = Offset(buttonSize / 2, buttonSize / 2);

    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        margin: const EdgeInsets.all(3.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: rippleSize,
              height: rippleSize,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                color: AppColors.textWhite,
                shape: BoxShape.circle,
              ),
              child: widget.isLiked
                  ? const Icon(
                      Icons.favorite,
                      size: 18,
                      color: AppColors.accentOrange,
                    )
                  : const Icon(
                      Icons.favorite_border,
                      size: 18,
                      color: AppColors.borderSubtle,
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
