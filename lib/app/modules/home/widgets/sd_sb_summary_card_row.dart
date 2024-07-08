import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_summary_card.dart';
import 'package:saldo_sabio/app/models/summary_type.dart';

class SummaryCardRow extends StatelessWidget {
  const SummaryCardRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SdSbSummaryCard(
            lastEntry: DateTime.now(),
            totalAmount: 'R\$ 14.000,00',
            summaryType: SummaryType.income,
          ),
          SdSbSummaryCard(
            lastEntry: DateTime.now(),
            totalAmount: 'R\$ 14.000,00',
            summaryType: SummaryType.expense,
          ),
          SdSbSummaryCard(
            lastEntry: DateTime.now(),
            totalAmount: 'R\$ 14.000,00',
            summaryType: SummaryType.total,
          ),
        ],
      ),
    );
  }
}