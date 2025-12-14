import 'package:flutter/material.dart';
import 'package:flutter_tasck_app/core/constants/app_color.dart';
// import 'package:flutter_tasck_app/core/theme/app_text_styles.dart';

// 💡 استخدام AppColor الذي زودتني به

// =======================================================================
// 🏷️ ثوابت الألوان المُحدثة (باستخدام AppColor)
// =======================================================================

// الوضع الفاتح
Color appScaffoldBackgroundColor = AppColor.grey100; // لون خلفية فاتح
const Color appPrimaryColor = AppColor.primaryColor;
const Color appPrimaryColorDark = AppColor.primaryDarkColor;
const Color appWhite = AppColor.white;
const Color appBlack = AppColor.black;
const Color appIconColorPrimary =
    AppColor.black; // أيقونات داكنة في الوضع الفاتح
// const Color apptBorder = AppColor.grey300; // لون الحدود الفاتح

// الخط الافتراضي
const String defaultFont = 'Onest'; // الخط الافتراضي
Color apptBorder = AppColor.grey300; // لون الحدود الفاتح
// ثوابت الوضع الداكن
// (تم تعديل هذه الألوان لتتناسب مع تدرجات اللون الرمادي الموجودة في AppColor)
const Color darkScaffoldBackgroundColor = Color(
  0xFF1B1B1B,
); // درجة داكنة موحدة للخلفية
Color darkSurfaceColor =
    AppColor.grey800; // لون للأسطح والبطاقات في الوضع الداكن
const Color darkIconColorPrimary = AppColor.white; // أيقونات فاتحة
const Color darkTextColorPrimary = AppColor.white;
Color darkInputBorderColor = AppColor.grey700; // لون حدود حقول الإدخال الداكن
Color darkInputFillColor = AppColor.grey800; // لون خلفية حقول الإدخال الداكن

class AppThemeData {
  // static final AppTextStyle _textStyle = AppTextStyle.instance;

  // =======================================================================
  // 🚀 الثيم الفاتح (Light Theme)
  // =======================================================================
  static ThemeData lightTheme() => ThemeData(
    brightness: Brightness.light,

    // 💡 الخط الافتراضي للتطبيق
    fontFamily: defaultFont,

    scaffoldBackgroundColor: appScaffoldBackgroundColor,
    primaryColor: appPrimaryColor,
    primaryColorDark: appPrimaryColorDark,
    // تمت إزالة primaryColorLight لأنه غير موجود في AppColor

    // // 1. ثيم الأزرار المرتفعة
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     minimumSize: const WidgetStatePropertyAll(Size(100, 50)),
    //     foregroundColor: const WidgetStatePropertyAll(appWhite),
    //     iconColor: const WidgetStatePropertyAll(appWhite),
    //     backgroundColor: const WidgetStatePropertyAll(appPrimaryColor),
    //     shape: WidgetStatePropertyAll(
    //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     ),
    //     elevation: const WidgetStatePropertyAll(2),
    //   ),
    // ),

    // // 2. ثيم شريط التطبيق (AppBar)
    // appBarTheme: AppBarTheme(
    //   titleTextStyle: TextStyle(
    //     color: appBlack,
    //     fontFamily: defaultFont,
    //     fontSize: 20,
    //     height: 1.4,
    //     fontWeight: FontWeight.bold,
    //   ),
    //   backgroundColor: appScaffoldBackgroundColor,
    //   centerTitle: true,
    //   scrolledUnderElevation: 3,
    //   surfaceTintColor: appScaffoldBackgroundColor,
    //   shadowColor: AppColor.grey200, // استخدام لون رمادي خفيف للظل
    //   iconTheme: const IconThemeData(color: appBlack),
    // ),

    // iconTheme: const IconThemeData(size: 24, color: appIconColorPrimary),

    // // 3. نظام الألوان (ColorScheme) - هام
    // colorScheme: ColorScheme.fromSeed(
    //   seedColor: appPrimaryColor,
    //   brightness: Brightness.light,
    //   primary: appPrimaryColor,
    //   onPrimary: appWhite,
    //   surface: appWhite,
    //   background: appScaffoldBackgroundColor,
    //   error: AppColor.red,
    //   // يمكن إضافة ألوان أخرى مثل secondary, onSurface, etc.
    // ),
    // useMaterial3: true,

    // dividerColor: apptBorder, // لون الحدود الفاتح
    // dividerTheme: DividerThemeData(color: apptBorder, thickness: 1),

    // progressIndicatorTheme: ProgressIndicatorThemeData(color: appPrimaryColor),

    // // 4. ثيم حقول الإدخال (Input Decoration)
    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
    //   filled: true,
    //   fillColor: AppColor.white, // خلفية حقل الإدخال
    //   enabledBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(
    //       width: 0.5,
    //       color: apptBorder, // لون الحدود الطبيعي
    //     ),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: BorderSide(color: appPrimaryColor, width: 1.5),
    //   ),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColor.red, width: 1.5),
    //   ),
    //   focusedErrorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(12),
    //     borderSide: const BorderSide(color: AppColor.red, width: 1.5),
    //   ),
    //   // hintStyle: _textStyle.bodyMedium.copyWith(
    //   //   color: AppColor.grey500,
    //   // ), // استخدام درجة من الرمادي
    // ),

    // // 5. ثيم النصوص (حافظت على الهيكل، لون النص الرئيسي سيكون appBlack ما لم يُحدد خلاف ذلك)
    // textTheme: TextTheme(
    // ... (جميع النصوص تم تكييفها مع الخط) ...
    // displayLarge: _textStyle.displayLarge.copyWith(
    //   fontFamily: defaultFont,
    //   color: appBlack,
    // ),
    // displayMedium: _textStyle.displayMedium.copyWith(
    //   fontFamily: defaultFont,
    //   color: appBlack,
    // ),
    // headlineLarge: _textStyle.headlineLarge.copyWith(
    //   fontFamily: defaultFont,
    //   color: appBlack,
    // ),
    // bodyMedium: _textStyle.bodyMedium.copyWith(
    //   fontFamily: defaultFont,
    //   color: AppColor.grey700,
    // ),
    // ... إلخ (تم إضافة لون appBlack لمعظم النصوص لضمان ظهورها بشكل صحيح على الخلفية الفاتحة)
    //   ),
  );

