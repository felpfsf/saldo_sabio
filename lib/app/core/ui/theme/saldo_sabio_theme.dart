import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saldo_sabio/app/core/ui/theme/saldo_sabio_colors.dart';

sealed class SaldoSabioTheme {
  static final _robotoFF = GoogleFonts.robotoTextTheme();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: SaldoSabioThemeColors.gray1,
    ),
  );

  static ThemeData themeData = ThemeData(
    textTheme: _robotoFF,
    //
    scaffoldBackgroundColor: SaldoSabioThemeColors.gray2,
    //
    appBarTheme: const AppBarTheme(
      backgroundColor: SaldoSabioThemeColors.gray2,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: SaldoSabioThemeColors.gray1,
      labelStyle: textPlaceholder,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      disabledBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: SaldoSabioThemeColors.gray5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: SaldoSabioThemeColors.green,
        foregroundColor: SaldoSabioThemeColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: SaldoSabioTheme.textButton,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(),
        backgroundColor: Colors.transparent,
        foregroundColor: SaldoSabioThemeColors.greenLight,
        side: const BorderSide(color: SaldoSabioThemeColors.greenLight),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        textStyle: SaldoSabioTheme.textButton,
      ),
    ),
  );

  static const textButton = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: SaldoSabioThemeColors.white,
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
