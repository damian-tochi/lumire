import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../data/models/product.dart';
import '../../../utils/anim/animated_bottom_slide_in.dart';
import '../../../utils/anim/animated_page_route.dart';
import '../widgets/category_chip.dart';
import '../widgets/product_card.dart';
import '../widgets/bottom_nav_bar.dart';
import 'product_detail_screen.dart';

class ShopDiscoveryScreen extends StatefulWidget {
  const ShopDiscoveryScreen({super.key});

  @override
  State<ShopDiscoveryScreen> createState() => _ShopDiscoveryScreenState();
}

class _ShopDiscoveryScreenState extends State<ShopDiscoveryScreen> {
  String selectedCategory = AppStrings.trending;

  final Set<int> likedProductIndices = {0};

  double _screenScale = 1.0;

  void _triggerQuickPopAnimation() async {
    setState(() => _screenScale = 0.99);
    await Future.delayed(const Duration(milliseconds: 80));
    setState(() => _screenScale = 1.0);
    Navigator.push(context, FadePageRoute(page: const ProductDetailScreen()));
  }

  void _triggerQuickPopAnimationBtn() async {
    setState(() => _screenScale = 0.99);
    await Future.delayed(const Duration(milliseconds: 90));
    setState(() => _screenScale = 1.0);
  }

  final List<String> categories = [
    AppStrings.trending,
    AppStrings.shoes,
    AppStrings.sweatshirts,
    AppStrings.shirts,
    AppStrings.bags,
  ];

  final List<Product> products = const [
    Product(
      title: "Men's Pullover Hoodie",
      price: '€97',
      image:
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=600&auto=format&fit=crop',
      isTall: true, // Staggered UI element height flags
    ),
    Product(
      title: "Men's Sport Jersey",
      price: '€68',
      image:
          'https://images.unsplash.com/photo-1517462964-21fdcec3f25b?q=80&w=600&auto=format&fit=crop',
      isTall: false,
    ),
    Product(
      title: 'Yoga Crewneck Sweatshirt',
      price: '€42',
      image:
          'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=600&auto=format&fit=crop',
      isTall: false,
    ),
    Product(
      title: "Men's Knit Fairway Car..",
      price: '€94',
      image:
          'https://images.unsplash.com/photo-1614975058789-41316d0e2e9c?q=80&w=600&auto=format&fit=crop',
      isTall: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    const Color headerColor = AppColors.textWhite;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: headerColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: AppColors.backgroundBlack,
        body: Container(
          color: Colors.black,
          child: AnimatedScale(
            scale: _screenScale,
            duration: const Duration(milliseconds: 120),
            curve: Curves.easeOutBack,
            child: Column(
              children: [
                // 1. EXTENDED TOP HEADER PANEL
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 8,
                    bottom: 16,
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
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: AppColors.backgroundLightCream,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.notes,
                              color: AppColors.textPrimary,
                              size: 20,
                            ),
                          ),
                          const Text(
                            AppStrings.appName,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          Container(
                            clipBehavior: Clip.antiAlias,
                            padding: const EdgeInsets.all(8.0),
                            decoration: const BoxDecoration(
                              color: AppColors.backgroundLightCream,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.shopping_bag_outlined, color: AppColors.textPrimary, size: 20),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundLightCream,
                          borderRadius: BorderRadius.circular(24),
                          border: Border.all(
                            color: AppColors.backgroundLightCream,
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.search,
                              color: AppColors.textPrimary,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              AppStrings.searchHint,
                              style: TextStyle(
                                color: AppColors.textPrimary,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 4),

                // 2. MAIN APP CONTENT CONTAINER (STAGGERED DUAL COLUMN LIST)
                Expanded(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
                    decoration: const BoxDecoration(
                      color: AppColors.textWhite,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                          child: TweenAnimationBuilder<double>(
                            tween: Tween<double>(begin: 0.0, end: 1.0),
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeIn,
                            builder: (context, opacityValue, child) {
                              return Opacity(
                                opacity: opacityValue,
                                child: child,
                              );
                            },
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: categories.length,
                              itemBuilder: (context, index) {
                                final cat = categories[index];
                                final isSelected = cat == selectedCategory;
                                return CategoryChip(
                                  label: cat,
                                  isSelected: isSelected,
                                  onTap: () =>
                                      setState(() => selectedCategory = cat),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        // Product Grid Viewport
                        Expanded(
                          child: ShaderMask(
                            blendMode: BlendMode.dstIn,
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black],
                                stops: [0.0, 0.04],
                              ).createShader(bounds);
                            },
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 16.0,
                                  top: 12,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Left Column Items (Index 0 and 2)
                                    Expanded(
                                      child: _buildProductColumn([0, 2]),
                                    ),
                                    const SizedBox(width: 14),
                                    // Right Column Items (Index 1 and 3)
                                    Expanded(
                                      child: _buildProductColumn([1, 3]),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 4),

                // 3. BOTTOM UTILITY NAVIGATION BAR
                BottomNavBar(bottomPadding: bottomPadding),
                SizedBox(height: bottomPadding > 0 ? 0 : 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductColumn(List<int> indices) {
    return Column(
      children: indices.map((index) {
        final prod = products[index];
        final isLiked = likedProductIndices.contains(index);

        return AnimateInItem(
          index: index,
          child: ProductCard(
            product: prod,
            isLiked: isLiked,
            onTap: () {
              _triggerQuickPopAnimation();
            },
            onFavoriteToggle: () {
              setState(() {
                _triggerQuickPopAnimationBtn();
                if (isLiked) {
                  likedProductIndices.remove(index);
                } else {
                  likedProductIndices.add(index);
                }
              });
            },
          ),
        );
      }).toList(),
    );
  }
}
