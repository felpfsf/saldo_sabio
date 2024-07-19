import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_transactions_card.dart';
import 'package:saldo_sabio/app/models/transaction_model.dart';
import 'package:saldo_sabio/app/modules/home/home_controller.dart';

class Transactions extends StatelessWidget {
  // late final StreamSubscription<List<TransactionModel>> _transactionsStream;
  final searchTermVN = ValueNotifier<String>('');

  Transactions({super.key});

  void _onSearch(BuildContext context) {
    final searchTerm = searchTermVN.value.trim();
    debugPrint('🚀 Searching for $searchTerm');
    context.loaderOverlay.show();
    context.read<HomeController>().searchTransactions(searchTerm);
    context.loaderOverlay.hide();
  }

  @override
  Widget build(BuildContext context) {
    final totalTransactions = context
        .select<HomeController, List<TransactionModel>>(
          (c) => c.allTransactions,
        )
        .length;
    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Transações'),
              Text('$totalTransactions items'),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Flexible(
                child: SdSbFormField(
                  label: 'Busque por uma transação',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  onChanged: (value) => searchTermVN.value = value,
                ),
              ),
              const SizedBox(width: 12),
              SdSbButton(
                width: 48,
                height: 48,
                icon: const Icon(SdSbIcons.search),
                onPressed: () => _onSearch(context),
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
