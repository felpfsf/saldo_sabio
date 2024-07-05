import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_appbar.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_logo.dart';
import 'package:saldo_sabio/app/modules/auth/register/register_controller.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  void _onSubmit() {
    final formValid = formKey.currentState?.validate() ?? false;

    switch (formValid) {
      case false:
        log('Erro ao validar o formulário');
      case true:
        final email = _emailEC.text;
        final password = _emailEC.text;

        context.read<RegisterController>().registerUser(email, password);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    final heightBody = mq.size.height - mq.padding.top - kToolbarHeight;

    return Scaffold(
      appBar: SdSbAppBar(
        title: 'Cadastrar',
        onLeadingPressed: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          height: heightBody,
          child: Column(
            children: [
              const FittedBox(
                fit: BoxFit.fitHeight,
                child: SdSbLogo(),
              ),
              const SizedBox(height: 24),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    SdSbFormField(
                      label: 'E-mail',
                      controller: _emailEC,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validatorless.multiple([]),
                    ),
                    const SizedBox(height: 18),
                    SdSbFormField(
                      label: 'Senha',
                      controller: _passwordEC,
                      obscureText: true,
                      validator: Validatorless.min(
                          6, 'Senha deve conter pelo menos 6 caracteres'),
                    ),
                    const SizedBox(height: 18),
                    SdSbFormField(
                      label: 'Confirmar Senha',
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.min(
                          6,
                          'Senha deve conter pelo menos 6 caracteres',
                        ),
                        Validatorless.compare(
                          _passwordEC,
                          'Senhas não coincidem',
                        ),
                      ]),
                    ),
                    const SizedBox(height: 18),
                    SdSbButton(
                      label: 'Cadastrar',
                      onPressed: _onSubmit,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
