import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class BottomNavBar extends StatelessWidget {
  final double bottomPadding;

  const BottomNavBar({super.key, required this.bottomPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding, left: 40, right: 40),
      height: 85,
      decoration: const BoxDecoration(
        color: AppColors.backgroundLightCream,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavIcon(Icons.home_filled, true, AppStrings.navHome),
          _buildNavIcon(Icons.favorite_border, false, AppStrings.navFavorites),
          _buildNavIcon(Icons.settings_outlined, false, AppStrings.navSettings),
          _buildNavIcon(Icons.person_outline, false, AppStrings.navProfile),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, bool isActive, String label) {
    return Icon(
      icon,
      size: 22,
      color: isActive ? AppColors.backgroundBlack : AppColors.borderLight,
    );
  }
}
