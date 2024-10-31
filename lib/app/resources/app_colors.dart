import 'package:flutter/material.dart';

@immutable
class AppColors {
  const AppColors._();

  // Colors
  static const Color primary = Color(0xFFDF3850);

  static const MaterialColor materialPrimary = MaterialColor(
    0xFF2DC653,
    <int, Color>{
      50: Color(0x992DEEAA),
      100: Color(0x992DEEAA),
      200: Color(0x992DEEAA),
      300: Color(0x992DEEAA),
      400: Color(0x992DEEAA),
      500: Color(0x992DEEAA),
      600: Color(0x992DEEAA),
      700: Color(0x992DEEAA),
      800: Color(0x992DEEAA),
      900: Color(0x992DEEAA),
    },
  );

  // Text Color
  static const Color primaryText = Color(0xFF233258);

  // Other Color
  static const Color navigationBar = Color(0xFF0D1B2A);
  static const Color splash = Color(0x992DEEAA);
  static const Color black = Color(0xFF232323);
  static const Color gray = Color(0xFF929292);
  static const Color lightGray = Color(0xFFDEDEDE);
  static const Color lighterGray = Color(0xFFF6F6F6);
  static const Color dark20 = Color(0x33232330);
  static const Color error = Color(0xFF910017);
  static const Color warning = Color(0xFFFDB913);
  static const Color success = Color(0xFF0EAD69);
  static const Color info = Color(0xFF39A0FF);
  static const Color background = Color(0xFFF3F5F7);
  static const Color errorBackground = Color(0xFFFFEFEB);
  static const Color divider = Color(0xFFDFDEDE);
  static const Color profileBottomGradient = Color.fromARGB(255, 0, 115, 29);
  static const Color white = Colors.white;
  static const Color transparent = Colors.transparent;
  static const Color primary600 = Color(0xFFDF3850);
  static const Color accent600 = Color(0xFFE45536);
  static const Color accent700 = Color(0xFFDF3850);
  static const Color semanticError500 = Color(0xFFFF4A4A);
  static const Color primary100 = Color(0xFFFEE5E5);
  static const Color neutral300 = Color(0xFFD3D3D3);
  static const Color semanticInformation500 = Color(0xFF39A0FF);
  static const Color semanticSuccess500 = Color(0xFF7BC760);
  static const Color remarkBg = Color(0xFFFFF2EC);
  static final Color baseColorShimmer = Colors.grey[100]!;
  static const Color highlightColorShimmer = Color(0xFFe0e0e2);
}
