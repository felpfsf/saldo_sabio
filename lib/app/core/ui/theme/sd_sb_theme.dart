import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';

sealed class SaldoSabioTheme {
  static final _robotoFF = GoogleFonts.robotoTextTheme();

  static final _defaultInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(
      color: SdSbThemeColors.gray1,
    ),
  );

  static ThemeData themeData = ThemeData(
    textTheme: _robotoFF,
    //
    scaffoldBackgroundColor: SdSbThemeColors.gray2,
    //
    appBarTheme: const AppBarTheme(
      backgroundColor: SdSbThemeColors.gray2,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: SdSbThemeColors.gray1,
      labelStyle: textPlaceholder,
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      errorBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      disabledBorder: _defaultInputBorder.copyWith(
        borderSide: const BorderSide(color: SdSbThemeColors.gray5),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: SdSbThemeColors.green,
        foregroundColor: SdSbThemeColors.white,
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
        foregroundColor: SdSbThemeColors.greenLight,
        side: const BorderSide(color: SdSbThemeColors.greenLight),
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
    color: SdSbThemeColors.white,
  );

  static const textSmRegular = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: SdSbThemeColors.gray5,
  );

  static const textPlaceholder = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: SdSbThemeColors.gray5,
  );

  static const textLgRegular = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: SdSbThemeColors.gray6,
  );

  static const text2XlBold = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: SdSbThemeColors.white,
  );

  static const textBase = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: SdSbThemeColors.gray6,
  );

  static const textBaseThin = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: SdSbThemeColors.gray5,
  );

  static const textXlBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: SdSbThemeColors.white,
  );
}
