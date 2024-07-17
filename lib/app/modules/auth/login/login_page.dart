import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saldo_sabio/app/core/notifier/sd_sb_listener_notifier.dart';
import 'package:saldo_sabio/app/core/ui/helpers/messages.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_colors.dart';
import 'package:saldo_sabio/app/core/ui/theme/sd_sb_theme.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_button.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_form_field.dart';
import 'package:saldo_sabio/app/core/ui/widgets/sd_sb_logo.dart';
import 'package:saldo_sabio/app/modules/auth/login/login_controller.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void initState() {
    super.initState();
    SdSbListenerNotifier(sdsbNotifier: context.read<LoginController>())
        .listener(
      context: context,
      onSuccess: (notifier, listener) {
        listener.dispose();
        Navigator.of(context).pushNamed('/home');
      },
      onInfo: (notifier, listener) {
        if (notifier is LoginController) {
          if (notifier.hasInfo) {
            Messages.showInfo(context, notifier.infoMessage!);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailEC.dispose();
    passwordEC.dispose();
  }

  void _onSubmit() {
    final formValid = formKey.currentState?.validate() ?? false;

    switch (formValid) {
      case false:
        log('Erro ao validar o formulário');
      case true:
        final email = _emailEC.text;
        final password = _emailEC.text;

        context.read<LoginController>().login(email, password);
    }
  }

  void _signInWithGoogle() {
    context.read<LoginController>().googleSignIn();
  }

  void _redirectToRegister(BuildContext context) {
    Navigator.of(context).pushNamed('/register');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
              minWidth: constraints.maxWidth,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 64),
                const SdSbLogo(),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SdSbFormField(
                          label: 'E-mail',
                          controller: _emailEC,
                          keyboardType: TextInputType.emailAddress,
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo obrigatório'),
                            Validatorless.email('E-mail inválido'),
                          ]),
                        ),
                        const SizedBox(height: 18),
                        SdSbFormField(
                          label: 'Senha',
                          controller: passwordEC,
                          obscureText: true,
                          validator: Validatorless.min(
                            6,
                            'Senha deve conter pelo menos 6 caracteres',
                          ),
                        ),
                        const SizedBox(height: 18),
                        SdSbButton(
                          label: 'Entrar',
                          onPressed: _onSubmit,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                SignInButton(
                  Buttons.google,
                  onPressed: _signInWithGoogle,
                  text: 'Entrar com Google',
                  padding: const EdgeInsets.all(2),
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Não tem uma conta? ',
                      style: SaldoSabioTheme.textSmRegular.copyWith(
                        color: SdSbThemeColors.white,
                      ),
                    ),
                    InkWell(
                      onTap: () => _redirectToRegister(context),
                      child: Text(
                        'Cadastre-se',
                        style: SaldoSabioTheme.textSmRegular.copyWith(
                          color: SdSbThemeColors.greenLight,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
