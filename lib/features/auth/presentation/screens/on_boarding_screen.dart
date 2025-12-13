import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/shared/data/services/shared_pref_services.dart';
import 'package:flutter_tasck_app/shared/utils/consts.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;

  // بيانات الصفحات
  final List<OnboardingPage> _pages = [
    OnboardingPage(
      title: 'Replaced by text',
      description: 'Shop smart wholesale and save your time',
      image: 'assets/images/background.png',
    ),
    OnboardingPage(
      title: 'Replaced by text',
      description: 'Order in bulk with just a few taps',
      image: 'assets/images/background.png',
    ),
    OnboardingPage(
      title: 'Replaced by text',
      description: 'Get your products delivered fast and fresh',
      image: 'assets/images/background.png',
    ),
  ];

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      setState(() {
        _currentPage++;
      });
    } else {
      Prefs.setBool(SharedPreferencesConst.isInfoScreen, true);
      Navigator.of(context).pushReplacementNamed(AppRoutes.loginScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    final page = _pages[_currentPage];

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: AppColor.grey500),
        child: Stack(
          children: [
            // الخلفية
            Positioned.fill(child: Image.asset(page.image, fit: BoxFit.cover)),

            // المحتوى
            Center(
              child: Padding(
                padding: EdgeInsets.all(wScreen * 0.08), // responsive
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الشعار
                    Container(
                      width: wScreen * 0.30,
                      height: wScreen * 0.30,
                      child: Image.asset(
                        'assets/images/logo_app.png',
                        fit: BoxFit.contain,
                        color: AppColor.white,
                      ),
                    ),

                    SizedBox(height: hScreen * 0.015),

                    // العنوان
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: fontSize(size: 30),
                        fontWeight: FontWeight.w900,
                        color: AppColor.white,
                      ),
                    ),

                    SizedBox(height: hScreen * 0.18),

                    // الوصف
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Shop smart",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: fontSize(size: 26),
                                  color: AppColor.red,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "wholesale",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: fontSize(size: 24),
                                  color: AppColor.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "and save your time",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: fontSize(size: 24),
                            color: AppColor.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: hScreen * 0.05),

                    // المؤشر
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (index) {
                            return Container(
                              width: index == _currentPage
                                  ? wScreen * 0.04
                                  : wScreen * 0.02,
                              height: hScreen * 0.005,
                              margin: EdgeInsets.symmetric(
                                horizontal: wScreen * 0.01,
                              ),
                              decoration: BoxDecoration(
                                color: index == _currentPage
                                    ? AppColor.primaryColor
                                    : AppColor.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(
                                  wScreen * 0.01,
                                ),
                              ),
                            );
                          }),
                        ),

                        // الزر
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(wScreen * 0.08),
                          ),
                          width: wScreen * 0.40,
                          child: Padding(
                            padding: EdgeInsets.all(wScreen * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: wScreen * 0.12,
                                  height: wScreen * 0.12,
                                  child: ElevatedButton(
                                    onPressed: _nextPage,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor,
                                      foregroundColor: AppColor.white,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          wScreen * 0.06,
                                        ),
                                      ),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(
                                          wScreen * 0.006,
                                        ),
                                        child: Text(
                                          _currentPage == _pages.length - 1
                                              ? 'Go'
                                              : 'Next',
                                          style: TextStyle(
                                            fontSize: fontSize(size: 18),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  "assets/images/a.png",
                                  width: wScreen * 0.10,
                                  height: wScreen * 0.10,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: hScreen * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OnboardingPage {
  final String title;
  final String description;
  final String image;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });
}
