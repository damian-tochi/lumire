import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../utils/anim/animated_page_route.dart';
import '../../shop/screens/shop_discovery_screen.dart';
import '../widgets/autoscroll_banner_card.dart';
import '../widgets/animated_discover_button.dart';


class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  double _screenScale = 1.0;

  void _triggerQuickPopAnimation() async {
    setState(() => _screenScale = 0.99);

    await Future.delayed(const Duration(milliseconds: 60));
    setState(() => _screenScale = 1.0);
    if (mounted) {
      Navigator.push(context, FadePageRoute(page: const ShopDiscoveryScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    const String modelImageUrl =
        'https://images.unsplash.com/photo-1617137968427-85924c800a22?q=80&w=1000&auto=format&fit=crop';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      // Black background canvas layer exposed exclusively during layout compression
      child: Container(
        color: Colors.black,
        child: AnimatedScale(
          scale: _screenScale,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOutBack,
          // Creates an organic tactile bounce effect
          child: Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(modelImageUrl),
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        ),
                      ),

                      // Top Header Text
                      Positioned(
                        top: MediaQuery.of(context).padding.top + 16,
                        left: 0,
                        right: 0,
                        child: Text(
                          AppStrings.appName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textWhite,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),

                      // Translucent Watermark Text
                      Positioned(
                        bottom: 0,
                        left: 1,
                        right: 1,
                        child: Text(
                          AppStrings.appName,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 109,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textWhite.withValues(alpha: 0.22),
                            letterSpacing: -2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const AutoscrollBannerCard(),
                const SizedBox(height: 4),
                // Bind the button tap callback to trigger your new pop logic
                AnimatedDiscoverButton(onTap: _triggerQuickPopAnimation),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
