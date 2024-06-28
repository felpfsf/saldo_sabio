import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

enum SelectorType { income, expense }

class SdSbSelector<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T> onChanged;
  final String label;
  final SelectorType selectorType;

  const SdSbSelector({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.selectorType = SelectorType.income,
  });

  bool get isSelected => value == groupValue;

  Color get bgColor =>
      isSelected ? SdSbThemeColors.green : SdSbThemeColors.gray3;

  Color get iconColor => isSelected
      ? SdSbThemeColors.white
      : selectorType == SelectorType.income
          ? SdSbThemeColors.green
          : SdSbThemeColors.red;

  Color get textColor =>
      isSelected ? SdSbThemeColors.white : SaldoSabioTheme.textBase.color!;

  IconData get iconData => selectorType == SelectorType.income
      ? SdSbIcons.arrowCircleUp
      : SdSbIcons.arrowCircleDown;

  Color get splashColor => selectorType == SelectorType.income
      ? SdSbThemeColors.green.withOpacity(0.3)
      : SdSbThemeColors.red.withOpacity(0.3);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(value),
      splashColor: splashColor,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: bgColor,
        ),
        child: Row(
          children: [
            Icon(
              iconData,
              color: iconColor,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: SaldoSabioTheme.textBase.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
//   onPressed: () {},
//   style: ElevatedButton.styleFrom(
//     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//     backgroundColor: SdSbThemeColors.gray3,
//   ),
//   child: const Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Icon(
//         SdSbIcons.arrowCircleUp,
//         color: SdSbThemeColors.green,
//       ),
//       SizedBox(width: 8),
//       Text(
//         'Entrada',
//         style: SaldoSabioTheme.textBase,
//       ),
//     ],
//   ),
// );