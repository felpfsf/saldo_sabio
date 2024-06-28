import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';

enum TransactionType { expense, income }

class SdSbTransactionsCard extends StatelessWidget {
  final String title;
  final String category;
  final String date;
  final String amount;
  final TransactionType transactionType;

  const SdSbTransactionsCard({
    super.key,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.transactionType,
  });

  @override
  Widget build(BuildContext context) {
    final isExpense = transactionType == TransactionType.expense;

    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(
          color: SdSbThemeColors.gray2,
          width: 1,
        ),
      ),
      contentPadding: const EdgeInsets.all(20),
      tileColor: SdSbThemeColors.gray3,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: SaldoSabioTheme.textBase,
            ),
            const SizedBox(height: 8),
            Text(
              isExpense ? '- $amount' : amount,
              style: SaldoSabioTheme.textXlBold.copyWith(
                color: isExpense
                    ? SdSbThemeColors.red
                    : SdSbThemeColors.green,
              ),
            )
          ],
        ),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(SdSbIcons.tag, size: 16),
              const SizedBox(width: 8),
              Text(category, style: SaldoSabioTheme.textPlaceholder),
            ],
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month, size: 16),
              const SizedBox(width: 8),
              Text(date, style: SaldoSabioTheme.textPlaceholder),
            ],
          )
        ],
      ),
    );
  }
}
