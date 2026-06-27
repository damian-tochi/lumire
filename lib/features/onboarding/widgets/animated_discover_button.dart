import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../utils/black_ripple.dart';

class AnimatedDiscoverButton extends StatefulWidget {
  final VoidCallback onTap;

  const AnimatedDiscoverButton({super.key, required this.onTap});

  @override
  State<AnimatedDiscoverButton> createState() => _AnimatedDiscoverButtonState();
}

class _AnimatedDiscoverButtonState extends State<AnimatedDiscoverButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Automatically navigate forward once the ripple expands and finishes
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onTap();
        _animationController.reset();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    if (_animationController.isAnimating) return;

    setState(() {
      // Get the exact touch point relative to the button boundaries
      _tapPosition = details.localPosition;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: Container(
        width: double.infinity,
        height: 85,
        clipBehavior: Clip.antiAlias,
        // Ensures the ripple stays inside the button boundaries
        decoration: const BoxDecoration(
          color: AppColors.accentTan, // Soft tan/terracotta tone
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The underlying static text label
            const Text(
              AppStrings.discoverNow,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
            ),

            // The Custom Painter overlay executing the custom ripple
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  size: Size.infinite,
                  painter: BlackRipplePainter(
                    animationValue: _animationController.value,
                    tapPosition: _tapPosition,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

