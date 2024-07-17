import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_dropdown.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_selector.dart';
import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction_controller.dart';

class ManageTransaction extends StatefulWidget {
  final ManageTransactionController _controller;

  const ManageTransaction({
    super.key,
    required ManageTransactionController controller,
  }) : _controller = controller;

  @override
  State<ManageTransaction> createState() => _ManageTransactionState();
}

class _ManageTransactionState extends State<ManageTransaction> {
  final formKey = GlobalKey<FormState>();
  final titleEC = TextEditingController();
  final descriptionEC = TextEditingController();
  final amountEC = TextEditingController();
  final ValueNotifier<int?> _selectedCategoryVN = ValueNotifier<int?>(null);

  final CurrencyTextInputFormatter _currencyFormatter =
      CurrencyTextInputFormatter.currency(
    locale: 'pt_BR',
    symbol: 'R\$ ',
  );

  RecordTypeEnum _selectedTransactionType = RecordTypeEnum.income;

  @override
  void initState() {
    super.initState();
    widget._controller.getCategories();
  }

  @override
  void dispose() {
    titleEC.dispose();
    descriptionEC.dispose();
    amountEC.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final formValid = formKey.currentState?.validate() ?? false;

    if (formValid) {
      final title = titleEC.text;
      final description = descriptionEC.text;
      final amount = _currencyFormatter.getUnformattedValue();

      debugPrint('Title => $title');
      debugPrint('Description => $description');
      debugPrint('Amount => $amount');
      debugPrint('Category => ${_selectedCategoryVN.value}');
      debugPrint('Transaction Type => $_selectedTransactionType');

      // Send transaction to backend

      Navigator.of(context).pop();
    } else {
      // Show error message
    }
  }

  @override
  Widget build(BuildContext context) {
    final categories = context
        .select<ManageTransactionController, List<CategoryModel>>(
            (controller) => controller.categories)
        .map((t) => {
              'id': t.id,
              'label': t.title,
            })
        .toList();

    return Form(
      key: formKey,
      child: Column(
        children: [
          SdSbFormField(label: 'Título', controller: titleEC),
          const SizedBox(height: 12),
          SdSbFormField(
            label: 'Descrição',
            controller: descriptionEC,
          ),
          const SizedBox(height: 12),
          SdSbFormField(
            label: 'Valor',
            controller: amountEC,
            keyboardType: TextInputType.number,
            inputFormatter: [
              FilteringTextInputFormatter.digitsOnly,
              _currencyFormatter
            ],
          ),
          const SizedBox(height: 12),
          SdSbDropdown(
            items: categories,
            selectedVN: _selectedCategoryVN,
            hintText: 'Categoria',
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: SdSbSelector<RecordTypeEnum>(
                  value: RecordTypeEnum.income,
                  groupValue: _selectedTransactionType,
                  onChanged: (value) {
                    setState(() {
                      _selectedTransactionType = value;
                    });
                  },
                  label: 'Entrada',
                  selectorType: SelectorType.income,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SdSbSelector<RecordTypeEnum>(
                  value: RecordTypeEnum.expense,
                  groupValue: _selectedTransactionType,
                  onChanged: (value) {
                    setState(() {
                      _selectedTransactionType = value;
                    });
                  },
                  label: 'Saída',
                  selectorType: SelectorType.expense,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          SdSbButton(
            onPressed: _onSubmit,
            label: 'Cadastrar',
          )
        ],
      ),
    );
  }
}
