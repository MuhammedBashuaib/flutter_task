// // lib/core/themes/app_text_style.dart

// import 'package:flutter/material.dart';
// import 'package:flutter_tasck_app/shared/utils/sizes.dart';

// /// سيتم تغيير هذا اللون ديناميكياً داخل AppThemeData حسب الوضع (فاتح/داكن)
// const Color appTextColorPrimary = AppColors.textPrimary;

// /// لون النص الثانوي (للتسميات والنصوص الوصفية)
// const Color appTextColorSecondary = AppColors.textSecondary;

// const String defaultFont = 'Swissra';

// class AppTextStyle {
//   // 1. 🚀 نمط Singleton لضمان وجود نسخة واحدة
//   static final AppTextStyle instance = AppTextStyle._internal();
//   factory AppTextStyle() => instance;
//   AppTextStyle._internal();

//   // 💡 دالة مساعدة لتطبيق الخط الافتراضي (إذا لم يكن محدداً بالفعل)
//   TextStyle _applyDefaultFont(TextStyle style) {
//     // نضمن تطبيق الخط الافتراضي فقط إذا لم يكن style محددًا بالفعل
//     if (style.fontFamily == null) {
//       return style.copyWith(fontFamily: defaultFont);
//     }
//     return style;
//   }

//   // =======================================================================
//   // 2. 📝 تحديد أنماط النصوص (Text Theme Keys)
//   //    (مع تحديد الأوزان الأكثر منطقية لكل نمط)
//   // =======================================================================

//   // A. أنماط العرض (Display Styles)
//   TextStyle get displayLarge => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 57),
//       fontWeight: FontWeight.w900, // وزن ثقيل جداً
//     ),
//   );
//   TextStyle get displayMedium => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 45),
//       fontWeight: FontWeight.w800, // وزن ثقيل
//     ),
//   );
//   TextStyle get displaySmall => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 36),
//       fontWeight: FontWeight.w800,
//     ),
//   );

//   // B. أنماط العناوين (Headline Styles)
//   TextStyle get headlineLarge => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 32),
//       fontWeight: FontWeight.w700, // Bold
//     ),
//   );
//   TextStyle get headlineMedium => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 28),
//       fontWeight: FontWeight.w700,
//     ),
//   );
//   TextStyle get headlineSmall => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 24),
//       fontWeight: FontWeight.w700,
//     ),
//   );

//   // C. أنماط العناوين الفرعية (Title Styles)
//   TextStyle get titleLarge => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 22),
//       fontWeight: FontWeight.w600, // Semi-Bold
//     ),
//   );
//   TextStyle get titleMedium => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 16),
//       fontWeight: FontWeight.w600,
//     ),
//   );
//   TextStyle get titleSmall => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 14),
//       fontWeight: FontWeight.w600,
//     ),
//   );

//   // D. أنماط التسميات (Label Styles)
//   TextStyle get labelLarge => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 14),
//       fontWeight: FontWeight.w500, // Medium
//     ),
//   );
//   TextStyle get labelMedium => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 12),
//       fontWeight: FontWeight.w500,
//     ),
//   );
//   TextStyle get labelSmall => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 11),
//       fontWeight: FontWeight.w500,
//     ),
//   );

//   // E. أنماط الجسم (Body Styles)
//   TextStyle get bodyLarge => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 16),
//       fontWeight: FontWeight.w400, // Regular
//     ),
//   );
//   TextStyle get bodyMedium => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 14),
//       fontWeight: FontWeight.w400,
//     ),
//   );
//   TextStyle get bodySmall => _applyDefaultFont(
//     TextStyle(
//       color: appTextColorPrimary,
//       fontSize: fontSize(size: 12),
//       fontWeight: FontWeight.w400,
//     ),
//   );
// }
