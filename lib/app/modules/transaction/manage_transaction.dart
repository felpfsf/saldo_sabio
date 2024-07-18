import 'dart:developer';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_listener_notifier.dart';
import 'package:saldo_sabio/app/core/ui/helpers/format_date.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_dropdown.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_selector.dart';
import 'package:saldo_sabio/app/models/category_model.dart';
import 'package:saldo_sabio/app/models/record_type_enum.dart';
import 'package:saldo_sabio/app/modules/transaction/manage_transaction_controller.dart';
import 'package:validatorless/validatorless.dart';

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
  final titleEC = TextEditingController(text: 'Teste #1');
  final descriptionEC = TextEditingController(text: 'Descrição #1');
  final amountEC = TextEditingController();

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

    SdSbListenerNotifier(sdsbNotifier: widget._controller).listener(
      context: context,
      onSuccess: (notifier, listener) {
        listener.dispose();
        Navigator.of(context).pop();
      },
      onError: (notifier, listener) {
        listener.dispose();
      },
    );
  }

  @override
  void dispose() {
    titleEC.dispose();
    descriptionEC.dispose();
    amountEC.dispose();
    super.dispose();
  }

  Future<void> selecteDate(BuildContext context) async {
    final dateTimeNow = DateTime.now();
    final firstDate = dateTimeNow.subtract(const Duration(days: 5 * 365));
    final lastDate = dateTimeNow.add(const Duration(days: 5 * 365));

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (context.mounted) {
      context.read<ManageTransactionController>().pickedDate = pickedDate;
    }
  }

  void _onSubmit() {
    final formValid = formKey.currentState?.validate() ?? false;

    switch (formValid) {
      case false:
        log('Erro ao validar o formulário');
        break;
      case true:
        log('Formulário válido');
        final title = titleEC.text;
        final description = descriptionEC.text;
        final amount = _currencyFormatter.getUnformattedValue();

        widget._controller.saveTransaction(
          title: title,
          description: description,
          amount: amount,
          recordType: _selectedTransactionType,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateButtonLabel = Selector<ManageTransactionController, DateTime?>(
      selector: (context, controller) => controller.pickedDate,
      builder: (context, value, child) {
        if (value == null) {
          return const Text('Selecionar data');
        }
        return Text(formatDate(value));
      },
    );

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
          SdSbFormField(
            label: 'Título',
            controller: titleEC,
            validator: Validatorless.multiple([
              Validatorless.required('Campo obrigatório'),
              Validatorless.min(3, 'Ao menos 3 caracteres')
            ]),
          ),
          const SizedBox(height: 12),
          SdSbFormField(
            label: 'Descrição',
            controller: descriptionEC,
            validator: Validatorless.multiple([
              Validatorless.required('Campo obrigatório'),
              Validatorless.min(3, 'Ao menos 3 caracteres')
            ]),
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
            validator: Validatorless.multiple([
              Validatorless.required('Campo obrigatório'),
              Validatorless.min(1, 'Ao menos 1 caractere'),
            ]),
          ),
          const SizedBox(height: 12),
          SdSbDropdown(
            items: categories,
            selectedVN:
                context.read<ManageTransactionController>().selectedCategoryVN,
            hintText: 'Categoria',
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 36),
              ),
              icon: const Icon(Icons.calendar_today),
              onPressed: () => selecteDate(context),
              label: dateButtonLabel,
            ),
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
