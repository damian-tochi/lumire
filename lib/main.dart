import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const LumiereApp());
}

class LumiereApp extends StatelessWidget {
  const LumiereApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lumière',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        fontFamily: 'Arial',
      ),
      home: const OnboardingScreen(),
    );
  }
}

// ==========================================
// SCREEN 1: ONBOARDING SCREEN
// ==========================================
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dynamic System UI Overlay updates on build frame execution
    // SystemChrome.setSystemUIOverlayStyle(
    //   const SystemUiOverlayStyle(
    //     statusBarColor: Colors.transparent,
    //     statusBarIconBrightness: Brightness.dark,
    //     statusBarBrightness: Brightness.light,
    //   ),
    // );

    const String modelImageUrl =
        'https://images.unsplash.com/photo-1617137968427-85924c800a22?q=80&w=1000&auto=format&fit=crop';

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
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
                    child: const Text(
                      'Lumière',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
                      'Lumière',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 109,
                        fontWeight: FontWeight.bold,
                        color: Colors.white.withOpacity(0.22),
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
            AnimatedDiscoverButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ShopDiscoveryScreen(),
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

// Seamless Autoscrolling Marquee Component
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
        color: Color(0xFFFCFBE3),
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
                  'TRENDY CO',
                  style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
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

// ==========================================
// SCREEN 2: MAIN SHOP DISCOVERY SCREEN
// ==========================================
class ShopDiscoveryScreen extends StatefulWidget {
  const ShopDiscoveryScreen({super.key});

  @override
  State<ShopDiscoveryScreen> createState() => _ShopDiscoveryScreenState();
}

class _ShopDiscoveryScreenState extends State<ShopDiscoveryScreen> {
  String selectedCategory = 'Trending';

  // Track liked items by index to demonstrate dynamic color changing from screens 2 & 3
  final Set<int> likedProductIndices = {
    0,
  }; // Pre-populating index 0 liked based on image 2

  final List<String> categories = [
    'Trending',
    'Shoes',
    'Sweatshirts',
    'Shirts',
    'Bags',
  ];

  final List<Map<String, dynamic>> products = [
    {
      'title': "Men's Pullover Hoodie",
      'price': '€97',
      'image':
          'https://images.unsplash.com/photo-1556821840-3a63f95609a7?q=80&w=600&auto=format&fit=crop',
      'isTall': true, // Staggered UI element height flags
    },
    {
      'title': "Men's Sport Jersey",
      'price': '€68',
      'image':
          'https://images.unsplash.com/photo-1517462964-21fdcec3f25b?q=80&w=600&auto=format&fit=crop',
      'isTall': false,
    },
    {
      'title': 'Yoga Crewneck Sweatshirt',
      'price': '€42',
      'image':
          'https://images.unsplash.com/photo-1620799140408-edc6dcb6d633?q=80&w=600&auto=format&fit=crop',
      'isTall': false,
    },
    {
      'title': "Men's Knit Fairway Car..",
      'price': '€94',
      'image':
          'https://images.unsplash.com/photo-1614975058789-41316d0e2e9c?q=80&w=600&auto=format&fit=crop',
      'isTall': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;

    const Color headerColor = Color(0xFFFAF9F0);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: headerColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
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
                      const Icon(Icons.notes, color: Colors.black, size: 28),
                      const Text(
                        'Lumière',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 28,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black54, size: 22),
                        SizedBox(width: 10),
                        Text(
                          'Search your needs',
                          style: TextStyle(color: Colors.black45, fontSize: 16),
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
                  color: Color(0xFFFAF9F0),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Column(
                  children: [
                    // Categories Horizontal Bar
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final cat = categories[index];
                          final isSelected = cat == selectedCategory;
                          return GestureDetector(
                            onTap: () => setState(() => selectedCategory = cat),
                            child: Container(
                              margin: const EdgeInsets.only(right: 8),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected ? Colors.black : Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.black12,
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                cat,
                                style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Product Grid Viewport
                    Expanded(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Left Column Items
                              Expanded(child: _buildProductColumn([0, 2])),
                              const SizedBox(width: 14),
                              // Right Column Items
                              Expanded(child: _buildProductColumn([1, 3])),
                            ],
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
            Container(
              padding: EdgeInsets.only(bottom: bottomPadding + 25, top: 30),
              height: 85,
              decoration: const BoxDecoration(
                color: Color(0xFFFCFBE3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavIcon(Icons.home_filled, true),
                  _buildNavIcon(Icons.favorite_border, false),
                  _buildNavIcon(Icons.settings_outlined, false),
                  _buildNavIcon(Icons.person_outline, false),
                ],
              ),
            ),
            SizedBox(height: bottomPadding > 0 ? 0 : 8),
          ],
        ),
      ),
    );
  }

  Widget _buildProductColumn(List<int> indices) {
    return Column(
      children: indices.map((index) {
        final prod = products[index];
        final isLiked = likedProductIndices.contains(index);

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProductDetailScreen()),
            );
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    // Product Rounded Image Container
                    Container(
                      height: prod['isTall'] ? 220 : 160,
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAEAEA),
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                          image: NetworkImage(prod['image']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Dynamic Floating Favorite Button Indicator
                    Positioned(
                      top: 10,
                      right: 10,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isLiked) {
                              likedProductIndices.remove(index);
                            } else {
                              likedProductIndices.add(index);
                            }
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.favorite,
                            size: 18,
                            color: isLiked
                                ? const Color(0xFFFF5A2B)
                                : Colors.black26,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  prod['title'],
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  prod['price'],
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildNavIcon(IconData icon, bool isActive) {
    return Icon(
      icon,
      size: 26,
      color: isActive ? Colors.black : Colors.black26,
    );
  }
}

// ==========================================
// SCREEN 3: NEW PRODUCT DETAIL SCREEN
// ==========================================
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
  final List<String> productImages = [
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

    const Color headerColor = Color(0xFFFAF9F0);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: headerColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
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
                      color: Colors.black,
                      size: 26,
                    ),
                  ),
                  const Text(
                    'Product',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.black,
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
                  color: Color(0xFFFAF9F0),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Stack(
                  children: [
                    // Main Active Image viewport
                    Positioned.fill(
                      child: Image.network(
                        productImages[selectedImageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Vertical Thumbnail Rail (Right side alignment)
                    Positioned(
                      top: 0,
                      right: 16,
                      bottom: 0,
                      width: 60,
                      child: ListView.builder(
                        itemCount: productImages.length,
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final isCurrent = index == selectedImageIndex;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => selectedImageIndex = index),
                            child: Container(
                              height: 60,
                              margin: const EdgeInsets.only(bottom: 2),
                              decoration: BoxDecoration(
                                color: Colors.white24,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: isCurrent
                                      ? Colors.black87
                                      : Colors.transparent,
                                  width: 1.4,
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(productImages[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
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
                  color: Color(0xFFFAF9F0),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                "Men's Fleece",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Pullover Hoodie",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Price: €97',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.9),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Select size',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(0.9),
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
                            return GestureDetector(
                              onTap: () => setState(() => selectedSize = size),
                              child: Container(
                                width: 44,
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.black
                                      : Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: isSelected
                                        ? Colors.black
                                        : Colors.black12,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  size,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),

                      // Description text segment
                      Text(
                        'Celebrate the power and simplicity of the Swoosh. This warm, brushed fleece hoodie is made with some extra room through the shoulders, chest and body for easy comfort and laid-back, nostalgic style.',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.black54,
                          height: 1.4,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ],
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
                color: Color(0xFFFCFBE3),
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: const Center(
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
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
          color: Color(0xFFE4B793), // Soft tan/terracotta tone
          borderRadius: BorderRadius.all(Radius.circular(32)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // The underlying static text label
            const Text(
              'Discover Now',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
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

// Custom morphing outline ring shape
class BlackRipplePainter extends CustomPainter {
  final double animationValue;
  final Offset tapPosition;

  BlackRipplePainter({required this.animationValue, required this.tapPosition});

  @override
  void paint(Canvas canvas, Size size) {
    if (animationValue == 0.0 || animationValue == 1.0) return;

    // 1. Calculate dynamic progressive size radius based on the container length
    double maxRadius = size.width * 0.11;
    double currentRadius = maxRadius * animationValue;

    // 2. Drive the opacity decay (Fade out gracefully towards the end)
    double opacity = 1.0;
    if (animationValue > 0.6) {
      opacity = 1.0 - ((animationValue - 0.6) / 0.4);
    }

    final Paint paint = Paint()
      ..color = Colors.black.withOpacity(opacity.clamp(0.0, 1.0))
      ..isAntiAlias = true;

    // 3. Interpolation Logic: Morphing from Solid Fill to Outlined Ring
    if (animationValue < 0.4) {
      // Early Stage: Pure solid black growing circle
      paint.style = PaintingStyle.fill;
    } else {
      // Late Stage: Dynamic stroke calculation simulating an expanding shell ring
      paint.style = PaintingStyle.stroke;

      // Gradually thin down the ring stroke as it expands outward
      double maxStrokeWidth = 30.0;
      double normalizedProgress = (animationValue - 0.4) / 0.6;
      paint.strokeWidth = maxStrokeWidth * (1.0 - (normalizedProgress * 0.9));
    }

    // Render the vector sequence centered perfectly over user coordinate inputs
    canvas.drawCircle(tapPosition, currentRadius, paint);
  }

  @override
  bool shouldRepaint(covariant BlackRipplePainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.tapPosition != tapPosition;
  }
}
