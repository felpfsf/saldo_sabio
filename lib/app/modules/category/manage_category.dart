import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_listener_notifier.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/modules/category/manage_category_controller.dart';
import 'package:validatorless/validatorless.dart';

class ManageCategory extends StatefulWidget {
  final ManageCategoryController _controller;

  const ManageCategory({
    super.key,
    required ManageCategoryController controller,
  }) : _controller = controller;

  @override
  State<ManageCategory> createState() => _ManageCategoryState();
}

class _ManageCategoryState extends State<ManageCategory> {
  final formKey = GlobalKey<FormState>();
  final titleEC = TextEditingController(text: 'Teste #1');

  @override
  void initState() {
    super.initState();
    final sdsbListenerNotifier =
        SdSbListenerNotifier(sdsbNotifier: widget._controller);
    sdsbListenerNotifier.listener(
      context: context,
      onSuccess: (notifier, listener) {
        log('Success');
        listener.dispose();
        Navigator.of(context).pop();
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    titleEC.dispose();
  }

  void _saveCategory() {
    final formValid = formKey.currentState?.validate() ?? false;

    switch (formValid) {
      case false:
        log('Formulário inválido');
        break;
      case true:
        final title = titleEC.text.trim();
        widget._controller.addCategory(title);
      // Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          SdSbFormField(
            label: 'Nome da categoria',
            controller: titleEC,
            validator: Validatorless.multiple(
              [
                Validatorless.required('Campo obrigatório'),
                Validatorless.min(3, 'Deve ter no mínimo 3 caracteres'),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SdSbButton(
            onPressed: _saveCategory,
            label: 'Salvar',
          ),
        ],
      ),
    );
  }
}
