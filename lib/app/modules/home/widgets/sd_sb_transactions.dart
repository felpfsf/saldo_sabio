import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_transactions_card.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';

class Transactions extends StatelessWidget {
  const Transactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Transações'),
              Text('4 items'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                child: SdSbFormField(
                  label: 'Busque por uma transação',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                ),
              ),
              const SizedBox(width: 12),
              SdSbButton(
                width: 48,
                height: 48,
                icon: const Icon(SdSbIcons.search),
                onPressed: () {},
                buttonType: ButtonType.outlined,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Column(
            children: context
                .select<HomeController, List<TransactionModel>>(
                  (controller) => controller.allTransactions,
                )
                .map((t) => SdSbTransactionsCard(transaction: t))
                .toList(),
          ),
        ],
      ),
    );
  }
}
