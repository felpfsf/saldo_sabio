import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';

class SdSbTransactionsCard extends StatelessWidget {
  final TransactionModel transaction;

  SdSbTransactionsCard({
    super.key,
    required this.transaction,
  });

  final dateFormat = DateFormat('dd/MM/yyyy');

  @override
  Widget build(BuildContext context) {
    late final isExpense = transaction.recordType == RecordTypeEnum.expense;
    print(transaction.category.userId);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: SdSbThemeColors.gray2,
          width: 1,
        ),
      ),
      color: SdSbThemeColors.gray3,
      child: SizedBox(
        height: 140,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                transaction.title,
                style: SaldoSabioTheme.textBase,
              ),
              Text(
                isExpense
                    ? '- R\$ ${transaction.amount.toStringAsFixed(2)}'
                    : 'R\$ ${transaction.amount.toStringAsFixed(2)}',
                style: SaldoSabioTheme.textXlBold.copyWith(
                  color:
                      isExpense ? SdSbThemeColors.red : SdSbThemeColors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        SdSbIcons.tag,
                        size: 16,
                        color: SdSbThemeColors.gray5,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        transaction.category.title,
                        style: SaldoSabioTheme.textPlaceholder,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        size: 16,
                        color: SdSbThemeColors.gray5,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        dateFormat.format(transaction.date),
                        style: SaldoSabioTheme.textPlaceholder,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
