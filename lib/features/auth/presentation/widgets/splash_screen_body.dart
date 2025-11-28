import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/features/auth/data/models/user_model.dart';
import 'package:flutter_tasck_app/shared/data/services/shared_pref_services.dart';
import 'package:flutter_tasck_app/shared/data/services/storage_service.dart';
import 'package:flutter_tasck_app/shared/utils/consts.dart';

class SplashScreenBody extends StatefulWidget {
  const SplashScreenBody({super.key});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
  bool? isInfoScreen;
  @override
  void initState() {
    super.initState();
    isInfoScreen = Prefs.getBool(SharedPreferencesConst.isInfoScreen);
    _checkAuthAndNavigate();
  }

  Future<void> _checkAuthAndNavigate() async {
    final storageService = StorageService();

    // 1. التحقق من وجود توكن
    final token = await storageService.getAccessToken();

    if (token != null && token.isNotEmpty) {
      // 2. إذا كان التوكن موجود - التحقق من صحة الجلسة
      final isValid = await storageService.hasValidToken();

      if (isValid) {
        // 3. الجلسة سليمة - جلب بيانات المستخدم والتوجه للهوم
        final UserModel? user = await storageService.getCurrentUser();
        Navigator.of(context).pushReplacementNamed(
          AppRoutes.mainScreen,
          arguments: user, // إرسال بيانات المستخدم
        );
      } else {
        // 4. الجلسة منتهية - التوجه للوقن
        Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
      }
    } else if (isInfoScreen ?? false) {
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
    } else {
      Navigator.of(context).pushReplacementNamed(AppRoutes.onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ecommerce app',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(), // مؤشر تحميل
          ],
        ),
      ),
    );
  }
}
