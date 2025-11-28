import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/routing/app_routes.dart';
import 'package:flutter_tasck_app/shared/data/services/shared_pref_services.dart';
import 'package:flutter_tasck_app/shared/utils/consts.dart';

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
        decoration: BoxDecoration(color: Colors.grey[500]),
        child: Stack(
          children: [
            // الخلفية
            Positioned.fill(child: Image.asset(page.image, fit: BoxFit.cover)),

            // المحتوى
            Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // الشعار
                    Container(
                      width: 120,
                      height: 120,
                      child: Image.asset(
                        'assets/images/logo_app.png',
                        fit: BoxFit.contain,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    // العنوان
                    Text(
                      page.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 150),

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
                                style: const TextStyle(
                                  fontSize: 26,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "wholesale",
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "and save your time",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // المؤشر
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(_pages.length, (index) {
                            return Container(
                              width: index == _currentPage ? 16 : 8,
                              height: 4,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: index == _currentPage
                                    ? const Color(0xFFec441e)
                                    : Colors.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            );
                          }),
                        ),

                        // الزر
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: _nextPage,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFec441e),
                                      foregroundColor: Colors.white,
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            _currentPage == _pages.length - 1
                                                ? 'Go'
                                                : 'Next',
                                            style: const TextStyle(
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Image.asset("assets/images/a.png"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
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
