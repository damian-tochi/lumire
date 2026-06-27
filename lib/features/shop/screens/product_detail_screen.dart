import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../utils/anim/animated_bottom_slide_in.dart';
import '../widgets/image_selection_button.dart';
import '../widgets/size_selection_button.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  String selectedSize = 'M';
  int selectedImageIndex = 0;

  final List<String> sizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', '3XL'];

  // High-quality placeholder perspective assets for the image list
  final List<String> productImages = const [
    'https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=600&auto=format&fit=crop',
    // Front close-up
    'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=600&auto=format&fit=crop',
    // Full stance
    'https://images.unsplash.com/photo-1543163521-1bf539c55dd2?q=80&w=600&auto=format&fit=crop',
    // Texture details
    'https://images.unsplash.com/photo-1521572267360-ee0c2909d518?q=80&w=600&auto=format&fit=crop',
    // Alternate profile 1
    'https://images.unsplash.com/photo-1511556532299-8f662fc26c06?q=80&w=600&auto=format&fit=crop',
    // Alternate profile 2
  ];

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    const Color headerColor = AppColors.backgroundCream;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: headerColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundBlack,
        body: Column(
          children: [
            // 1. EXTENDED TOP HEADER PANEL
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 20,
                bottom: 30,
                left: 16,
                right: 16,
              ),
              decoration: const BoxDecoration(
                color: headerColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      color: AppColors.textPrimary,
                      size: 26,
                    ),
                  ),
                  const Text(
                    AppStrings.productTitle,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: AppColors.textPrimary,
                    size: 26,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4),

            // 2. PRODUCT GALLERY CONTAINER (With right thumbnail rail)
            Expanded(
              flex: 11,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundCream,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Stack(
                  children: [
                    // 1. MAIN ACTIVE IMAGE VIEWPORT
                    Positioned.fill(
                      child: AnimateInItem(
                        index: 0,
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 700),
                          switchInCurve: Curves.ease,
                          switchOutCurve: Curves.ease,
                          layoutBuilder: (currentChild, previousChildren) {
                            return Stack(
                              children: [
                                ...previousChildren,
                                if (currentChild != null) Positioned.fill(child: currentChild),
                              ],
                            );
                          },
                          transitionBuilder: (Widget child, Animation<double> animation) {
                            final isIncoming = child.key == ValueKey<int>(selectedImageIndex);

                            final slideTween = isIncoming
                                ? const Offset(-1.0, 0.0)
                                : const Offset(1.0, 0.0);

                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: slideTween,
                                end: Offset.zero,
                              ).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child,
                              ),
                            );
                          },
                          child: Image.network(
                            productImages[selectedImageIndex],
                            key: ValueKey<int>(selectedImageIndex),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // 2. VERTICAL THUMBNAIL RAIL
                    Positioned(
                      top: 0,
                      right: 10,
                      bottom: 0,
                      width: 60,
                      child: ListView.builder(
                        itemCount: productImages.length,
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final isCurrent = index == selectedImageIndex;
                          return ImageSelectionButton(isSelected: isCurrent, onTap: () { if (index != selectedImageIndex) {
                            setState(() => selectedImageIndex = index);
                          } }, imgLink: productImages[index],);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 4),

            // 3. DESCRIPTION & SIZE SELECTOR CONTAINER
            Expanded(
              flex: 9,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
                decoration: const BoxDecoration(
                  color: AppColors.backgroundCream,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: AnimateInItem(
                  index: 0,
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.productName1,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                                Text(
                                  AppStrings.productName2,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              'Price: €97',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          AppStrings.selectSize,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textPrimary.withValues(alpha: 0.9),
                          ),
                        ),
                        const SizedBox(height: 10),

                        // Horizontal Size Selection Row
                        SizedBox(
                          height: 44,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: sizes.length,
                            itemBuilder: (context, index) {
                              final size = sizes[index];
                              final isSelected = size == selectedSize;
                              return SizeSelectionButton(isSelected: isSelected, onTap: () => setState(() => selectedSize = size), size: size);
                            },
                          ),
                        ),
                        const SizedBox(height: 18),

                        // Description text segment
                        const Text(
                          'Celebrate the power and simplicity of the Swoosh. This warm, brushed fleece hoodie is made with some extra room through the shoulders, chest and body for easy comfort and laid-back, nostalgic style.',
                          style: TextStyle(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                            height: 1.4,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 4),

            // 4. BOTTOM ADD TO CART UTILITY ACTION BUTTON
            Container(
              padding: EdgeInsets.only(bottom: bottomPadding + 25, top: 30),
              height: 85,
              decoration: const BoxDecoration(
                color: AppColors.backgroundLightCream,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: const Center(
                child: Text(
                  AppStrings.addToCart,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPrimary,
                  ),
                ),
              ),
            ),
            SizedBox(height: bottomPadding > 0 ? 0 : 8),
          ],
        ),
      ),
    );
  }
}
