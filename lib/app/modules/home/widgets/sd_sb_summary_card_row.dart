import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_summary_card.dart';
import 'package:saldo_sabio/app/models/summary_transaction_model.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';

class SummaryCardRow extends StatelessWidget {
  const SummaryCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeTransactions =
        context.select<HomeController, SummaryTransactionModel?>(
      (controller) => controller.incomeTransactions,
    );
    final expenseTransactions =
        context.select<HomeController, SummaryTransactionModel?>(
      (controller) => controller.expenseTransactions,
    );
    final totalTransactions =
        context.select<HomeController, SummaryTransactionModel?>(
      (controller) => controller.totalTransactions,
    );
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SdSbSummaryCard(
            transactions: incomeTransactions,
          ),
          SdSbSummaryCard(
            transactions: expenseTransactions,
          ),
          SdSbSummaryCard(
            transactions: totalTransactions,
          ),
        ],
      ),
    );
  }
}
