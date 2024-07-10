import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saldo_sabio/app/core/ui/helpers/currency_formatter.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/models/summary_type.dart';

class SdSbSummaryCard extends StatelessWidget {
  final DateTime lastEntry;
  // final String totalAmount;
  final SummaryType summaryType;
  final double totalAmount;

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: SdSbThemeColors.gray2,
          width: 1,
        ),
      ),
      color: bgColor,
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        // TODO: Set up a callback to change bg color, icon color and text color OR change border color based on the summary type
        onTap: () {},
        // TODO: Change splash color based on the summary type
        splashColor: Colors.amber,
        child: SizedBox(
          height: 150,
          width: 280,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style:
                          SaldoSabioTheme.textBase.copyWith(color: titleColor),
                    ),
                    Icon(
                      icon,
                      size: 24,
                      color: iconColor,
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  // fo.symbolOnLeft,
                  formatCurrency(totalAmount),
                  style: SaldoSabioTheme.textXlBold,
                ),
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
        ),
      ),
    );
  }
}
