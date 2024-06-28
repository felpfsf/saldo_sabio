import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

enum SummaryType { expense, income, total }

class SdSbSummaryCard extends StatelessWidget {
  final DateTime lastEntry;
  final String totalAmount;
  final SummaryType summaryType;

  SdSbSummaryCard({
    super.key,
    required this.lastEntry,
    required this.totalAmount,
    required this.summaryType,
  });

  final dateFormat = DateFormat('dd/MM/yyyy');

  String get title {
    switch (summaryType) {
      case SummaryType.total:
        return 'Total';
      case SummaryType.income:
        return 'Entradas';
      case SummaryType.expense:
        return 'Saídas';
      default:
        return '';
    }
  }

  IconData get icon {
    switch (summaryType) {
      case SummaryType.income:
        return SdSbIcons.arrowCircleUp;
      case SummaryType.expense:
        return SdSbIcons.arrowCircleDown;
      default:
        return SdSbIcons.dollarSign;
    }
  }

  Color get iconColor {
    switch (summaryType) {
      case SummaryType.income:
        return SdSbThemeColors.green;
      case SummaryType.expense:
        return SdSbThemeColors.red;
      case SummaryType.total:
        return SdSbThemeColors.white;
      default:
        return SdSbThemeColors.white;
    }
  }

  Color get titleColor {
    switch (summaryType) {
      case SummaryType.total:
        return SdSbThemeColors.white;
      case SummaryType.income:
        return SdSbThemeColors.green;
      case SummaryType.expense:
        return SdSbThemeColors.red;
      default:
        return SdSbThemeColors.white;
    }
  }

  Color? get lastEntryColor {
    switch (summaryType) {
      case SummaryType.total:
        return SdSbThemeColors.gray6;
      case SummaryType.income:
      case SummaryType.expense:
        return null;
      default:
        return SdSbThemeColors.white;
    }
  }

  Color get bgColor {
    switch (summaryType) {
      case SummaryType.total:
        return SdSbThemeColors.green;
      case SummaryType.income:
      case SummaryType.expense:
        return SdSbThemeColors.gray3;
      default:
        return SdSbThemeColors.gray3;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: SdSbThemeColors.gray2,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.all(20),
      titleAlignment: ListTileTitleAlignment.top,
      tileColor: bgColor,
      title: Text(
        title,
        style: SaldoSabioTheme.textBase.copyWith(color: titleColor),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(totalAmount, style: SaldoSabioTheme.textXlBold),
            Visibility(
              visible: summaryType != SummaryType.total,
              child: Text(
                'Última atualização em ${dateFormat.format(lastEntry)}',
                style: SaldoSabioTheme.textSmRegular.copyWith(
                  color: lastEntryColor,
                ),
              ),
            ),
          ],
        ),
      ),
      minVerticalPadding: 10,
      trailing: Icon(
        icon,
        size: 32,
        color: iconColor,
      ),
    );
  }
}
