import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/saldo_sabio_icons.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_buttom.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_summary_card.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_transactions_card.dart';
import 'package:saldo_sabio/app/core/ui/widgets/ssd_sb_form_field.dart';

class ShowcaseComponentsPage extends StatelessWidget {
  const ShowcaseComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: kToolbarHeight),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Components Showcase',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Input',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              SaldoSabioFormField(
                label: 'Label',
              ),
              const SizedBox(height: 20),
              const Text(
                'Buttons',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SaldoSabioButtom(
                    label: 'Elevated Button',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  SaldoSabioButtom(
                    label: 'Outilined Button',
                    onPressed: () {},
                    buttonType: ButtonType.outlined,
                  ),
                  const SizedBox(height: 20),
                  SaldoSabioButtom(
                    width: 48,
                    height: 48,
                    icon: const Icon(SaldoSabioIcons.search),
                    onPressed: () {},
                    buttonType: ButtonType.outlined,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Cards',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  const SizedBox(height: 20),
                  SdSbSummaryCard(
                    lastEntry: DateTime.now(),
                    totalAmount: 'R\$ 14.000,00',
                    summaryType: SummaryType.income,
                  ),
                  const SizedBox(height: 20),
                  SdSbSummaryCard(
                    lastEntry: DateTime.now(),
                    totalAmount: 'R\$ 14.000,00',
                    summaryType: SummaryType.expense,
                  ),
                  const SizedBox(height: 20),
                  SdSbSummaryCard(
                    lastEntry: DateTime.now(),
                    totalAmount: 'R\$ 14.000,00',
                    summaryType: SummaryType.total,
                  ),
                  const SizedBox(height: 20),
                  const SdSbTransactionsCard(
                    amount: 'R\$ 14.000,00',
                    category: 'Venda',
                    date: '26/06/2024',
                    title: 'Desenvolvimento de aplicação',
                    transactionType: TransactionType.income,
                  ),
                  const SizedBox(height: 20),
                  const SdSbTransactionsCard(
                    amount: 'R\$ 65,00',
                    category: 'Alimentação',
                    date: '26/06/2024',
                    title: 'Almoço',
                    transactionType: TransactionType.expense,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
