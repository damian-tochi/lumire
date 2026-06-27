import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';

class AutoscrollBannerCard extends StatefulWidget {
  const AutoscrollBannerCard({super.key});

  @override
  State<AutoscrollBannerCard> createState() => _AutoscrollBannerCardState();
}

class _AutoscrollBannerCardState extends State<AutoscrollBannerCard> {
  late ScrollController _scrollController;
  Timer? _timer;
  final double _speed = 1.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) => _startScrolling());
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 16), (timer) {
      if (!mounted || !_scrollController.hasClients) return;
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      if (currentScroll >= maxScroll) {
        _scrollController.jumpTo(0.0);
      } else {
        _scrollController.jumpTo(currentScroll + _speed);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 105,
      decoration: const BoxDecoration(
        color: AppColors.backgroundLightCream,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      clipBehavior: Clip.antiAlias,
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  AppStrings.bannerText,
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                    letterSpacing: -1,
                  ),
                ),
                SizedBox(width: 30),
              ],
            ),
          );
        },
      ),
    );
  }
}
