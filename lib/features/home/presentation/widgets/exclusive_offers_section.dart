// import 'package:flutter/material.dart';
// import 'package:flutter_tasck_app/core/constants/app_color.dart';
// import 'package:flutter_tasck_app/shared/utils/sizes.dart';

// class ExclusiveOffersSection extends StatelessWidget {
//   const ExclusiveOffersSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     initializeHWFSize(context);

//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
//       padding: EdgeInsets.all(wScreen * 0.04),
//       decoration: BoxDecoration(
//         color: Colors.orange[100],
//         borderRadius: BorderRadius.circular(wScreen * 0.05),
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Placeholder Text Area for Description',
//                   style: TextStyle(
//                     fontSize: fontSize(size: 16),
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: hScreen * 0.01),
//                 ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColor.primaryColor,
//                     padding: EdgeInsets.symmetric(
//                       horizontal: wScreen * 0.05,
//                       vertical: hScreen * 0.01,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(wScreen * 0.05),
//                     ),
//                   ),
//                   child: Text(
//                     'Reserve Now',
//                     style: TextStyle(
//                       fontSize: fontSize(size: 12),
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(width: wScreen * 0.02),
//           Container(
//             width: wScreen * 0.2,
//             height: hScreen * 0.15,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(wScreen * 0.0375),
//             ),
//             child: Center(
//               child: Icon(
//                 Icons.local_drink,
//                 size: fontSize(size: 40),
//                 color: Colors.grey[700],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// تأكد أن هذه المسارات صحيحة في مشروعك
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';
import 'dart:async';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
// (يجب إضافة حزمة smooth_page_indicator في pubspec.yaml)

class ExclusiveOffersSection extends StatefulWidget {
  const ExclusiveOffersSection({super.key});

  @override
  State<ExclusiveOffersSection> createState() => _ExclusiveOffersSectionState();
}

class _ExclusiveOffersSectionState extends State<ExclusiveOffersSection> {
  // عدد الصفحات الإعلانية
  final int _numPages = 3;
  // المتحكم الخاص بالصفحة
  final PageController _pageController = PageController(initialPage: 0);
  // مؤقت للحركة التلقائية
  Timer? _timer;
  // الصفحة الحالية
  int _currentPage = 0;

  // قائمة ببيانات الإعلانات باللغة الإنجليزية
  final List<Map<String, dynamic>> _offers = [
    {
      'color': Colors.orange.shade100,
      'title': 'Exclusive Discount: 50% Off Cold Beverages!',
      'icon': Icons.local_drink_rounded,
      'buttonText': 'Order Now',
    },
    {
      'color': Colors.green.shade100,
      'title': 'Today\'s Offer: Free Breakfast with Table Reservation.',
      'icon': Icons.restaurant_menu_rounded,
      'buttonText': 'Book Your Table',
    },
    {
      'color': Colors.purple.shade100,
      'title': 'New Arrival: Try Our Special Chocolate Cake!',
      'icon': Icons.cake_rounded,
      'buttonText': 'View Offer',
    },
  ];

  @override
  void initState() {
    super.initState();
    // بدء الحركة التلقائية عند إنشاء الودجت
    _startAutoScroll();
  }

  // دالة لبدء الحركة التلقائية
  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < _numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    // إيقاف المؤقت والمتحكم عند إغلاق الودجت
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  // ودجت لإنشاء كل صفحة إعلانية
  Widget _buildOfferPage(BuildContext context, Map<String, dynamic> offer) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: wScreen * 0.04),
      padding: EdgeInsets.all(wScreen * 0.04),
      decoration: BoxDecoration(
        color: offer['color'] as Color,
        borderRadius: BorderRadius.circular(wScreen * 0.05),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // توسيط عمودي
              children: [
                Text(
                  offer['title'] as String,
                  style: TextStyle(
                    fontSize: fontSize(size: 16),
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: hScreen * 0.015),
                ElevatedButton(
                  onPressed: () {
                    // يمكنك إضافة الإجراء المناسب هنا
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: wScreen * 0.04,
                      vertical: hScreen * 0.01,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(wScreen * 0.04),
                    ),
                    elevation: 4, // إضافة ظل بسيط
                  ),
                  child: Text(
                    offer['buttonText'] as String,
                    style: TextStyle(
                      fontSize: fontSize(size: 12),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: wScreen * 0.03),
          // تم تقليل ارتفاع الكونتينر وجعله مربعاً ليكون أكثر تناسقاً
          Container(
            width: wScreen * 0.25,
            height: wScreen * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(wScreen * 0.04),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Icon(
                offer['icon'] as IconData,
                size: fontSize(size: 40),
                // استخدام دالة darken لجعل لون الأيقونة أغمق
                color: (offer['color'] as Color).darken(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: hScreen * 0.03),
        // 1. حاوية الـ PageView (الشريحة الإعلانية المتحركة)
        SizedBox(
          height: hScreen * 0.18, // ارتفاع مناسب للحاوية
          child: PageView.builder(
            controller: _pageController,
            itemCount: _numPages,
            // تحديث الصفحة الحالية عند التمرير اليدوي
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final offer = _offers[index % _offers.length];
              return _buildOfferPage(context, offer);
            },
          ),
        ),

        // 2. النقاط الدلالية (Indicators) بالشكل الأطول
        SizedBox(height: hScreen * 0.02),
        SmoothPageIndicator(
          controller: _pageController,
          count: _numPages,
          // استخدام ExpandingDotsEffect لزيادة طول النقطة النشطة
          effect: ExpandingDotsEffect(
            spacing: 8.0,
            dotWidth: 10.0,
            dotHeight: 10.0,
            expansionFactor: 4.0, // يجعل النقطة النشطة أطول
            activeDotColor: AppColor.primaryColor,
            dotColor: Colors.grey.shade400,
          ),
          onDotClicked: (index) {
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ],
    );
  }
}

// دالة توسيع لتغميق لون الخلفية لأيقونة (مطلوبة لتشغيل الكود)
extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}
