// lib/core/routes/app_routes.dart

import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/auth/presentation/screens/login_screen.dart';
import 'package:flutter_tasck_app/features/auth/presentation/screens/on_boarding_screen.dart';
import 'package:flutter_tasck_app/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter_tasck_app/features/home/data/models/product_model.dart';
import 'package:flutter_tasck_app/features/home/presentation/screens/main_screen.dart';
import 'package:flutter_tasck_app/features/product/presentation/screens/product_details_screen.dart';

class AppRoutes {
  static const String splashScreen = '/';
  static const String onboardingScreen = '/onboarding';
  static const String homeScreen = '/home';
  static const String mainScreen = "/mainScreen";
  static const String loginScreen = "/loginScreen";
  static const String productDetails = "/product-details";

  static const String subCategoryOffersScreen = "/subcategory-offers";
  // static const String loginScreen = '/login';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case onboardingScreen:
        return MaterialPageRoute(builder: (context) => OnboardingScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (context) => const MainScreen());
      // return MaterialPageRoute(
      //   builder: (context) => const ProductDetailsScreen(),
      // );

      case loginScreen:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case productDetails:
        ProductModel product = settings.arguments as ProductModel;
        return MaterialPageRoute(
          builder: (context) => ProductDetailsScreen(product: product),
        );

      // case subCategoryOffersScreen:
      //   String name = settings.arguments as String;

      default:
        return MaterialPageRoute(
          builder: (context) => const Text('Error: Unknown Route'),
        );
    }
  }
}
