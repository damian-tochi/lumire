# Lumière

A Flutter fashion e-commerce application built with a clean, feature-first architecture. Lumière provides a seamless shopping experience with an onboarding flow, product discovery, and detailed product views.
Inspired by the UI and micro-interactions of the curated concept on [Dribbble](https://dribbble.com/shots/24747396-Lumi-re-Fashion-mobile-app).

## Features

- **Onboarding Screen** - Engaging animated onboarding with auto-scrolling banner cards and a discover call-to-action
- **Shop Discovery** - Browse products by category (Trending, Shoes, Sweatshirts, Shirts, Bags) with search functionality
- **Product Detail** - Detailed product view with size selection, add-to-cart, and like/favorite functionality
- **Custom Animations** - Smooth page transitions and animated UI elements
- **Dark Theme** - Elegant dark-themed UI with carefully curated color palette

## Tech Stack

- **Flutter** - Cross-platform UI framework
- **Dart** - Programming language
- **Material Design** - UI components and theming

## Prerequisites

- Flutter SDK (>= 3.11.4)
- Dart SDK (>= 3.11.4)
- Android Studio / Xcode (for platform-specific builds)
- CocoaPods (for iOS builds)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/damian-tochi/lumire
cd lumire
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

```bash
# Run on connected device/emulator
flutter run

# Run on specific OS
flutter run -d ios       # iOS
flutter run -d android   # Android
```

### 4. Build for Production

```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS
flutter build ios --release

```

## Android APK download:
[Download](https://drive.google.com/file/d/1sZ0r0ZH7xN0aB9KbZ8N-9o9VovTj802o/view?usp=sharing)


## Project Architecture

The project follows a **feature-first architecture** with clean separation of concerns:

```
lib/
├── app.dart                    # App entry point and MaterialApp configuration
├── main.dart                   # Main function entry
├── core/                       # Core/shared functionality
│   ├── constants/              # App-wide constants
│   │   ├── app_colors.dart     # Color palette definitions
│   │   └── app_strings.dart    # String constants
│   └── theme/                  # Theming
│       └── app_theme.dart      # Theme configuration
├── data/                       # Data layer
│   └── models/                 # Data models
│       └── product.dart        # Product model with JSON serialization
├── features/                   # Feature modules
│   ├── onboarding/             # Onboarding feature
│   │   ├── screens/
│   │   │   └── onboarding_screen.dart
│   │   └── widgets/
│   │       ├── animated_discover_button.dart
│   │       └── autoscroll_banner_card.dart
│   └── shop/                   # Shop feature
│       ├── screens/
│       │   ├── product_detail_screen.dart
│       │   └── shop_discovery_screen.dart
│       └── widgets/
│           ├── bottom_nav_bar.dart
│           ├── category_chip.dart
│           ├── image_selection_button.dart
│           ├── like_button.dart
│           ├── product_card.dart
│           └── size_selection_button.dart
└── utils/                      # Shared utilities
    ├── black_ripple.dart
    ├── black_ripple_smaller.dart
    ├── black_ripple_thin.dart
    └── anim/
        ├── animated_bottom_slide_in.dart
        └── animated_page_route.dart
```

### Architecture Principles

- **Feature-First Organization**: Each feature is self-contained with its own screens, widgets, and logic
- **Separation of Concerns**: Core, data, features, and utils are clearly separated
- **Reusable Components**: Shared utilities, themes and constants are placed in `utils/` and `core/`
- **Constants Management**: All strings and colors are centralized in `core/constants/`

## Key Screens

| Screen | Description |
|--------|-------------|
| `OnboardingScreen` | Welcome screen with animated banner and discover button |
| `ShopDiscoveryScreen` | Product catalog with category filtering and search |
| `ProductDetailScreen` | Product details with size selection and cart actions |

## Custom Widgets

- **`AnimatedDiscoverButton`** - Animated CTA button for onboarding
- **`AutoScrollBannerCard`** - Auto-scrolling promotional banner
- **`ProductCard`** - Reusable product display card
- **`LikeButton`** - Favorite/like toggle with animation
- **`SizeSelectionButton`** - Size selector for products
- **`CategoryChip`** - Category filter chip
- **`BottomNavBar`** - Custom bottom navigation

## Animations

- **`AnimatedPageRoute`** - Custom page transition animation
- **`AnimatedBottomSlideIn`** - Bottom slide-in animation utility
- **`BlackRipple`** - Custom ripple effect variants

## Development

### Running Tests

```bash
flutter test
```

### Code Analysis

```bash
flutter analyze
```

### Formatting

```bash
flutter format .
```

## Dependencies

| Package                    | Version | Purpose |
|----------------------------|---------|---------|
| `flutter`(core)            | SDK | Core Flutter framework |
| `cupertino_icons`(default) | ^1.0.8 | iOS-style icons |

## Contact

For questions, support, or inquiries, feel free to open an issue in the repository or reach out directly via email:
<a href="mailto:nkwocha.damian@gmail.com">
  <img src="https://img.shields.io/badge/Gmail-EA4335?style=for-the-badge&logo=gmail&logoColor=white" alt="Gmail Support" />
</a>