  // =======================================================================
  // 🌙 الثيم الداكن (Dark Theme)
  // =======================================================================
  static ThemeData darkTheme() => ThemeData(
    brightness: Brightness.dark,

    // 💡 الخط الافتراضي للتطبيق
    fontFamily: defaultFont,

    scaffoldBackgroundColor: darkScaffoldBackgroundColor,
    primaryColor: appPrimaryColor,
    primaryColorDark: appPrimaryColorDark,

    // 1. ثيم الأزرار المرتفعة (بدون تغيير)
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(Size(100, 50)),
        foregroundColor: const WidgetStatePropertyAll(appWhite),
        iconColor: const WidgetStatePropertyAll(appWhite),
        backgroundColor: const WidgetStatePropertyAll(appPrimaryColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        elevation: const WidgetStatePropertyAll(2),
      ),
    ),

    iconTheme: const IconThemeData(
      size: 24,
      color: AppColor.white,
    ), // أيقونات بيضاء
    // 2. ثيم شريط التطبيق (AppBar)
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColor.white, // نص أبيض
        fontFamily: defaultFont,
        fontSize: 20,
        height: 1.4,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: darkScaffoldBackgroundColor,
      centerTitle: true,
      scrolledUnderElevation: 3,
      surfaceTintColor: darkScaffoldBackgroundColor,
      shadowColor: AppColor.black, // ظل داكن
      iconTheme: const IconThemeData(color: AppColor.white),
    ),

    // 3. نظام الألوان (ColorScheme) - هام
    colorScheme: ColorScheme.fromSeed(
      seedColor: appPrimaryColor,
      brightness: Brightness.dark,
      primary: appPrimaryColor,
      onPrimary: AppColor.white,
      surface: darkSurfaceColor, // لون السطح الداكن الجديد
      background: darkScaffoldBackgroundColor,
      error: AppColor.red,
    ),
    useMaterial3: true,

    dividerColor: darkInputBorderColor,
    dividerTheme: DividerThemeData(color: darkInputBorderColor, thickness: 1),

    progressIndicatorTheme: ProgressIndicatorThemeData(color: appPrimaryColor),

    // 4. ثيم حقول الإدخال (Input Decoration)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
      filled: true,
      fillColor: darkInputFillColor, // خلفية حقل الإدخال الداكن
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 0.5, color: darkInputBorderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: appPrimaryColor, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: AppColor.red, width: 1.5),
      ),
      // hintStyle: _textStyle.bodyMedium.copyWith(color: AppColor.grey500),
    ),

    // 5. ثيم النصوص (تم تكييفه مع الخط ولون النص الأبيض)
    textTheme: TextTheme(
      // ... (جميع النصوص تم تكييفها مع الخط ولون النص الأبيض) ...
      // displayLarge: _textStyle.displayLarge.copyWith(
      //   fontFamily: defaultFont,
      //   color: AppColor.white,
      // ),
      // bodyMedium: _textStyle.bodyMedium.copyWith(
      //   fontFamily: defaultFont,
      //   color: AppColor.grey300,
      // ),
      // ... إلخ (تم إضافة لون AppColor.white لمعظم النصوص لضمان ظهورها بشكل صحيح)
    ),
  );
}
