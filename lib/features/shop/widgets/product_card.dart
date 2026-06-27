import 'package:flutter/material.dart';
import 'package:lumire/features/shop/widgets/like_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../data/models/product.dart';
import '../../../utils/black_ripple.dart';
import '../../onboarding/widgets/animated_discover_button.dart';

class ProductCard extends StatefulWidget {
  final Product product;
  final bool isLiked;
  final VoidCallback onTap;
  final VoidCallback onFavoriteToggle;

  const ProductCard({
    super.key,
    required this.product,
    required this.isLiked,
    required this.onTap,
    required this.onFavoriteToggle,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>  with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Offset _tapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

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
      _tapPosition = details.localPosition;
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _handleTapDown,
      child: Container(
        margin: const EdgeInsets.only(bottom: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Stack(
                children: [
                  Container(
                    height: widget.product.isTall ? 220 : 160,
                    decoration: BoxDecoration(
                      color: AppColors.backgroundGray,
                      image: DecorationImage(
                        image: NetworkImage(widget.product.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  Positioned.fill(
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return CustomPaint(
                          painter: BlackRipplePainter(
                            animationValue: _animationController.value,
                            tapPosition: _tapPosition,
                          ),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    top: 0,
                    right: 0,
                    child: LikeButton(isLiked: widget.isLiked, onTap: widget.onFavoriteToggle),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            Text(
              widget.product.title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              widget.product.price,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
