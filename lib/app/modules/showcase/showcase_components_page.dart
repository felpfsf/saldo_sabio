import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_icons.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_loader.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_logo.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_selector.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_summary_card.dart';
import 'package:saldo_sabio/app/models/summary_type.dart';

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
              // Logo
              const SizedBox(height: 20),
              const Text(
                'Logo',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: SdSbLogo(),
              ),
              // Selector
              const SizedBox(height: 20),
              const Text(
                'Selector',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const TestSelector(),
              const SizedBox(height: 20),
              const Text(
                'Input',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  SdSbFormField(
                    label: 'Label',
                  ),
                ],
              ),
              // Buttons
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
                  SdSbButton(
                    label: 'Elevated Button',
                    onPressed: () {},
                  ),
                  const SizedBox(height: 20),
                  SdSbButton(
                    label: 'Outilined Button',
                    onPressed: () {},
                    buttonType: ButtonType.outlined,
                  ),
                  const SizedBox(height: 20),
                  SdSbButton(
                    width: 48,
                    height: 48,
                    icon: const Icon(SdSbIcons.search),
                    onPressed: () {},
                    buttonType: ButtonType.outlined,
                  ),
                ],
              ),
              // Cards
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
                  // SdSbSummaryCard(
                  //   lastEntry: DateTime.now(),
                  //   totalAmount: 141243.21,
                  //   summaryType: SummaryType.income,
                  // ),
                  // const SizedBox(height: 20),
                  // SdSbSummaryCard(
                  //   lastEntry: DateTime.now(),
                  //   totalAmount: 141243.21,
                  //   summaryType: SummaryType.expense,
                  // ),
                  // const SizedBox(height: 20),
                  // SdSbSummaryCard(
                  //   lastEntry: DateTime.now(),
                  //   totalAmount: 141243.21,
                  //   summaryType: SummaryType.total,
                  // ),
                  const SizedBox(height: 20),
                  // const SdSbTransactionsCard(
                  //   amount: 14000,
                  //   category: 'Venda',
                  //   date: '26/06/2024',
                  //   title: 'Desenvolvimento de aplicação',
                  //   transactionType: TransactionType.income,
                  // ),
                  // const SizedBox(height: 20),
                  // const SdSbTransactionsCard(
                  //   amount: 65,
                  //   category: 'Alimentação',
                  //   date: '26/06/2024',
                  //   title: 'Almoço',
                  //   transactionType: TransactionType.expense,
                  // ),
                ],
              ),
              // Loader
              const SizedBox(height: 20),
              const Text(
                'Loader',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.amber,
                ),
              ),
              const SizedBox(height: 20),
              const Center(
                child: SdSbLoader(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestSelector extends StatefulWidget {
  const TestSelector({super.key});

  @override
  State<TestSelector> createState() => _TestSelectorState();
}

class _TestSelectorState extends State<TestSelector> {
  String _selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SdSbSelector<String>(
                value: 'Option 1',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                label: 'Entrada',
                selectorType: SelectorType.income,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: SdSbSelector<String>(
                value: 'Option 2',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value;
                  });
                },
                label: 'Saída',
                selectorType: SelectorType.expense,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Selected Value: $_selectedValue',
          style: SaldoSabioTheme.textBase,
        ),
      ],
    );
  }
}
