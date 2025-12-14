import 'package:flutter/material.dart';
// تأكد من أن مسارات ملفاتك صحيحة
import 'package:flutter_tasck_app/core/constants/app_color.dart';
import 'package:flutter_tasck_app/shared/utils/sizes.dart';

// دالة التغميق (تم وضعها خارج الـ class الرئيسي لتبقى متاحة)
extension ColorExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);
    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return hslDark.toColor();
  }
}

class SegmentedButtonTabs extends StatefulWidget {
  // تم ربطها لتمرير التبديل إلى الشاشة الأب (ProductDetailsScreen)
  final Function(int)? onTabChanged;

  const SegmentedButtonTabs({super.key, this.onTabChanged});

  @override
  State<SegmentedButtonTabs> createState() => _SegmentedButtonTabsState();
}

class _SegmentedButtonTabsState extends State<SegmentedButtonTabs> {
  // 0 = About, 1 = Reviews
  int _selectedIndex = 0;

  final GlobalKey _containerKey = GlobalKey();
  double _tabWidth = 0.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _calculateTabWidth();
    });
  }

  void _calculateTabWidth() {
    final RenderBox? renderBox =
        _containerKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox != null) {
      setState(() {
        _tabWidth = renderBox.size.width / 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    initializeHWFSize(context);

    double containerWidth = wScreen * 0.9;
    double containerHeight = hScreen * 0.055;
    Color activeDarkColor = AppColor.primaryColor.darken(0.08);

    // 💡 لحل مشكلة التشوه في الحافة اليمنى:
    // سنستخدم قيمة Offset لضمان تغطية الحدود عند الانتقال.
    double indicatorOffset = _selectedIndex == 0 ? 0 : _tabWidth;

    return Center(
      child: Container(
        key: _containerKey,
        width: containerWidth,
        height: containerHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(containerHeight / 2),
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
        ),
        child: Stack(
          children: [
            // 1. المؤشر المتحرك (Active Button)
            if (_tabWidth > 0)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                left: indicatorOffset,
                // 💡 الحل الرئيسي: زيادة عرض المؤشر قليلاً (مثلاً 1.5 بكسل)
                // لضمان تغطية حدود الـ Container الأب عند الحافة.
                child: Container(
                  width: _tabWidth + 1.5, // زيادة طفيفة في العرض للتغطية
                  height: containerHeight,
                  decoration: BoxDecoration(
                    color: activeDarkColor,
                    // يجب أن نستخدم BorderRadius.only لنتأكد أن الزوايا الداخلية لا تتأثر
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(
                        _selectedIndex == 0 ? containerHeight / 2 : 0,
                      ),
                      bottomLeft: Radius.circular(
                        _selectedIndex == 0 ? containerHeight / 2 : 0,
                      ),
                      topRight: Radius.circular(
                        _selectedIndex == 1 ? containerHeight / 2 : 0,
                      ),
                      bottomRight: Radius.circular(
                        _selectedIndex == 1 ? containerHeight / 2 : 0,
                      ),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: activeDarkColor.withOpacity(0.4),
                        blurRadius: 5,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),

            // 2. الصف الذي يحتوي على الأزرار النصية (يجب أن يكون فوق المؤشر)
            Row(
              children: [
                Expanded(
                  child: _buildTab(context, 'About', 0, containerHeight),
                ),
                Expanded(
                  child: _buildTab(context, 'Reviews', 1, containerHeight),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ودجت بناء كل زر/تبويب
  Widget _buildTab(
    BuildContext context,
    String title,
    int index,
    double containerHeight,
  ) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
          widget.onTabChanged?.call(index);
        });
      },
      child: Container(
        // 🔑 التعديل هنا: استخدام خاصية width: double.infinity
        // هذا يضمن أن الـ Container الذي يغلف النص يملأ الـ Expanded بالكامل أفقياً.
        width: double.infinity,
        height: containerHeight,
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: fontSize(size: 14),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
