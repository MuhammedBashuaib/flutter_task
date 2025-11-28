import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/features/auth/presentation/widgets/splash_screen_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const String routeName = "splash_screen";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashScreenBody());
  }
}
