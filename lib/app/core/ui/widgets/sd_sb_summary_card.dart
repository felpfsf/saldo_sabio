import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saldo_sabio/app/core/ui/helpers/currency_formatter.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/summary_transaction_model.dart';

class SdSbSummaryCard extends StatelessWidget {
  // final DateTime lastEntry;
  // final String totalAmount;
  // final SummaryType summaryType;
  // final double totalAmount;
  final SummaryTransactionModel? transactions;

  SdSbSummaryCard({
    super.key,
    // required this.lastEntry,
    // required this.totalAmount,
    // required this.summaryType,
    required this.transactions,
  });

  final dateFormat = DateFormat('dd/MM/yyyy');

  String get title {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
        return 'Entradas';
      case RecordTypeEnum.expense:
        return 'Saídas';
      default:
        return 'Total';
    }
  }

  IconData get icon {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
        return SdSbIcons.arrowCircleUp;
      case RecordTypeEnum.expense:
        return SdSbIcons.arrowCircleDown;
      default:
        return SdSbIcons.dollarSign;
    }
  }

  Color get iconColor {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
        return SdSbThemeColors.green;
      case RecordTypeEnum.expense:
        return SdSbThemeColors.red;
      default:
        return SdSbThemeColors.white;
    }
  }

  Color get titleColor {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
        return SdSbThemeColors.green;
      case RecordTypeEnum.expense:
        return SdSbThemeColors.red;
      default:
        return SdSbThemeColors.white;
    }
  }

  Color? get lastEntryColor {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
      case RecordTypeEnum.expense:
        return null;
      default:
        return SdSbThemeColors.gray6;
    }
  }

  Color get bgColor {
    switch (transactions?.recordType) {
      case RecordTypeEnum.income:
      case RecordTypeEnum.expense:
        return SdSbThemeColors.gray3;
      default:
        return SdSbThemeColors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    final shouldShowLastEntry =
        transactions?.recordType != RecordTypeEnum.expense &&
            transactions?.recordType != RecordTypeEnum.income;
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
            // TODO: Add a empty state when there is no transactions
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
                  formatCurrency(transactions?.totalAmount ?? 0),
                  style: SaldoSabioTheme.textXlBold,
                ),
                Visibility(
                  visible: !shouldShowLastEntry,
                  child: Text(
                    'Última atualização em ${dateFormat.format(transactions?.lastEntryDate ?? DateTime.now())}',
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
