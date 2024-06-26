import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saldo_sabio/app/core/theme/saldo_sabio_colors.dart';

sealed class SaldoSabioTheme {
  static final _robotoFF = GoogleFonts.robotoTextTheme();

  static ThemeData themeData = ThemeData(
    textTheme: _robotoFF,
  );

  static const textSmRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: SaldoSabioThemeColors.gray5,
  );

  static const textPlaceholder = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: SaldoSabioThemeColors.gray5,
  );

  static const textLgRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: SaldoSabioThemeColors.gray6,
  );

  static const text2XlBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: SaldoSabioThemeColors.white,
  );

  static const textBase = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: SaldoSabioThemeColors.gray6,
  );

  static const textBaseThin = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: SaldoSabioThemeColors.gray5,
  );

  static const textXlBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: SaldoSabioThemeColors.white,
  );
}
